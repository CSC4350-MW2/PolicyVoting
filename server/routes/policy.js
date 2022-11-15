const express = require("express");
const router = express.Router();
const {
  addPolicy,
  getPolicy,
  getAllPolicies,
  getCurrentPolicies,
  getHistory,
} = require("../controllers/policy");

router.route("/").post(addPolicy);
router.route("/").get(getAllPolicies);
router.route("/history").get(getHistory);
router.route("/current").get(getCurrentPolicies);
router.route("/:id").get(getPolicy);

module.exports = router;
