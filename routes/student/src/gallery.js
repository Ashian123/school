const { Select } = require("../../modal/query");
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
