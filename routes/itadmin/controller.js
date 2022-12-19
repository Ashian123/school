const { signUp, verifyUser } = require("../../auth/auth");
const admin = require("./admin");

const express = require("express");
const itadminrouter = express.Router();
const { zoomMeeting, get_all_meeting } = require("../zoomApi/index");
const { generateSignature } = require("../zoomApi/signature");
itadminrouter.use(express.static(__dirname + "/itadmin"));

const t_time_table = require("../general/Teacher_timeTable");
const admin_users = require("./admin_user_handling");



//
itadminrouter.use(verifyUser, (req, res, next) => {
  var { user_type } = req.token;
  if (user_type == "itadmin") {
    next();
  } else { 
    return res.redirect("/");
  }
});
//get
itadminrouter.get("/admin_home", (req, res) => { res.render("itadmin/ic_board_admin.ejs"); });
itadminrouter.get("/college_details", admin.college_details);
itadminrouter.get("/workflow_config", admin.workflow_config);

itadminrouter.get("/user_details", admin_users.index);
itadminrouter.post("/user_handling", admin_users.user_data_task); 
itadminrouter.post("/Teacher_additional_task", t_time_table.additional_task);

module.exports = itadminrouter;
