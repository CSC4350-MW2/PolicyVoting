const db = require("../db/connect");
const { StatusCodes } = require("http-status-codes");

const addPolicy = async (req, res) => {
  const { title, description } = req.body;
  try {
    db.collection("policies")
      .add({
        title,
        description,
        votes: 0, // Default is 0 votes
        status: "CURRENT", // Default is "CURRENT" status
      })
      .then((docRef) => {
        res.status(StatusCodes.CREATED).json({ success: true, data: req.body });
      });
  } catch (err) {
    res
      .status(StatusCodes.INTERNAL_SERVER_ERROR)
      .json({ success: false, message: "Failed to create policy" });
  }
};

const getPolicy = async (req, res) => {
  const pol_id = req.params.id;
  try {
    const policy = await db.collection("policies").doc(pol_id).get();
    if (policy.data() == null) throw Error();
    res.status(StatusCodes.OK).json({ success: true, data: policy.data() });
  } catch (err) {
    res
      .status(StatusCodes.NOT_FOUND)
      .json({ success: false, message: "Policy not found." });
  }
};

const getAllPolicies = async (req, res) => {
  const policiesRef = db.collection("policies");
  try {
    const policies = [];
    const policiesRef = db.collection("policies");
    const snapshot = await policiesRef.get();
    snapshot.forEach((policy) => {
      policies.push(policy.data());
    });
    res.status(StatusCodes.OK).json({ success: true, data: policies });
  } catch (err) {
    res
      .status(StatusCodes.INTERNAL_SERVER_ERROR)
      .json({ success: false, data: policies });
  }
};

const getCurrentPolicies = async (req, res) => {
  try {
    const policies = [];
    const policiesRef = db.collection("policies");
    const snapshot = await policiesRef.where("status", "==", "CURRENT").get();
    snapshot.forEach((policy) => {
      policies.push(policy.data());
    });
    res.status(StatusCodes.OK).json({ success: true, data: policies });
  } catch (err) {
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ success: false });
  }
};

const getHistory = async (req, res) => {
  try {
    const policies = [];
    const policiesRef = db.collection("policies");
    const snapshot = await policiesRef.where("status", "==", "COMPLETE").get();
    snapshot.forEach((policy) => {
      policies.push(policy.data());
    });
    res.status(StatusCodes.OK).json({ success: true, data: policies });
  } catch (err) {
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ success: false });
  }
};

module.exports = {
  addPolicy,
  getAllPolicies,
  getCurrentPolicies,
  getPolicy,
  getHistory,
};
