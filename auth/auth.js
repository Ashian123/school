const { sign, verify } = require("jsonwebtoken");
const { Select, Update } = require("../routes/modal/query");
const crypto = require("crypto");
const { mail } = require("./mail");

exports.signUp = async (req, res, next) => {
  // var { query } = req.query;
  var message = "Incorrect! Username or Password";
  var post = req.body;
  var username = post.username;
  var pass = post.password;

  //hashing
  var epass = this.encrypt(pass).toUpperCase();
  // console.log("E-Pass: " + epass);

  var username = username.replace(/['"]+/g, "");

  try {
    var user = new Select({
      table: "user_details",
      where: `user_id = '${username}' or email_id ='${username}'`,
    });
    const getUser = await user.find();
    // console.log(getUser[0]);
    if (getUser.length && getUser[0].password == epass) {
      auth(getUser[0]);
    } else {
      return res.status(400).send(message);
    }
  } catch (err) {
    console.error(err);
    return res.redirect("/");
  }

  async function auth({ user_id, user_type }) {
    var payload = {};
    switch (user_type) {
      case "Student":
        var course = new Select({
          table: "cand_admission_details",
          col: ["course_title", "course"],
          where: `cand_id = '${user_id}'`,
        });
        var getcourse = await course.find();
        payload = {
          ...payload,
          ...{
            user_type,
            cand_id: user_id,
            course_title: getcourse[0].course_title,
            course: getcourse[0].course,
          },
        };
        break;
      case "Admin":
        payload = { ...payload, ...{ user_id, user_type } };
        break;
      case "itadmin":
        payload = { ...payload, ...{ user_id, user_type } };
        break;
      case "sadmin":
        payload = { ...payload, ...{ user_id, user_type } };
        break;		
      case "Staff":
        payload = { ...payload, ...{ user_id, user_type } };
        break;
      default:
        return res.status(400).send(message);
        break;
    }
	console.log(payload);
    try {
      const accessToken = sign(payload, process.env.SECRET, {
        expiresIn: "24h",
      });
      res.cookie("access-token", accessToken, {
        // maxAge: 60 * 60 * 26 * 30 * 1000,
        httpOnly: true,
      });
      req.body.user_type = user_type;
      next();
    } catch (err) {
      return res.status(400).send(message);
    }
  }
};

exports.verifyUser = async (req, res, next) => {
  const accessToken = req.cookies["access-token"];
  //   if (!accessToken)
  //     return res.status(400).json({ error: "User Not Authenticated" });
  try {
    const validToken = this.isValid(accessToken);
    var { user_type } = validToken;

    if (user_type) {
      req.token = validToken;
      next();
    } else {
      return res.redirect("/");
    }
  } catch (err) {
    return res.redirect("/");
  }
};
exports.isValid = (accessToken) => verify(accessToken, process.env.SECRET);

exports.changePassword = async (req, res) => {
  var { user_id } = req.token;
  var { old_pass, new_pass } = req.body;

  var oldpass = this.encrypt(old_pass).toUpperCase();
  var newpass = this.encrypt(new_pass).toUpperCase();

  var user = new Select({
    table: "user_details",
    where: `user_id = '${user_id}'`,
  });
  const getUser = await user.find();
  if (getUser[0].password != oldpass) {
    return "Wrong Old password";
  } else {
    var sql = new Update({
      table: "user_details",
      col: ["password"],
      val: [newpass],
      where: `user_id = '${user_id}'`,
    });
    await sql.updateOne();
    return "Password Changed";
  }
};
exports.forgetPassword = async (req, res) => {
  const { username } = req.body;
  const getEmail = new Select({
    table: "user_details",
    col: ["email_id", "password", "user_id"],
    where: `user_id = '${username}' or email_id ='${username}'`,
  });
  const college_details = new Select({
    table: "college_details",
    col: ["college_name", "college_place", "college_district"],
    where: `id = 1`,
  });
  try {
    const [{ user_id, email_id, password }] = await getEmail.find();
    if (!email_id) {
      return res.status(200).send("Email-ID / User-ID not Exist");
    }
    const [{ college_name, college_place, college_district }] =
      await college_details.find();
    var decrypted = this.decrypt(password);
    var paylod = {
      email_id,
      subject: `Sending from ${college_name}`,
      text: `Dear User,
          Please find your user name and password to login
          Username:${user_id} ,
          Password: ${decrypted},
          Thanks and Regards,
          ${college_name},
          ${college_place},
          ${college_district}
         `,
    };
    var msg = await mail(paylod);
    return res.status(200).send(msg);
  } catch (error) {
    return res.status(200).send("Email-ID / User-ID not Exist");
  }
};
exports.logout = function (req, res) {
  res.cookie("access-token", "", {
    maxAge: 1,
  });

  res.redirect("/");
};
exports.encrypt = (pass) => {
  var c = crypto.createCipheriv(
    "aes-128-ecb",
    convertCryptKey("myPassword"),
    ""
  );
  var crypted = c.update(pass, "utf8", "hex") + c.final("hex");
  return crypted;
};
exports.decrypt = (pass) => {
  var dc = crypto.createDecipheriv(
    "aes-128-ecb",
    convertCryptKey("myPassword"),
    ""
  );
  var decrypted = dc.update(pass, "hex", "utf8") + dc.final("utf8");
  return decrypted;
};
function convertCryptKey(strKey) {
  var newKey = new Buffer([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
  strKey = new Buffer(strKey);
  for (var i = 0; i < strKey.length; i++) newKey[i % 16] ^= strKey[i];
  return newKey;
}
