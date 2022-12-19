var { Select, Insert, Update } = require("../../modal/query");
const { encrypt } = require("../../../auth/auth");
exports.saveThroughExcel = async (req, res) => {
  var data = req.body;
  var admission_table = new Array();
  var user_table = new Array();
  var photo_table = new Array();
  let date = new Date().toLocaleString();
  //
  for (i in data) {
    var studentName = data[i]["Student Name"];
    var subuserid =
      studentName.substring(0, 4) + Math.random().toString().substring(2, 8);
    let cand_id = subuserid.toUpperCase();
    var ePass = encrypt(data[i]["Password"]).toUpperCase();

    admission_table.push(`(
        '${cand_id}',
        '${studentName}',
        '${data[i]["Section"]}',
        '${data[i]["Class"]}',
        '${data[i]["Initial"]}',
        '${data[i]["Father Name"]}',
        '${data[i]["Mother Name"]}',
        '${reformatDate(data[i]["Date Of Birth"])}',
        '${data[i]["Gender"]}',
        '${data[i]["Mobile Number"]}',
        '${data[i]["Email ID"]}',
        '${date}'
        )`);
    user_table.push(
      `('${cand_id}','${studentName}','Student','${ePass}','${data[i]["Email ID"]}','${date}')`
    );
    photo_table.push(`('${cand_id}','${studentName}','${date}')`);
  }
  var insert_user_table = new Insert({
    table: "user_details",
    col: [
      "user_id",
      "name",
      "user_type",
      "password",
      "email_id",
      "last_modified_time",
    ],
    val: user_table,
  });
  var insert_admission_table = new Insert({
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
    val: admission_table,
  });
  var insert_photo_table = new Insert({
    table: "biometric_details",
    col: ["cand_id", "cand_name", "last_modified_time"],
    val: photo_table,
  });
  try {
    await insert_admission_table.addBulk();
    await insert_user_table.addBulk();
    await insert_photo_table.addBulk();
  } catch (err) {
    return err;
  }
  return "Successfully Saved..!";
};

function reformatDate(dateStr) {
  if (!dateStr) return "";
  dArr = dateStr.split(".");
  return dateStr && dArr[2] + "-" + dArr[1] + "-" + dArr[0];
}
