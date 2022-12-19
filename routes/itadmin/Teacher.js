const { Select, Insert, Update } = require("../modal/query");
const { encrypt } = require("../../auth/auth");
exports.createTeacher = async (req, res) => {
  var {
    Teacher_name,
    Teacher_initial,
    Subject_name,
    Qualification,
    Mobile_number,
    Email_ID,
    Teacher_ID,
    Password,
    Teacher_address,
    img,
  } = req.body;

  let ePass = encrypt(Password).toUpperCase();
  let date = new Date().toLocaleString();
  if (!Teacher_ID) {
    let subuserid =
      Teacher_name.substring(0, 4) + Math.random().toString().substring(2, 8);
    let cand_id = subuserid.toUpperCase();

    var insert_To_teacher = new Insert({
      table: "teacher_details",
      col: [
        "cand_id",
        "cand_name",
        "initial",
        "mobile",
        "email_id",
        "subject",
        "qualification",
        "address",
        "photo",
        "last_modified_time",
      ],
      val: [
        cand_id,
        Teacher_name,
        Teacher_initial,
        Mobile_number,
        Email_ID,
        Subject_name,
        Qualification,
        Teacher_address,
        img,
        date,
      ],
    });
    var insert_To_users = new Insert({
      table: "user_details",
      col: [
        "user_id",
        "name",
        "user_type",
        "password",
        "email_id",
        "last_modified_time",
      ],
      val: [cand_id, Teacher_name, "Staff", ePass, Email_ID, date],
    });
    try {
      await insert_To_teacher.add();
      await insert_To_users.add();
    } catch (error) {
      console.log(error);
    }

    return "Teacher details saved successfully..!";
  } else {
    var updateTeacher = new Update({
      table: "teacher_details",
      col: [
        "cand_name",
        "initial",
        "mobile",
        "email_id",
        "subject",
        "qualification",
        "address",
        "photo",
        "last_modified_time",
      ],
      val: [
        Teacher_name,
        Teacher_initial,
        Mobile_number,
        Email_ID,
        Subject_name,
        Qualification,
        Teacher_address,
        img,
        date,
      ],
      where: `cand_id='${Teacher_ID}'`,
    });
    var update_To_users = new Update({
      table: "user_details",
      col: ["name", "email_id"],
      val: [Teacher_name, Email_ID],
      where: `user_id = '${Teacher_ID}'`,
    });

    try {
      await updateTeacher.updateOne();
      await update_To_users.updateOne();
    } catch (error) {
      console.log(error);
    }

    return "Student details saved successfully..!";
  }
};

exports.teacherDetails = async (req, res) => {
  var { subject } = req.body;

  var sql = new Select({
    table: "teacher_details",
    col: ["cand_id", "cand_name", "subject"],
    where: `subject='${subject}'  order by id desc`,
  });
  try {
    var teachers = await sql.find();
    return teachers;
  } catch (error) {
    console.log(error);
  }
};

exports.getSingleTeacher = async (req, res) => {
  var { cand_id } = req.body;

  var get_main = new Select({
    table: "teacher_details",
    where: `cand_id='${cand_id}'`,
  });
  var get_user = new Select({
    table: "user_details",
    where: `user_id='${cand_id}'`,
  });
  try {
    var main = await get_main.find();
    var user = await get_user.find();
    return { ...main[0], ...user[0] };
  } catch (error) {
    console.log(error);
  }
};
// for class & section page
exports.getAllTeacherName = async (req, res) => {
  var sql = new Select({
    table: "teacher_details",
    col: ["cand_name as teacher"],
  });
  try {
    var teachers = await sql.find();
    return teachers;
  } catch (error) {
    console.log(error);
  }
};
