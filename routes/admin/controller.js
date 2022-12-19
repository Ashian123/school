const { signUp, verifyUser } = require("../../auth/auth");
const admin = require("./admin");
const enroll = require("./enroll");
const { getcourse, getAllClassSection } = require("../general/course");
const lessons = require("../general/lessons");
const scheduler = require("../general/scheduler");

const {
  timetable,
  save_timetable,
  slot_appointment,
} = require("../general/timeTable");
const t_time_table = require("../general/Teacher_timeTable");
const {
  events,
  save_general_events,
  add_calendar_event,
  remove_calendar_event,
} = require("../general/events");
const { materials, upload_material } = require("../general/material");
const {
  saveThroughExcel,
} = require("../general/createStudents/saveStudentsViaExcel");
const {
  create,
  studentDetails,
  getSingle,
} = require("../general/createStudents/createStudent");
const { saveMarks, getMarks } = require("../general/createStudents/marks");
const { uploadToGallery, getGallery } = require("./gallery");
const { promoteStudents } = require("./promote");
const {
  createTeacher,
  teacherDetails,
  getSingleTeacher,
  getAllTeacherName,
} = require("./Teacher");
const { deleteTeacher, deleteStudent } = require("./deleteUsers");
// const msg = require("./whatsapp_msg");
const multer = require("multer");
const express = require("express");
const adminrouter = express.Router();
const { zoomMeeting, get_all_meeting } = require("../zoomApi/index");
const { generateSignature } = require("../zoomApi/signature");
adminrouter.use(express.static(__dirname + "/admin"));
const fs = require("fs");
const upload = multer({ storage: multer.memoryStorage() });
var dt = new Date();
var prefix = `${dt.getDate()}_${dt.getMonth()}_${dt.getFullYear()}_${dt.getHours()}_${dt.getMinutes()}_${dt.getSeconds()}`;
const store_file = multer({
  storage: multer.diskStorage({
    destination: (req, res, next) => {
      next(null, "./public/Gallery/");
    },
    filename: (req, file, next) => {
      var file_name = `${prefix}_${file.originalname}`;
      req.body.fileName = file_name;
      next(null, file_name);
    },
  }),
});
const store_material = multer({
  storage: multer.diskStorage({
    destination: (req, res, next) => {
      next(null, "./public/Material/");
    },
    filename: (req, file, next) => {
      var file_name = `${prefix}_${file.originalname}`;
      req.body.fileName = file_name;
      next(null, file_name);
    },
  }),
});

//
adminrouter.use(verifyUser, (req, res, next) => {
  var { user_type } = req.token;
  if (user_type == "Admin" || user_type == "sadmin" || user_type == "itadmin" ) {
    next();
  } else {
    return res.redirect("/");
  }
});
//get
adminrouter.get("/admin_home", (req, res) => {
  res.render("admin/ic_board_admin.ejs");
});

adminrouter.get("/enrollmentid", enroll.enrollid);
adminrouter.get("/getcourse", getcourse);
adminrouter.get("/college_details", admin.college_details);
adminrouter.get("/admin_task", admin.admin_task);
adminrouter.get("/menu_status", admin.menu_status);
adminrouter.get("/timetable", timetable);
adminrouter.get("/events", events);
adminrouter.get("/materials", materials);
adminrouter.get("/meeting", (req, res) => res.render("admin/student_meeting"));
// adminrouter.get("/joinmeeting", (req, res) => res.render("admin/joinmeeting"));
adminrouter.get("/get_all_meeting", get_all_meeting);
adminrouter.get("/sendmsg", (req, res) => res.render("admin/student-WA-msg"));
adminrouter.get("/deleteMeeting/:mn", (req, res) => {
  res.redirect("/");
});
adminrouter.delete("/deleteMeeting/", (req, res) => {
  var { user_type } = req.token;
  var { meeting_number } = req.body;
  var sql = `DELETE from ${schema}.student_meeting where meeting_number = '${meeting_number}'`;
  db.query(sql, (err, data) => {
    return res.send("Meeting deleted");
  });
});
adminrouter.get("/StudentDetails", (req, res) =>
  res.render("admin/student-marks-admintask")
);

adminrouter.get("/viewMeeting", (req, res) => res.render("admin/viewMeeting"));
adminrouter.get("/viewClassSection", (req, res) =>
  res.render("admin/student-ClassSection-admintask")
);
adminrouter.get("/getAllClassSection", getAllClassSection);
adminrouter.get("/gallery", (req, res) => res.render("admin/gallery"));
adminrouter.get("/TeacherDetails", (req, res) =>
  res.render("admin/teacherDetails")
);
adminrouter.get("/getAllTeacherName", async (req, res) => {
  var data = await getAllTeacherName(req, res);
  res.status(200).send(data);
});
adminrouter.get("/subjects", (req, res) => res.render("admin/subject_page"));
adminrouter.get("/lessons", lessons.index);
adminrouter.post("/lesson_handling", lessons.data_handler);

