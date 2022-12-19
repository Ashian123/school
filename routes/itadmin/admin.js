const Jimp = require("jimp");

// for college details  generate

exports.college_details = (req, res) => {
  var sql = `select  college_name,college_place,college_district,college_state,college_pin,college_phone,college_mail,college_t_logo,file_size,img_size from ${schema}.college_details `;
  db.query(sql, (err, college_details) => {
    var sql = `select * from ${schema}.state_details`;
    db.query(sql, (err, data) => {
      res.render("itadmin/college_details.ejs", {
        state: data,
        college_details: college_details,
      });
    });
  });
};

exports.college_details_generate = (req, res) => {
  var {
    college_name,
    college_place,
    college_district,
    college_state,
    college_pin,
    college_phone,
    college_mail,
  } = req.body;
  var file_size = (img_size = 0);
  var docs = req.files;

  if (docs[0]) {
    Jimp.read(docs[0].buffer, (err, image) => {
      if (err) console.error(err);
      image.opacity(0.3).write(`./public/uploads/${docs[0].originalname}`);

      var sql = `update ${schema}.college_details set college_name = '${college_name.toUpperCase()}',college_place = '${college_place.toUpperCase()}',college_district= '${college_district.toUpperCase()}',college_state ='${college_state.toUpperCase()}',college_pin='${college_pin}',college_phone='${college_phone}',college_mail='${college_mail}',college_logo = '${docs[0].buffer.toString(
        "base64"
      )}' ,college_t_logo ='${
        docs[0].originalname
      }',file_size='${file_size}',img_size='${img_size}' where id = '1'`;
      db.query(sql, (err, data) => {
        if (err) console.log(err);
        res.send("Upload successfully");
      });
    });
  } else {
    var sql = `update ${schema}.college_details set college_name = '${college_name.toUpperCase()}',college_place = '${college_place.toUpperCase()}',college_district= '${college_district.toUpperCase()}',college_state ='${college_state.toUpperCase()}',college_pin='${college_pin}',college_phone='${college_phone}',college_mail='${college_mail}',file_size='${file_size}',img_size='${img_size}' where id = '1'`;
    db.query(sql, (err, data) => {
      if (err) console.log(err);
      res.send("Upload successfully");
    });
  }
};

exports.workflow_config = (req, res) => { res.render("itadmin/workflow_config.ejs", {    }); };
