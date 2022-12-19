var nodemailer = require('nodemailer');
const sgMail = require('@sendgrid/mail')

function select(table = "",take = [], where = '') {
if(!table){return false;}
if(!where){where = 1;}
return new Promise(resolve => {
let sql = `SELECT ${array_convt(take)} FROM ${table} WHERE 1 AND ${where} `;
//console.log(sql);
db.query(sql, (err, data) => {
resolve(data || err);
});
});
};

function qry(sql = "") {
console.log(sql);
if(!sql){return false;}
return new Promise(resolve => {
db.query(sql, (err, data) => {
resolve(data || err); //console.log(sql);
});
});
};

function t_count(table = "",where ="" ,join = "") {
if(!table){return false;} if(!join){ join = table }
let sql = where?`SELECT count(DISTINCT(${table}.id)) as total FROM ${join} WHERE 1 ${where} `:`SELECT count(id) as total FROM ${table} `;
return new Promise(resolve => {
db.query(sql, (err, data) => {	
//console.log(sql);
resolve(data[0]['total'] || err);
});
});
};

function t_c_count(table = "",where ="" ,col = "",join = "") {
if(!table){return false;} if(!join){ join = table }
let sql = where?`SELECT count(DISTINCT(${table}.id)) as total, SUM(${col}) as sum FROM ${join} WHERE 1 ${where} `:`SELECT count(id) as total, SUM(${col}) as sum FROM ${table} `;
return new Promise(resolve => {
db.query(sql, (err, data) => {	
//console.log(sql);
resolve(data[0]['sum'] || err);
});
});
};

function insert(table = "",insert_data = []){
if(!table || insert_data.length == 0){console.log('0sss'); return false; }
let set = data_convert(insert_data);
return new Promise(resolve => {
let sql = `INSERT INTO ${table} (${set.keys}) VALUES (${set.vals}) `;
//console.log(sql);
db.query(sql, (err, data) => {
resolve(data || err);
//console.log(data,err);
});
});
};

function update(table = "",update_data = [], con = ''){
if(!table || update_data.length == 0 || con == 0 ){console.log('0sss'); return false; }
console.log(update_data.data_id); 
let set = data_update_convert(update_data);
return new Promise(resolve => {
let sql = `UPDATE ${table}  set   ${set}   WHERE 1 and ${con} `;
console.log(sql);
db.query(sql, (err, data) => {
resolve(data || err);
console.log(data,err);
});
});
};

function del(table = "",where ="") {
if(!table || where == "" ){return false;} 
let sql = where?`DELETE FROM ${table} WHERE ${where} `:` `;
return new Promise(resolve => {
db.query(sql, (err, data) => {	
console.log(sql);
resolve(data|| err);
});
});
};

// Commin function for crud...
function array_convt(data){ return data==""?['*']:data.join(); }

function data_convert(data = []){
var keys = [],vals = [];
for (const [key, value] of Object.entries(data)) {
  if(key != 'id' && key != 'data_id' && key != 'data_action' ) {
  //keys.push(key);
  keys.push('`'+apos(key)+'`');
  //vals.push(`'`+apos(value)+`'`);
  (value==Number(value))?vals.push(value):vals.push(`'`+apos(value)+`'`);
  }
}
keys.push('updated_at');
vals.push('now()');
return {keys: keys.join(),vals:vals.join()};
}

function data_update_convert(data = []){
	console.log(data);
var vals = [];
for (const [key, value] of Object.entries(data)) {
  if(key != 'id' && key != 'data_id' && key != 'data_action' ) {	
  (value==Number(value))?vals.push(key+` = `+(value)+` `):vals.push(key+` = '`+apos(value)+`' `);
  }
}
vals.push(' updated_at = now() ');
return vals.join();
}
// end common functions

function apos(str) {  return  (str==Number(str))?str:str.replace(/'/g, '&apos;'); }




//send email 1234
async function sendEmail(email, html = "",subject = "") { 		console.log('sending mails');
		if(!email || !html) { console.log('sending mails false');return false; }
		let mailset = await crud.select(`web_settings`,['options'],`name = 'mail_settings'`);
		let m_setting = JSON.parse(mailset[0].options);
		console.log(m_setting.mail_type);  //return false;
		
	if(m_setting.mail_type == "n_mail")	{
	console.log('node normal Mail sending...');
    var email = email;
    var token = token;
    var mail = nodemailer.createTransport({
        service: 'gmail',
        auth: 	{
            user: m_setting.n_mail_name, // Your email id
            pass: m_setting.n_mail_password // Your password
				}});
    var mailOptions = {
        from: 'Psvimal33329@gmail.com',
        to: email,
        subject: subject,
        //html: '<p>You requested for email verification, kindly use this <a href="http://localhost:3000/verify-email?token=' + token + '">link</a> to verify your email address</p>'
		html:html
    };
    mail.sendMail(mailOptions, function(error, info) {
        if (error) {
			console.log('Email sent: ' + error.response);
            return 1
        } else {
			console.log('Email sent: ' + info.response);
            return 1
        }
    });

	
	} else { // if sg api selected
		console.log('node sg Mail sending...');
	//sgMail.setApiKey(process.env.SENDGRID_API_KEY)
	sgMail.setApiKey(m_setting.sg_api)
	const msg = {
	to: email, 
	from: 'vimal@gelogic.in', 
	subject: subject,
	text: 'and easy to do anywhere, even with Node.js',
	html: html,
	}
	sgMail
	.send(msg)
	.then(() => {
	console.log('Email sent by sendgrid')
	})
	.catch((error) => {
	console.error(error)
	})
	}
	
}

//sendEmail(['alphaachilis@gmail.com', 'psvimalraj333@gmail.com'],'121212121212','test Token');

function log(data = []) {
if(!table){return false;}
return new Promise(resolve => {
resolve(insert('log',data));
});
};



const crud = {
  select: select,
  insert: insert,
  update: update,
  del: del,
  t_count,t_count,
  qry:qry,
  apos:apos,
  sendEmail:sendEmail,
  t_c_count:t_c_count,
  log:log
};
module.exports = crud;