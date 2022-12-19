const { Select } = require("../../modal/query");
exports.getMeeting = async (req, res) => {
  var { cand_id, course_title, course } = req.token;

  var get_meeting = new Select({
    table: "student_meeting",
    col: ["meeting_link"],
    where: `student_id='${course_title}' and cand_id='${course}'`,
  });

  try {
    var meeting = await get_meeting.find();
    return meeting;
  } catch (error) {
    throw error;
  }
};
