const { Select, Insert } = require("../modal/query");
exports.uploadToGallery = async (req, res) => {
  var { fileName } = req.body;

  var saveFileName = new Insert({
    table: "gallery",
    col: ["pic_url", "last_modified_time"],
    val: [fileName, Date()],
  });

  await saveFileName.add();

  return "Uploaded Successfully..!";
};

exports.getGallery = async (req, res) => {
  var { from, to } = JSON.parse(req.body.limit);

  var gallery = new Select({
    table: `gallery`,
    from,
    to,
  });
  var gal = await gallery.findWithLimit();

  return gal.reverse();
};
