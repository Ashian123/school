const { getSingleTeacher } = require("../admin/Teacher");

exports.index = (req, res) => {
res.render("admin/Teacher_timetable.ejs");
};

exports.staff_index = async (req, res) => {
  var { user_id } = req.token;
  let sql = `select id,subject,cand_name,cand_id from ${schema}.teacher_details where cand_id = '${user_id}' `;
			db.query(sql, (err, data) => {
			res.render("staff/Staff_timetable.ejs",{user:data[0]});
			//res.send(data);	
			if (err) console.log(err);
			});


};

exports.data_handler = (req, res) => {
	if(req.body.swtch == "teacher_datas") {
	//var	sql = `select name,node,class from ${schema}.table_handler where name = '${req.body.t_name}' `;
	var	sql = `SELECT table_handler.*,  course_details.course_title as c_name, course_details.course as c_section FROM ${schema}.table_handler LEFT JOIN ${schema}.course_details ON table_handler.class_id = course_details.id WHERE table_handler.teacher_id = '${req.body.t_name}' `
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

};

// Teacher Additional tasks
exports.additional_task_index = (req, res) => {
res.render("admin/Teacher_additional_task.ejs");
};
exports.additional_task = (req, res) => {
	if(req.body.swtch == "viewall") {
	var	sql = `SELECT * from  ${schema}.teacher_tasks `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
	
	if(req.body.swtch == "getTeachertask") {
	var	sql = `SELECT * from  ${schema}.teacher_additional_task where name = '${req.body.t_name}' `;
			db.query(sql, (err, data) => {
			console.log(sql);	
			res.send(data);	
			if (err) console.log(err);
			});
	}	
	
	if(req.body.swtch == "add_teacher_task") {
	console.log("add_teacher_task ");
		var sql = `insert into ${schema}.teacher_tasks (name) values ('${req.body.task}')`;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}	
	if(req.body.swtch == "update_teacher_task") {
	console.log("update_teacher_task ");
		var sql = `update ${schema}.teacher_tasks set name = '${req.body.task}' where id = ${req.body.task_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
		if(req.body.swtch == "delete_teacher_task") {
	console.log("delete_teacher_task ");
		var sql = `delete from ${schema}.teacher_tasks where id = ${req.body.task_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
		if(req.body.swtch == "store_task") {
	console.log("store_task ");
	data = JSON.parse(req.body.task);
	var dsql = `delete from ${schema}.teacher_additional_task where name = ${req.body.t_name} `;
	db.query(dsql, (err, del_data) => {
		for (var i in data) {
		var sql = `insert into ${schema}.teacher_additional_task (node,name,task) values ('${data[i].period}','${req.body.t_name}','${data[i].task}')`;
			db.query(sql, (err, data) => { });
		}
	res.send(del_data);	
	});
	}	

};