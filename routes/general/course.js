exports.getcourse = (req, res) => {
  var value = {
    GET: function () {
      db.query(
        `select distinct course_title from ${schema}.course_details order by course_title`,
        (err, data) => {
          res.send(data);
        }
      );
    },
    POST: function () {
      var { course } = req.body;
      var sql = `select * from ${schema}.course_details where course_title = '${course}'`;
      db.query(sql, (err, data) => {
        res.send(data);
      });
    },
    PUT: function () {
      var { course_title, course, teacher, allTeacher } = JSON.parse(
        req.body.data
      );
      var sql = `select count(*) as count from ${schema}.course_details where course_title = '${course_title}' and course = '${course}'`;
      db.query(sql, (err, count) => {
        if (count[0].count) {
          db.query(
            `update ${schema}.course_details set course_title = '${course_title}',course='${course}',teacher ='${teacher}',all_teacher ='${JSON.stringify(
              allTeacher
            )}'
             where course_title = '${course_title}' and course ='${course}'`,
            (err, data) => res.send("Updated successfully...!")
          );
        } else {
          db.query(
            `insert into ${schema}.course_details (course_title,course,teacher,all_teacher) values('${course_title}','${course}','${teacher}','${JSON.stringify(
              allTeacher
            )}')`,
            (err, data) => res.send("Added successfully..!")
          );
        }
      });
    },
    DELETE: function () {
      var { course_title, course } = JSON.parse(req.body.data);
      var sql = `delete from ${schema}.course_details where course_title = '${course_title}' and course = '${course}'`;
      db.query(sql, (err, data) => {
        if (err) console.error(err);
        res.status(200).send(" Removed Successfully..!");
      });
    },
  };
  value[req.method]();
};
exports.getAllClassSection = (req, res) => {
  var sql = `Select * from ${schema}.course_details`;
  db.query(sql, (err, data) => {
    res.status(200).send(data);
  });
};
