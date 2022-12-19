const { signUp, verifyUser, changePassword } = require("../../auth/auth");
const { home_page, menu } = require("./src/home_page");
const { marks } = require("./src/marks");
const { fees } = require("./src/fees");
const { timeTable, subjects } = require("./src/timetable");
const { learning_material, download_material } = require("./src/learning");
const { MonthEvents } = require("./src/calendar");
const { getMeeting } = require("./src/meetingLink");
const { getGallery } = require("./src/gallery");
const express = require("express");
const studentrouter = express.Router();
studentrouter.use(express.static(__dirname + "/student"));

studentrouter.use(verifyUser, (req, res, next) => {
  var { user_type } = req.token;
  if (user_type == "Student") {
    next();
  } else {
    return res.redirect("/");
  }
});

studentrouter.get("/student_home", async (req, res) => {
  var data = await home_page(req, res);
  var event = await menu(req, res);
  res.render("student/student_page", { event, data });
});

studentrouter.get("/get_student_marks", async (req, res) => {
  data = await marks(req, res);
  return res.status(200).json(data);
});
studentrouter.get("/get_student_fees", async (req, res) => {
  data = await fees(req, res);
  return res.status(200).json(data);
});
studentrouter.get("/menu_status_fix", async (req, res) => {
  var data = await menu(req, res);
  return res.status(200).json(data);
});

studentrouter.post("/time-table", async (req, res) => {
  var data = await timeTable(req, res);
  return res.status(200).json(data);
});

studentrouter.post("/time-table-subject", async (req, res) => {
  var data = await subjects(req, res);
  return res.status(200).json(data);
});

studentrouter.post("/learning-Material", async (req, res) => {
  var data = await learning_material(req, res);
  return res.status(200).json(data);
});

studentrouter.post("/get_this_month_event", async (req, res) => {
  var data = await MonthEvents(req, res);
  return res.status(200).json(data);
});

studentrouter.post("/download_material", async (req, res) => {
  var data = await download_material(req, res);
  return res.status(200).json(data);
});

studentrouter.get("/get_student_meeting", async (req, res) => {
  var data = await getMeeting(req, res);
  return res.status(200).json(data);
});
studentrouter.get("/meeting", (req, res) =>
  res.render("admin/student_meeting")
);

studentrouter.post("/changePassword", async (req, res) => {
  var data = await changePassword(req, res);
  return res.status(200).send(data);
});
studentrouter.post("/getGallery", async (req, res) => {
  var data = await getGallery(req, res);
  res.status(200).send(data);
});
module.exports = studentrouter;
