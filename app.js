/**
 * Module dependencies.
 */
require("dotenv").config();
const {
  signUp,
  verifyUser,
  logout,
  isValid,
  forgetPassword,
} = require("./auth/auth");
const express = require("express");
const app = express();
const mysql = require("mysql");
const cluster = require("cluster");
const numCpu = require("os").cpus().length;
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const student_page = require("./routes/student/controller");
const admin_page = require("./routes/admin/controller");
const sadmin_page = require("./routes/sadmin/controller");
const itadmin_page = require("./routes/itadmin/controller");
const staff_page = require("./routes/staff/controller");
const cors = require("cors");
// app.use(cors());
app.options("*", cors());
//Server port
var schema = process.env.DATABASE;
global.schema = schema;
const pool = mysql.createPool({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: `${schema}`,
});

global.db = pool;

/*
const sql = require("mssql/msnodesqlv8");

const main = async () => {
  const pool = new sql.ConnectionPool({
    server: "myservername",
    database: "mydbname",
    options: {
      trustedConnection: true
    }
  });

  await pool.connect();

  const request = new sql.Request(pool);

  const query = `SELECT [FirstName]
    ,[LastName]
    ,[Email]
FROM [Dev].[Users]`;

  const result = await request.query(query);

  console.dir(result);
};
main();


const config = {
user: 'sa',
password: '123',
driver: "msnodesqlv8",
server: 'UZAIR-S_PC\\SQLEXPRESS',
database: 'LearningExpressJS',
options: {
    trustedconnection: true,
    enableArithAbort : true, 
    trustServerCertificate: true,
    instancename : 'SQLEXPRESS'
},
port: 58018

*/

// all environments
app.set("port", process.env.PORT || 80);
app.set("views", "./views");
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(bodyParser.json({ limit: "50mb" }));
app.use(cookieParser());
//app.use(express.static('public'))
// Public Folder
app.use(express.static("./public"));

validate_input = (req, res, next) => {
  var post = req.body;

  req.body = {};
  var keys = Object.keys(post);
  var values = Object.values(post);
  for (i in keys) {
    var data = { [keys[i]]: values[i].replace(/[']+/g, "''") };
    req.body = { ...req.body, ...data };
  }

  next();
};
app.get("/getkeys", (req, res) => {
  res.send({
    apiKey: process.env.ZOOM_API,
    apiSecret: process.env.ZOOM_SECRET,
  });
});
app.get("/joinmeeting", (req, res) => res.render("admin/joinmeeting"));

app.use("/student", student_page);
app.use("/admin", admin_page);
app.use("/sadmin", sadmin_page);
app.use("/itadmin", itadmin_page);
app.use("/staff", staff_page);
var userType = {
  Student: "/student/student_home",
  Admin: "/admin/admin_home",
  sadmin: "/sadmin/admin_home",
  itadmin: "/itadmin/admin_home",
  Staff: "/staff/staff_home",
};
app.get("/", (req, res) => {
  const accessToken = req.cookies["access-token"];
  if (!accessToken) {
    res.render("student_login");
    return;
  }
  var { user_type } = isValid(accessToken);
  res.redirect(userType[user_type]);
});
app.post("/login", signUp, async (req, res) => {
  var { user_type } = req.body;
  res.redirect(userType[user_type]);
});
app.post("/recover_password", forgetPassword);
app.get("/logout", logout);

//Middleware
if (cluster.isMaster) {
  for (let i = 0; i <= numCpu; i++) {
    cluster.fork();
    // console.log(cluster.fork());
  }
  cluster.on("exit", (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
    cluster.fork();
  });
} else {
  app.listen(8000, () => {
    console.log(` server ${process.pid} @ http://localhost:8000`);
  });
}
// app.listen(8000, () => {
//   console.log("http://localhost:8000");
// });
//
