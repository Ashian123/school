const { Select } = require("../../modal/query");

exports.timeTable = async (req, res) => {
  var { cand_id, course_title, course } = req.token;
  var { year, semester } = req.body;

  var tbl = new Select({
    table: "student_time_table",
    col: ["student_time_table.table_struct", "student_time_table.table_values"],
    where: `course_title='${course_title}' 
    and course='${course}'`,
    // and year='${year}'
    // and semester='${semester}',
  });
  var table = await tbl.find();
  return await table;
};

exports.subjects = async (req, res) => {
function qry(sql) {
console.log(sql);
if(!sql){return false;}
return new Promise(resolve => {
db.query(sql, (err, data) => {
resolve(data || err); //console.log(sql);
});
});
};
return await  qry("SELECT cand_name,subject  FROM `teacher_details`");
};