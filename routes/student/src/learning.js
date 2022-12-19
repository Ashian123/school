const { Select } = require("../../modal/query");

exports.learning_material = async (req, res) => {
  var { cand_id, course_title, course } = req.token;
  var { from, to } = JSON.parse(req.body.limit);

  var materials = new Select({
    table: `student_materials`,
    where: `course_title='${course_title}' 
    and course='${course}'order by id desc`,
    from,
    to,
  });

  var menu_status = await materials.findWithLimit();

  return await menu_status;
};

exports.download_material = async (req, res) => {
  var { id } = req.body;
  var file = new Select({
    table: "student_material_file",
    col: ["file_pdf"],
    where: `file_id = '${id}'`,
  });
  try {
    var file_pdf = await file.find();
  } catch (err) {
    throw err;
  }
  return await file_pdf;
};
