var { Select, Insert, Update } = require("../../modal/query");

exports.saveMarks = async (req, res) => {
  var { cand_id, marks } = req.body;

  var getcount = new Select({
    table: "cand_marks_details",
    col: ["count(*) as result"],
    where: `cand_id = '${cand_id}'`,
  });
  var [{ result }] = await getcount.find();
  if (!result) {
    var insert = new Insert({
      table: "cand_marks_details",
      col: ["cand_id", "marks"],
      val: [cand_id, JSON.stringify(marks)],
    });
    await insert.add();
    return "Marks saved successfully";
  } else {
    var update = new Update({
      table: "cand_marks_details",
      col: ["marks"],
      val: [JSON.stringify(marks)],
      where: `cand_id='${cand_id}'`,
    });
    await update.updateOne();
    return "Marks saved successfully";
  }
};

exports.getMarks = async (req, res) => {
  var { cand_id } = req.body;

  var getmark = new Select({
    table: "cand_marks_details",
    col: ["marks"],
    where: `cand_id='${cand_id}'`,
  });
  var marks = await getmark.find();
  return marks;
};
