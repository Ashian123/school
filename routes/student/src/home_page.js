const { Select } = require("../../modal/query");
const { readFileSync } = require("fs");
exports.home_page = async (req, res) => {
  var { cand_id } = req.token;
  // console.log(req.token);
  var user_data = new Select({
    table: `cand_admission_details`,
    col: ["cand_name", "course", "course_title"],
    where: `cand_id = '${cand_id}'`,
  });
  var bio_metric = new Select({
    table: `biometric_details`,
    col: ["Filename"],
    where: `cand_id = '${cand_id}' and category = 'Photo'`,
  });
  var college_details = new Select({
    table: "college_details",
    col: [
      "college_name",
      "college_place",
      "college_district",
      "college_state",
      "college_pin",
      "college_phone",
      "college_mail",
    ],
  });
  try {
    var userdata = await user_data.find();
    // var photo = await bio_metric.find();
    var college = await college_details.find();
  } catch (err) {
    throw err;
  }
  data = {
    userdata,
    // photo,
    college,
  };
  return await data;
};

exports.menu = async (req, res) => {
  var { cand_id } = req.token;

  var menu = new Select({
    table: `student_menu`,
    col: ["menu", "status"],
    where: `status = 'Disabled'`,
  });
  try {
    var menu_status = await menu.find();
    var json = readFileSync("./routes/student/src/events.json");
    var events = JSON.parse(json);
  } catch (err) {
    throw err;
  }
  data = {
    menu_status,
    events,
  };
  return await data;
};
