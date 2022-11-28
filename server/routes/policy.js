const express = require("express");
const router = express.Router();
const {
  addPolicy,
  getPolicy,
  getAllPolicies,
  getCurrentPolicies,
  getHistory,
  votePolicy,
} = require("../controllers/policy");

// All preceded by: "/policy"
router.route("/").post(addPolicy);
router.route("/").get(getAllPolicies);
router.route("/history").get(getHistory);
router.route("/current/:userId").get(getCurrentPolicies);
router.route("/:id").get(getPolicy);
router.route("/vote").post(votePolicy);

module.exports = router;
