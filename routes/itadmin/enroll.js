exports.enrollid = (req, res) => {
  var sql = `select distinct academic_year from ${schema}.cand_profile_details where academic_year != ''`;
  db.query(sql, (err, data) => {
    res.render("itadmin/enrollid.ejs", {
      academic_year: data,
    });
  });
};

exports.enrollid_ = (req, res) => {
  var { academic_year, program, dept } = JSON.parse(req.body.data);

  var sql = `select ${schema}.cand_admission_details.cand_id,${schema}.cand_admission_details.cand_name,
          ${schema}.cand_profile_details.father_name,${schema}.cand_profile_details.mother_name from ${schema}.cand_admission_details
          inner join ${schema}.cand_profile_details on ${schema}.cand_admission_details.cand_id = ${schema}.cand_profile_details.cand_id
          inner Join ${schema}.cand_relieving_details on ${schema}.cand_admission_details.cand_id = ${schema}.cand_relieving_details.cand_id
          where (academic_year,course_title,course,relieved,submitted,active_status) = ('${academic_year}','${program}','${dept}','No','Yes','Yes')`;

  db.query(sql, (err, data) => {
    function compareStrings(a, b) {
      return a.cand_name.toLowerCase() < b.cand_name.toLowerCase()
        ? -1
        : a.cand_name.toLowerCase() > b.cand_name.toLowerCase()
        ? 1
        : a.cand_name.toLowerCase() == b.cand_name.toLowerCase()
        ? a.father_name.toLowerCase() < b.father_name.toLowerCase()
          ? -1
          : a.father_name.toLowerCase() > b.father_name.toLowerCase()
          ? 1
          : a.father_name.toLowerCase() == b.father_name.toLowerCase()
          ? a.mother_name.toLowerCase() < b.mother_name.toLowerCase()
            ? -1
            : a.mother_name.toLowerCase() > b.mother_name.toLowerCase()
            ? 1
            : 0
          : 0
        : 0;
    }

    var number = data.sort(function (a, b) {
      return compareStrings(a, b);
    });

    var course, department;
    var sql = `select * from ${schema}.course_details where (course_title,course) = ('${program}','${dept}')`;
    db.query(sql, (err, data) => {
      console.log(data);
      course = data[0].course_title_id;
      department = data[0].course_id;

      var myobj = [];
      for (i in number) {
        if (i < 9) {
          myobj.push({
            cand_id: number[i].cand_id,
            cand_name: number[i].cand_name,
            student_code: `${academic_year.substring(
              0,
              4
            )}${course}${department}00${Number(i) + 1}`,
          });
        } else if (i >= 9 && i < 99) {
          myobj.push({
            cand_id: number[i].cand_id,
            cand_name: number[i].cand_name,
            student_code: `${academic_year.substring(
              0,
              4
            )}${course}${department}0${Number(i) + 1}`,
          });
        } else {
          myobj.push({
            cand_id: number[i].cand_id,
            cand_name: number[i].cand_name,
            student_code: `${academic_year.substring(
              0,
              4
            )}${course}${department}${Number(i) + 1}`,
          });
        }
      }
      console.table(myobj);
      return res.send(myobj);
    });
  });
};

exports.apply_enroll = (req, res) => {
  var data = JSON.parse(req.body.data);
  data.forEach((e) => {
    var sql = `update ${schema}.cand_admission_details set student_code = '${e.student_code}' where cand_id = '${e.cand_id}'`;
    db.query(sql, (err, data) => {
      if (err) console.error(err);
    });
  });
  return res.send("OK");
};
