const express = require("express");
const router = express.Router();
const { receiveToken } = require("../controllers/token");

router.route("/").post(receiveToken);

module.exports = router;
