const express = require("express");
const Itadminrouter = express.Router();

exports.index = (req, res) => {
res.render("itadmin/home.ejs");
};
