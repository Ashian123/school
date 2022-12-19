const Jimp = require("jimp");

// for college details  generate

exports.college_details = (req, res) => {
  var sql = `select  college_name,college_place,college_district,college_state,college_pin,college_phone,college_mail,college_t_logo,file_size,img_size from ${schema}.college_details `;
  db.query(sql, (err, college_details) => {
    var sql = `select * from ${schema}.state_details`;
    db.query(sql, (err, data) => {
      res.render("admin/college_details.ejs", {
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

exports.user_manual_fees = (req, res) => {
  var { course } = req.body;
  var docs = req.files;
  console.log(course);
  console.log(docs);

  docs.forEach((files) => {
    files.fieldname.includes("user_manual")
      ? db.query(
          `update ${schema}.user_manual set user_manual_pdf = '${files.buffer.toString(
            "base64"
          )}', file_name='${files.originalname}' where (course) = ('${course}')`
        )
      : files.fieldname.includes("fees_file")
      ? db.query(
          `update ${schema}.fees_file set fee_pdf = '${files.buffer.toString(
            "base64"
          )}', file_name='${files.originalname}' where (course) = ('${course}')`
        )
      : null;
  });
  res.send("Upload Successfully");
};

exports.admin_task = (req, res) => {
  res.render("admin/dropdown_menu.ejs");
};

exports.pick_menu = (req, res) => {
  var { menu } = req.body;
  var column = {
    admiss_type: "admiss_type",
    admiss_quota: "admiss_quota",
    blood_group: "blood",
    board: "board",
    community_details: "community",
    nation_details: "nationality",
    religion_details: "religion",
    selected_category: "category",
  };

  var sql = `select ${column[menu]} as menu from ${schema}.${menu}`;
  db.query(sql, (err, data) => {
    res.send(data);
  });
};

exports.new_menu = (req, res) => {
  var { params, value, menu, sub_menu } = req.body;
  var column = {
    admiss_type: "admiss_type",
    admiss_quota: "admiss_quota",
    blood_group: "blood",
    board: "board",
    community_details: "community",
    nation_details: "nationality",
    religion_details: "religion",
    selected_category: "category",
  };
  var action = {
    add: () => {
      var sql = `select count(*) as result from ${schema}.${menu} where ${column[menu]} = '${value}'`;

      db.query(sql, (err, data) => {
        if (!data[0].result) {
          var sql = `insert into ${schema}.${menu}(${column[menu]}) values ('${value}') `;
          db.query(sql, (err, data) =>
            res.send(`${value} Added Successfully..!`)
          );
        } else {
          return res.send(`${value} already exists..!`);
        }
      });
    },
    update: () => {
      var sql = `update ${schema}.${menu} set ${column[menu]} = '${value}' where ${column[menu]} = '${sub_menu}'`;
      db.query(sql, (err, data) =>
        res.send(`${value} Updated Successfully..!`)
      );
    },
    delete: () => {
      var sql = `delete from ${schema}.${menu} where ${column[menu]} = '${sub_menu}'`;
      db.query(sql, (err, data) =>
        res.send(`${value} Deleted Successfully..!`)
      );
    },
  };
  action[params]();
};

exports.menu_status = (req, res) => {
  var sql = `select realMenu,menu from ${schema}.student_menu `;
  db.query(sql, (err, menu) => {
    res.render("admin/student-menu-admintask.ejs", {
      menu,
    });
  });
};

exports.get_status = (req, res) => {
  var { menu } = req.body;
  var sql = `select status from ${schema}.student_menu where menu = '${menu}'`;
  db.query(sql, (err, data) => {
    res.send(data[0].status);
  });
};
exports.set_status = (req, res) => {
  var { menu, status } = req.body;
  var sql = `update ${schema}.student_menu set status = '${status}' where menu = '${menu}'`;
  db.query(sql, (err, data) => {
    res.send(`${status} Successfully..!`);
  });
};
exports.getSubjects = (req, res) => {
  var sql = `SELECT * from ${schema}.subjects`;
  db.query(sql, (err, data) => res.send(data));
};
exports.new_subject = (req, res) => {
  var { params, subject, new_subject } = req.body;

  var action = {
    add: () => {
      var sql = `select count(*) as result from ${schema}.subjects where subject = '${new_subject}'`;

      db.query(sql, (err, data) => {
        console.error(err);
        if (!data[0].result) {
          var sql = `insert into ${schema}.subjects(subject) values ('${new_subject}') `;
          db.query(sql, (err, data) => {
            console.error(err);
            res.send(`${new_subject} Added Successfully..!`);
          });
        } else {
          return res.send(`${new_subject} already exists..!`);
        }
      });
    },
    update: () => {
      var sql = `update ${schema}.subjects set subject = '${new_subject}' where subject = '${subject}'`;
      db.query(sql, (err, data) => {
        var sql = `update ${schema}.teacher_details set subject = '${new_subject}' where subject = '${subject}'`;
        db.query(sql, (err, data) =>
          res.send(`${new_subject} Updated Successfully..!`)
        );
      });
    },
    delete: () => {
      var check = `select count(*) as result from ${schema}.teacher_details where subject = '${new_subject}'`;
      db.query(check, (err, data) => {
        var [{ result }] = data;
        if (result) {
          res.send(`${new_subject} cannot bo delete.It is used ..!`);
          return;
        }
        var sql = `delete from ${schema}.subjects where subject = '${new_subject}'`;
        db.query(sql, (err, data) =>
          res.send(`${new_subject} Deleted Successfully..!`)
        );
      });
    },
  };
  action[params]();
};
