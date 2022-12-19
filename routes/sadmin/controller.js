const { signUp, verifyUser } = require("../../auth/auth");
const admin = require("./admin");
const enroll = require("./enroll");
const { getcourse, getAllClassSection } = require("../general/course");
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
const sadminrouter = express.Router();
const { zoomMeeting, get_all_meeting } = require("../zoomApi/index");
const { generateSignature } = require("../zoomApi/signature");
sadminrouter.use(express.static(__dirname + "/sadmin"));
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
sadminrouter.use(verifyUser, (req, res, next) => {
  var { user_type } = req.token;
  if (user_type == "sadmin") {
    next();
  } else {
    return res.redirect("/");
  }
});
//get
sadminrouter.get("/admin_home", (req, res) => {
  res.render("sadmin/ic_board_admin.ejs");
});

sadminrouter.get("/enrollmentid", enroll.enrollid);
sadminrouter.get("/getcourse", getcourse);
sadminrouter.get("/college_details", admin.college_details);
sadminrouter.get("/admin_task", admin.admin_task);
sadminrouter.get("/menu_status", admin.menu_status);
sadminrouter.get("/timetable", timetable);
sadminrouter.get("/events", events);
sadminrouter.get("/materials", materials);
sadminrouter.get("/meeting", (req, res) => res.render("sadmin/student_meeting"));
// sadminrouter.get("/joinmeeting", (req, res) => res.render("sadmin/joinmeeting"));
sadminrouter.get("/get_all_meeting", get_all_meeting);
sadminrouter.get("/sendmsg", (req, res) => res.render("sadmin/student-WA-msg"));
sadminrouter.get("/deleteMeeting/:mn", (req, res) => {
  res.redirect("/");
});
sadminrouter.delete("/deleteMeeting/", (req, res) => {
  var { user_type } = req.token;
  var { meeting_number } = req.body;
  var sql = `DELETE from ${schema}.student_meeting where meeting_number = '${meeting_number}'`;
  db.query(sql, (err, data) => {
    return res.send("Meeting deleted");
  });
});
sadminrouter.get("/StudentDetails", (req, res) =>
  res.render("sadmin/student-marks-admintask")
);

sadminrouter.get("/viewMeeting", (req, res) => res.render("sadmin/viewMeeting"));
sadminrouter.get("/viewClassSection", (req, res) =>
  res.render("sadmin/student-ClassSection-admintask")
);
sadminrouter.get("/getAllClassSection", getAllClassSection);
sadminrouter.get("/gallery", (req, res) => res.render("sadmin/gallery"));
sadminrouter.get("/TeacherDetails", (req, res) =>
  res.render("sadmin/teacherDetails")
);
sadminrouter.get("/getAllTeacherName", async (req, res) => {
  var data = await getAllTeacherName(req, res);
  res.status(200).send(data);
});
sadminrouter.get("/subjects", (req, res) => res.render("sadmin/subject_page"));
sadminrouter.get("/getSubject", admin.getSubjects);
sadminrouter.get("/Promotion", (req, res) =>
  res.render("sadmin/student-promotion")
);
/*
post
*/
sadminrouter.post("/Promotion", async (req, res) => {
  var data = await promoteStudents(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/getGallery", async (req, res) => {
  var data = await getGallery(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/getcourse", getcourse);
sadminrouter.post("/enrollmentid_generate", enroll.enrollid_);
sadminrouter.post("/apply_enroll", enroll.apply_enroll);
sadminrouter.post(
  "/user_manual_fees",
  upload.any(),
  verifyUser,
  admin.user_manual_fees
);
sadminrouter.post("/upload_material", store_material.any(), upload_material);
sadminrouter.post(
  "/college_details_generate",
  upload.any(),
  verifyUser,
  admin.college_details_generate
);

sadminrouter.post("/pick_menu", admin.pick_menu);
sadminrouter.post("/new_menu", admin.new_menu);
sadminrouter.post("/get_status", admin.get_status);
sadminrouter.post("/set_status", admin.set_status);
sadminrouter.post("/save_timetable", save_timetable);
sadminrouter.post("/slot_appointment", slot_appointment);
sadminrouter.post("/save_general_events", save_general_events);
sadminrouter.post("/new_subject", admin.new_subject);
sadminrouter.post("/add_calendar_event", add_calendar_event);
sadminrouter.post("/remove_calendar_event", remove_calendar_event);

sadminrouter.post("/meeting", zoomMeeting);

sadminrouter.post("/getQr", (req, res) => {
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
sadminrouter.post("/StudentDetails", async (req, res) => {
  var data = await studentDetails(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/CreateStudent", async (req, res) => {
  var data = await create(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/getSingleStudent", async (req, res) => {
  var data = await getSingle(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/saveMarks", async (req, res) => {
  var data = await saveMarks(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/getStudentMarks", async (req, res) => {
  var data = await getMarks(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/saveThroughExcel", async (req, res) => {
  var data = await saveThroughExcel(req, res);
  res.status(200).send(data);
});
sadminrouter.post(
  "/upload-Image-to-Gallery",
  store_file.any(),
  async (req, res) => {
    var data = await uploadToGallery(req, res);
    res.status(200).send(data);
  }
);
sadminrouter.post("/TeacherDetails", async (req, res) => {
  var data = await teacherDetails(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/CreateTeacher", async (req, res) => {
  var data = await createTeacher(req, res);
  res.status(200).send(data);
});
sadminrouter.post("/getSingleTeacher", async (req, res) => {
  var data = await getSingleTeacher(req, res);
  res.status(200).send(data);
});
// put/delete
sadminrouter.put("/getcourse", getcourse);
sadminrouter.delete("/getcourse", getcourse);
sadminrouter.delete("/DeleteTeacher", async (req, res) => {
  var data = await deleteTeacher(req, res);
  res.status(200).send(data);
});
sadminrouter.delete("/DeleteStudent", async (req, res) => {
  var data = await deleteStudent(req, res);
  res.status(200).send(data);
});

sadminrouter.get("/Teacher_timetable", t_time_table.index);
sadminrouter.get("/Teacher_additionalTask", t_time_table.additional_task_index);
sadminrouter.post("/Teacher_timetable", t_time_table.data_handler); 
sadminrouter.post("/Teacher_additional_task", t_time_table.additional_task);

module.exports = sadminrouter;
