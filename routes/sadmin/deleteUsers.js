const { Delete } = require("../modal/query");

exports.deleteTeacher = async (req, res) => {
  var { Teacher_ID } = req.body;
  console.log(Teacher_ID);

  var deleteUser = new Delete({
    table: "user_details",
    where: `user_id='${Teacher_ID}'`,
  });
  var deleteDetails = new Delete({
    table: "teacher_details",
    where: `cand_id='${Teacher_ID}'`,
  });
  try {
    await deleteUser.deleteOne();
    await deleteDetails.deleteOne();
    return "Teacher details deleted..!";
  } catch (error) {
    console.error(error);
  }
};
exports.deleteStudent = async (req, res) => {
  var { Student_ID } = req.body;
  var deleteUser = new Delete({
    table: "user_details",
    where: `user_id = '${Student_ID}'`,
  });
  var deleteDetails = new Delete({
    table: "cand_admission_details",
    where: `cand_id='${Student_ID}'`,
  });

  var deletePhoto = new Delete({
    table: "biometric_details",
    where: `cand_id='${Student_ID}'`,
  });
  try {
    await deleteUser.deleteOne();
    await deleteDetails.deleteOne();
    await deletePhoto.deleteOne();
    return "Student details deleted..!";
  } catch (error) {
    console.error(error);
  }
};
