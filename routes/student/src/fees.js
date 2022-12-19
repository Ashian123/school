exports.fees = async (req, res) => {
  var data = {
    tution: 4000,
    medical: 500,
    university: 700,
    GST: 600,
    redcross: 700,
    misc: 900,
    general: 1000,
    library: 800,
  };
  return data;
};
