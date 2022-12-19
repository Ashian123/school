exports.index = (req, res) => {
res.render("admin/lesson_page.ejs");
};

exports.staff_index = (req, res) => {
res.render("staff/Staff_timetable.ejs");
};

exports.data_handler = (req, res) => {
	console.log("Lesson Handling module ... ");
	if(req.body.swtch == "getLessons") {
	//var	sql = `select name,node,class from ${schema}.table_handler where name = '${req.body.t_name}' `;
	var	sql = `SELECT * from ${schema}.lessons WHERE lessons.subject_id = '${req.body.s_id}' `
			db.query(sql, (err, data) => {
			console.log(sql);	
			res.send(data);	
			if (err) console.log(err);
			});
	}
	
	if(req.body.swtch == "addLessons") {
	console.log("add_lessons_task ");
		var sql = `insert into ${schema}.lessons (subject_id,name) values (${req.body.s_id},'${req.body.l_name}')`;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}	


	if(req.body.swtch == "update_lesson") {
	console.log("update_lesson ");
		var sql = `update ${schema}.lessons set name = '${req.body.l_name}' where id = ${req.body.lesson_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
	if(req.body.swtch == "delete_lesson") {
	console.log("delete_lesson ");
		var sql = `delete from ${schema}.lessons where id = ${req.body.lesson_id} `;
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