adminrouter.get("/scheduler", scheduler.index);
adminrouter.post("/scheduler", scheduler.data_handler);



adminrouter.get("/getSubject", admin.getSubjects);
adminrouter.get("/Promotion", (req, res) =>
  res.render("admin/student-promotion")
);
/*
post
*/
adminrouter.post("/Promotion", async (req, res) => {
  var data = await promoteStudents(req, res);
  res.status(200).send(data);
});
adminrouter.post("/getGallery", async (req, res) => {
  var data = await getGallery(req, res);
  res.status(200).send(data);
});
adminrouter.post("/getcourse", getcourse);
adminrouter.post("/enrollmentid_generate", enroll.enrollid_);
adminrouter.post("/apply_enroll", enroll.apply_enroll);
adminrouter.post(
  "/user_manual_fees",
  upload.any(),
  verifyUser,
  admin.user_manual_fees
);
adminrouter.post("/upload_material", store_material.any(), upload_material);
adminrouter.post(
  "/college_details_generate",
  upload.any(),
  verifyUser,
  admin.college_details_generate
);

adminrouter.post("/pick_menu", admin.pick_menu);
adminrouter.post("/new_menu", admin.new_menu);
adminrouter.post("/get_status", admin.get_status);
adminrouter.post("/set_status", admin.set_status);
adminrouter.post("/save_timetable", save_timetable);
adminrouter.post("/slot_appointment", slot_appointment);
adminrouter.post("/save_general_events", save_general_events);
adminrouter.post("/new_subject", admin.new_subject);
adminrouter.post("/add_calendar_event", add_calendar_event);
adminrouter.post("/remove_calendar_event", remove_calendar_event);

adminrouter.post("/meeting", zoomMeeting);

adminrouter.post("/getQr", (req, res) => {
  var { ph_number, content_msg } = req.body;

  // fs.writeFile(
  //   "./routes/admin/last.json",
  //   JSON.stringify({ ph_number, content_msg })
  // );

  fs.readFile("./routes/admin/last.qr", (err, qr) => {
    if (!err && qr) {
      res.send(qr);
    }
  });
});
adminrouter.post("/StudentDetails", async (req, res) => {
  var data = await studentDetails(req, res);
  res.status(200).send(data);
});
adminrouter.post("/CreateStudent", async (req, res) => {
  var data = await create(req, res);
  res.status(200).send(data);
});
adminrouter.post("/getSingleStudent", async (req, res) => {
  var data = await getSingle(req, res);
  res.status(200).send(data);
});
adminrouter.post("/saveMarks", async (req, res) => {
  var data = await saveMarks(req, res);
  res.status(200).send(data);
});
adminrouter.post("/getStudentMarks", async (req, res) => {
  var data = await getMarks(req, res);
  res.status(200).send(data);
});
adminrouter.post("/saveThroughExcel", async (req, res) => {
  var data = await saveThroughExcel(req, res);
  res.status(200).send(data);
});
adminrouter.post(
  "/upload-Image-to-Gallery",
  store_file.any(),
  async (req, res) => {
    var data = await uploadToGallery(req, res);
    res.status(200).send(data);
  }
);
adminrouter.post("/TeacherDetails", async (req, res) => {
  var data = await teacherDetails(req, res);
  res.status(200).send(data);
});
adminrouter.post("/CreateTeacher", async (req, res) => {
  var data = await createTeacher(req, res);
  res.status(200).send(data);
});
adminrouter.post("/getSingleTeacher", async (req, res) => {
  var data = await getSingleTeacher(req, res);
  res.status(200).send(data);
});
// put/delete
adminrouter.put("/getcourse", getcourse);
adminrouter.delete("/getcourse", getcourse);
adminrouter.delete("/DeleteTeacher", async (req, res) => {
  var data = await deleteTeacher(req, res);
  res.status(200).send(data);
});
adminrouter.delete("/DeleteStudent", async (req, res) => {
  var data = await deleteStudent(req, res);
  res.status(200).send(data);
});

adminrouter.get("/Teacher_timetable", t_time_table.index);
adminrouter.get("/Teacher_additionalTask", t_time_table.additional_task_index);
adminrouter.post("/Teacher_timetable", t_time_table.data_handler); 
adminrouter.post("/Teacher_additional_task", t_time_table.additional_task);

module.exports = adminrouter;
