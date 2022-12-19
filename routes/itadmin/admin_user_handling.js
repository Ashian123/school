// Teacher Additional tasks
const { Select, Insert, Update } = require("../modal/query");
const { encrypt } = require("../../auth/auth");

exports.index = (req, res) => {
res.render("itadmin/user_details.ejs");
};

exports.user_data_task = (req, res) => {
	if(req.body.swtch == "viewall") {
	var	sql = `SELECT * from  ${schema}.user_details WHERE user_type = "Admin" or user_type = "itadmin" or user_type = "sadmin" `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
	
	if(req.body.swtch == "add_d_data") {
	console.log("add_d_data");
	let ePass = encrypt(req.body.user_pass).toUpperCase();
		var sql = `insert into ${schema}.user_details (user_id,name,user_type,password) values 
		('${req.body.user_id}','${req.body.user_name}','${req.body.user_type}','${ePass}' )  `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}	
	if(req.body.swtch == "update_d_data") {
	console.log("update_d_data");
		var sql = `update ${schema}.teacher_tasks set name = '${req.body.task}' where id = ${req.body.task_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
		if(req.body.swtch == "delete_d_data") {
	console.log("delete_d_data");
		var sql = `delete from ${schema}.teacher_tasks where id = ${req.body.task_id} `;
			db.query(sql, (err, data) => {
			res.send(data);	
			if (err) console.log(err);
			});
	}
		if(req.body.swtch == "store_task") {
	console.log("store_task");
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