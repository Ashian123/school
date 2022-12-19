// const express = require("express");
// const cors = require("cors"); //Cross-Origin Resource Sharing

// const bodyParser = require("body-parser");

//include required modules
const jwt = require("jsonwebtoken");
const config = require("./config");
const rp = require("request-promise");

// const app = express();
// const port = 3444;

// app.use(cors());
// app.use(bodyParser.json());
// app.use(
//   bodyParser.urlencoded({
//     limit: "50mb",
//     extended: true,
//   })
// );
// app.get("/", (request, response) => {
//   response.json({ info: "Node.js, Express and Zoom API" });
// });
//zoom

var email, userid, resp;

//Use the ApiKey and APISecret from config.js
const payload = {
  iss: config.APIKey,
  exp: new Date().getTime() + 5000,
};

const token = jwt.sign(payload, config.APISecret);
exports.zoomMeeting = (req, res) => {
  email = config.Mail;
  var { username, time, course, course_title } = req.body;
  var options = {
    method: "POST",
    uri: "https://api.zoom.us/v2/users/" + email + "/meetings",
    body: {
      topic: "Meeting",
      type: 2,
      duration: 60,
      start_time: `${time}:00`,
      // timezone: "Asia/Calcutta",
      // pre_schedule: "true",
      settings: {
        host_video: "true",
        participant_video: "true",
      },
    },
    auth: {
      bearer: token,
    },
    headers: {
      "User-Agent": "Zoom-api-Jwt-Request",
      "content-type": "application/json",
    },
    json: true, //Parse the JSON string in the response
  };

  rp(options)
    .then(function (response) {
      var url = response.join_url.replace("?", "&");
      // console.log(response);
      // response.status(200).json(response);
      let joinUrl =
        url.replace("https://us05web.zoom.us/j/", "/admin/meeting/?&mn=") +
        `&role=1&name=${username}`;
      const params = new URLSearchParams(joinUrl);
      var meeting_number = params.get("mn");
      let dataRes = {
        join_url: joinUrl,
        meeting_number,
      };
      db.query(
        `INSERT into ${schema}.student_meeting (student_id,cand_id,meeting_link,meeting_number,last_modified_time) values('${course_title}','${course}','${JSON.stringify(
          {
            url,
            username,
            time,
          }
        )}','${meeting_number}',now())`,
        (err, data) => {
          if (err) console.log(err);
          res.status(200).json(dataRes);
        }
      );
      // res.send("create meeting result: " + JSON.stringify(response));
    })
    .catch(function (err) {
      // API call failed...
      console.log("API call failed, reason ", err);
    });
};

exports.get_all_meeting = (req, res) => {
  db.query(`SELECT * from ${schema}.student_meeting`, (err, data) => {
    if (err) {
      res.status(500).json({
        error: err,
      });
    } else {
      res.status(200).json(data);
    }
  });
};
