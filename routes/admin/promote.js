const { Update } = require("../modal/query");

exports.promoteStudents = async (req, res) => {
  var { prev_class, prev_section, next_class, next_section, Student_ID } =
    req.body;
  var cand_id = Student_ID.join("','");
  var promote = new Update({
    table: "cand_admission_details",
    col: ["course_title", "course"],
    val: [next_class, next_section],
    where: `cand_id in ('${cand_id}')`,
  });
  try {
    await promote.updateOne();

    return `Students promoted from ${prev_class}-${prev_section} to ${next_class}-${next_section}`;
  } catch (error) {
    console.error(error);
  }
};
