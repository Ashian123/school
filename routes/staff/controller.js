const { signUp, verifyUser, changePassword } = require("../../auth/auth");
const multer = require("multer");
const express = require("express");
const { getcourse } = require("../general/course");
const { timetable, save_timetable, slot_appointment, } = require("../general/timeTable");
const t_time_table = require("../general/Teacher_timeTable");
const { get_all_meeting } = require("../zoomApi/index");

const { teacherDetails } = require("../admin/Teacher");

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

//
const admin = require("../admin/admin");
const { getAllTeacherName, getSingleTeacher } = require("../admin/Teacher");
//
const staffrouter = express.Router();
staffrouter.use(express.static(__dirname + "/staff"));
var dt = new Date();
var prefix = `${dt.getDate()}_${dt.getMonth()}_${dt.getFullYear()}_${dt.getHours()}_${dt.getMinutes()}_${dt.getSeconds()}`;

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
staffrouter.use(verifyUser, (req, res, next) => {
  var { user_type } = req.token;
  if (user_type == "Staff") {
    next();
  } else {
    return res.redirect("/");
  }
});
// get//
staffrouter.get("/staff_home", (req, res) => {
  res.render("staff/ic_board_staff.ejs");
});

staffrouter.get("/getcourse", getcourse);
staffrouter.get("/timetable", timetable);

staffrouter.get("/events", events);

staffrouter.get("/meeting", (req, res) => res.render("admin/student_meeting"));
staffrouter.get("/viewMeeting", (req, res) => res.render("staff/viewMeeting"));

staffrouter.get("/get_all_meeting", get_all_meeting);
staffrouter.get("/materials", materials);
staffrouter.get("/StudentDetails", (req, res) =>
  res.render("staff/student-marks-stafftask")
);
staffrouter.get("/getAllTeacherName", async (req, res) => {
  var data = await getAllTeacherName(req, res);
  res.status(200).send(data);
});

staffrouter.get("/getSubject", admin.getSubjects);
staffrouter.get("/staffProfile", (req, res) =>
  res.render("staff/staff_profile")
);
staffrouter.get("/staffProfileDetails", async (req, res) => {
  var { user_id } = req.token;
  req.body.cand_id = user_id;
  var data = await getSingleTeacher(req, res);
  res.status(200).send(data);
});
// post//
staffrouter.post("/getcourse", getcourse);
staffrouter.post("/save_timetable", save_timetable);
staffrouter.post("/save_general_events", save_general_events);

staffrouter.post("/add_calendar_event", add_calendar_event);
staffrouter.post("/remove_calendar_event", remove_calendar_event);
staffrouter.post("/upload_material", store_material.any(), upload_material);
staffrouter.post("/StudentDetails", async (req, res) => {
  var data = await studentDetails(req, res);
  res.status(200).send(data);
});
staffrouter.post("/CreateStudent", async (req, res) => {
  var data = await create(req, res);
  res.status(200).send(data);
});
staffrouter.post("/getSingleStudent", async (req, res) => {
  var data = await getSingle(req, res);
  res.status(200).send(data);
});
staffrouter.post("/saveMarks", async (req, res) => {
  var data = await saveMarks(req, res);
  res.status(200).send(data);
});
staffrouter.post("/getStudentMarks", async (req, res) => {
  var data = await getMarks(req, res);
  res.status(200).send(data);
});
staffrouter.post("/saveThroughExcel", async (req, res) => {
  var data = await saveThroughExcel(req, res);
  res.status(200).send(data);
});
staffrouter.post("/changePassword", async (req, res) => {
  var data = await changePassword(req, res);
  return res.status(200).send(data);
});

staffrouter.post("/TeacherDetails", async (req, res) => {
  var data = await teacherDetails(req, res);
  res.status(200).send(data);
});

staffrouter.post("/slot_appointment", slot_appointment);

staffrouter.get("/Teacher_timetable", t_time_table.staff_index);
staffrouter.get("/Teacher_additionalTask", t_time_table.additional_task_index);
staffrouter.post("/Teacher_timetable", t_time_table.data_handler); 
staffrouter.post("/Teacher_additional_task", t_time_table.additional_task);

module.exports = staffrouter;
