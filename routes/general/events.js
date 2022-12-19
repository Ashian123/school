const fs = require("fs");

exports.events = (req, res) => {
  var { user_type } = req.token;
  var json = fs.readFileSync("./routes/student/src/events.json");
  var events = JSON.parse(json);
  var userType = {
    Admin: "admin/student-events-admintask.ejs",
    Staff: "staff/student-events-stafftask.ejs",
  };
  res.render(userType[user_type], {
    user: "",
    events,
  });
};
exports.save_general_events = (req, res) => {
  console.log(req.body);
  var data = req.body;

  fs.writeFileSync(
    "./routes/student/src/events.json",
    JSON.stringify(data, null, 2),
    (err) => {
      if (err) {
        console.error(err);
      }
    }
  );
  res.send("Event saved successfully..! ");
};

exports.add_calendar_event = (req, res) => {
  // console.log(req.token);
  var { course_title, course, month, year, id, event } = req.body;
  var sql = `insert into ${schema}.student_events (course_title, course, month, year, event_id, events, last_modified_time)
   values ( '${course_title}', '${course}', '${month}','${year}', '${id}', '${JSON.stringify(
    event
  )}',now())`;
  db.query(sql, (err, data) => {
    if (err) console.error(err);
    res.status(200).send("Event Added Successfully..!");
  });
};
exports.remove_calendar_event = (req, res) => {
  var { course_title, course, id } = req.body;
  var sql = `delete from ${schema}.student_events where course_title = '${course_title}' and course = '${course}' and event_id = '${id}'`;
  db.query(sql, (err, data) => {
    if (err) console.error(err);
    res.status(200).send("Event Removed Successfully..!");
  });
};
