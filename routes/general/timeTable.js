exports.timetable = (req, res) => {
  var { user_type } = req.token;
  console.log(user_type);
  var { user_id } = req.token; console.log(user_id);
  var userType = {
    Admin: "admin/student-timetable-admintask.ejs",
	sadmin: "sadmin/student-timetable-admintask.ejs",
	itdmin: "itadmin/student-timetable-admintask.ejs",
    Staff: "staff/student-timetable-stafftask.ejs",
  };
  if(user_type != "Staff"){
  res.render(userType[user_type], { user: "", });
  }
  else{
    //let sql = `select id,subject,cand_name,cand_id from ${schema}.teacher_details where cand_id = '${user_id}' `;
	let sql = `SELECT table_handler.*,course_details.course_title,course_details.course FROM table_handler LEFT JOIN course_details ON course_details.id = table_handler.class_id WHERE table_handler.teacher_id = (select id from school.teacher_details where cand_id = '${user_id}' LIMIT 1) GROUP BY class_id `;	
			db.query(sql, (err, data) => { console.log(sql); console.log(data);
			res.render(userType[user_type], { class_data: JSON.stringify(data) });
			//res.send(data);	
			if (err) console.log(err);
			});
  
  }
};

exports.save_timetable = (req, res) => {
  var { course_title, course, year, semester, table_struct, table_values } =
    req.body;
  table_struct = JSON.stringify(table_struct);
  table_values = JSON.stringify(table_values);
  var sql = `select count(*) as exist from ${schema}.student_time_table where course_title ='${course_title}' and course = '${course}'`;
  db.query(sql, (err, data) => {
    if (data[0].exist) {
      var sql = `update ${schema}.student_time_table set table_struct = '${table_struct}',table_values='${table_values}',last_modified_time=now() where course_title ='${course_title}' and course = '${course}'`;
      db.query(sql, (err, data) => res.send("Table Updated Successfully"));
    } else {
      var sql = `insert into ${schema}.student_time_table (course_title,course,year,semester,table_struct,table_values,last_modified_time) values ('${course_title}','${course}','${year}','${semester}','${table_struct}','${table_values}',now())`;
      db.query(sql, (err, data) => {
        if (err) console.log(err);
        res.send("Table Inserted Successfully..!");
      });
    }
  });
};


exports.slot_appointment = (req, res) => {
	if(req.body.swtch == "store") {
	var data = JSON.parse(req.body.data);
	var t_design = req.body.t_design;
	var t_data = req.body.t_data;
	console.log("save data");
	console.log(data);
	t_design = t_design.replace(/'/g, '&#39;');
	var dsql = `delete from ${schema}.table_handler where class_id = ${req.body.cs_id} `;
	db.query(dsql, (err, del_data) => {
		for (var i in data) {
		var sql = `insert into ${schema}.table_handler (period,teacher_id,class_id,subject_id) values ('${data[i].period}',${data[i].teacher_id},${req.body.cs_id},${data[i].subject_id} )`;
			console.log(sql);
			db.query(sql, (err, data) => {
			var td_sql = `update ${schema}.course_details set t_design = '${t_design}', t_data = '${t_data}'  where id = ${req.body.cs_id} `;
			db.query(td_sql, (err, data) => { if (err) console.log(err);  }); });
		}
	});	
	res.send("Table Inserted Successfully..!");		
	}
	
	if(req.body.swtch == "slotcheck") {
	var sql = "";
		sql = `select * from ${schema}.table_handler `;
		
			db.query(sql, (err, data) => {
			res.send(JSON.stringify(data));	
			if (err) console.log(err);
			});
	}
	
	if(req.body.swtch == "get_class_teachers") {	
	console.log("get class teachers ");
		var sql = `select all_teacher, teacher from ${schema}.course_details where id = ${req.body.class_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}	
	
	if(req.body.swtch == "teacher_subjects") {	
	console.log("get teacher involved subjects ");
		var sql = `select id,cand_id,cand_name,subject from ${schema}.teacher_details where id IN (${req.body.teachers_ids}) `;
			db.query(sql, (err, data) => {
				console.log(sql);
			res.send(data);	
			if (err) console.log(err);
			});
	}	
	
	if(req.body.swtch == "load_table") {
	console.log("load_table ");
		var sql = `select t_design,t_data from ${schema}.course_details where id = ${req.body.class_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
	
	if(req.body.swtch == "teacher_view") {
	console.log("teacher_view ");
		var sql = `select t_design from ${schema}.course_details where id = ${req.body.class_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}		

};