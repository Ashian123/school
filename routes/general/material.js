const { mail } = require("../../auth/mail");
const { Select, Insert } = require("../modal/query");
exports.materials = (req, res) => {
  var { user_type } = req.token;

  var userType = {
    Admin: "admin/student-material-admintask.ejs",
	sadmin: "sadmin/student-material-admintask.ejs",
	itadmin: "itadmin/student-material-admintask.ejs",
    Staff: "staff/student-material-stafftask.ejs",
  };
  res.render(userType[user_type], {
    user: "",
  });
};

exports.upload_material = async (req, res) => {
  var { fileName } = req.body;
  var {
    course_title,
    course_department,
    uploader_name,
    subject_name,
    file_desc,
    file_name,
    WhatsApp,
    Email,
  } = req.body;

  var dt = new Date();
  var day = `${(dt.getMonth() + 1).toString().padStart(2, "0")}-${dt
    .getDate()
    .toString()
    .padStart(2, "0")}-${dt.getFullYear().toString().padStart(4, "0")}`;
  var time = ` ${dt.getHours().toString().padStart(2, "0")}:${dt
    .getMinutes()
    .toString()
    .padStart(2, "0")}:${dt.getSeconds().toString().padStart(2, "0")}`;

  var file_id = fileName;
  var details = {
    uploader_name,
    file_desc,
    subject_name,
    file_name,
    file_id,
    day,
    time,
  };

  var materialFile = new Insert({
    table: "student_materials",
    col: ["course_title", "course", "details", "last_modified_time"],
    val: [
      course_title,
      course_department,
      JSON.stringify(details),
      dt.toLocaleDateString(),
    ],
  });
  const college_details = new Select({
    table: "college_details",
    col: ["college_name", "college_place", "college_district"],
    where: `id = 1`,
  });
  const Emails = new Select({
    table: "cand_admission_details",
    col: ["email_id"],
    where: `course_title ='${course_title}' and course = '${course_department}'`,
  });

  try {
    await materialFile.add();
    if (Email == "true") {
      const E_mail = await Emails.find();
      var AllEmail = E_mail.map((e) => e.email_id);
      const [{ college_name, college_place, college_district }] =
        await college_details.find();
      var payload = {
        email_id: AllEmail,
        subject: `Sending from ${college_name}`,
        text: `Dear Student,
         A new study material was uploaded
          Thanks and Regards,
          ${college_name},
          ${college_place},
          ${college_district}`,
      };
      await mail(payload);
    }
    res.send("File Uploaded Successfully..!");
  } catch (error) {
    res.send("Somthing went wrong");
  }
};
