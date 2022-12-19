const { Select, Insert, Update } = require("../../modal/query");
const { encrypt } = require("../../../auth/auth");
exports.create = async (req, res) => {
  var {
    course,
    course_title,
    Student_name,
    Student_initial,
    Father_name,
    Mother_name,
    Date_of_Birth,
    Gender,
    Mobile_number,
    Email_ID,
    Student_ID,
    Password,
    img,
  } = req.body;

  let ePass = encrypt(Password).toUpperCase();
  let date = new Date().toLocaleString();
  if (!Student_ID) {
    // let x = Math.floor(Math.random() * 100 + 11);
    // let userfirst = Student_name.substring(0, 4);
    let subuserid =
      Student_name.substring(0, 4) + Math.random().toString().substring(2, 8);
    let cand_id = subuserid.toUpperCase();

    var insert_To_main = new Insert({
      table: "cand_admission_details",
      col: [
        "cand_id",
        "cand_name",
        "course",
        "course_title",
        "initial",
        "father_name",
        "mother_name",
        "dob",
        "gender",
        "mobile_no",
        "email_id",
        "last_modified_time",
      ],
      val: [
        cand_id,
        Student_name,
        course,
        course_title,
        Student_initial,
        Father_name,
        Mother_name,
        Date_of_Birth,
        Gender,
        Mobile_number,
        Email_ID,
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
      val: [cand_id, Student_name, "Student", ePass, Email_ID, date],
    });
    var insert_To_photo = new Insert({
      table: "biometric_details",
      col: [
        "cand_id",
        "cand_name",
        "category",
        "Filename",
        "active_flag",
        "last_modified_time",
      ],
      val: [cand_id, Student_name, "Photo", img, "Y", date],
    });

    await insert_To_main.add();
    await insert_To_users.add();
    await insert_To_photo.add();

    return "Student details saved successfully..!";
  } else {
    var updateStudent = new Update({
      table: "cand_admission_details",
      col: [
        "cand_name",
        "course",
        "course_title",
        "initial",
        "father_name",
        "mother_name",
        "dob",
        "gender",
        "mobile_no",
        "email_id",
        "last_modified_time",
      ],
      val: [
        Student_name,
        course,
        course_title,
        Student_initial,
        Father_name,
        Mother_name,
        Date_of_Birth,
        Gender,
        Mobile_number,
        Email_ID,
        date,
      ],
      where: `cand_id='${Student_ID}'`,
    });
    var update_To_users = new Update({
      table: "user_details",
      col: ["name", "email_id"],
      val: [Student_name, Email_ID],
      where: `user_id = '${Student_ID}'`,
    });
    var update_photo = new Update({
      table: "biometric_details",
      col: [
        "cand_name",
        "category",
        "Filename",
        "active_flag",
        "last_modified_time",
      ],
      val: [Student_name, "Photo", img, "Y", date],
      where: `cand_id='${Student_ID}'`,
    });

    await updateStudent.updateOne();
    await update_To_users.updateOne();
    await update_photo.updateOne();
    return "Student details saved successfully..!";
  }
};

exports.studentDetails = async (req, res) => {
  var { course_title, course } = req.body;

  var sql = new Select({
    table: "cand_admission_details",
    col: ["cand_id", "cand_name"],
    where: `course_title='${course_title}' and course='${course}' order by id desc`,
  });
  var students = await sql.find();

  return students;
};

exports.getSingle = async (req, res) => {
  var { cand_id } = req.body;

  var get_main = new Select({
    table: "cand_admission_details",
    where: `cand_id='${cand_id}'`,
  });
  var get_user = new Select({
    table: "user_details",
    where: `user_id='${cand_id}'`,
  });
  var get_photo = new Select({
    table: "biometric_details",
    col: ["Filename"],
    where: `cand_id='${cand_id}'`,
  });
  var main = await get_main.find();
  var user = await get_user.find();
  var photo = await get_photo.find();
  return { ...main[0], ...user[0], ...photo[0] };
};
