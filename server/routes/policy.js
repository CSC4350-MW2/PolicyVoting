const express = require("express");
const router = express.Router();
const {
  addPolicy,
  get,
  getPolicy,
  getAllPolicies,
  getCurrentPolicies,
} = require("../controllers/policy");

router.route("/").post(addPolicy);
router.route("/").get(getAllPolicies);
router.route("/current").get(getCurrentPolicies);
router.route("/{id}").get(getPolicy);

module.exports = router;
