const { Select } = require("../../modal/query");

exports.MonthEvents = async (req, res) => {
  var { cand_id, course_title, course } = req.token;
  var { month, year } = req.body;
  // console.log(`${month} ${year}`);
  var getEvent = new Select({
    table: "student_events",
    col: ["events"],
    where: `course_title='${course_title}' and course='${course}'
            and month ='${month}' and year='${year}'`,
  });
  try {
    var event = await getEvent.find();
    var events = event.map(({ events }) => JSON.parse(events));
    return events;
  } catch (err) {
    return err;
  }
};
