const db = require("../db/connect");
const firebase = require("firebase");

const { StatusCodes } = require("http-status-codes");

const addPolicy = async (req, res) => {
  const { title, description } = req.body;
  try {
    db.collection("policies")
      .add({
        title,
        description,
        accept: 0, // Default is 0
        reject: 0, // Default is 0
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

const votePolicy = async (req, res) => {
  const { pol_id, vote, userId } = req.body;
  console.log("Policy Vote received.");
  try {
    // Get user
    const user = await db.collection("users").doc(userId);
    const policy = await db.collection("policies").doc(pol_id);
    // if (policy.data() == null) throw Error();

    if (vote == "accept") {
      const result = await policy.update({
        accept: firebase.firestore.FieldValue.increment(1),
      });
    } else if (vote == "reject") {
      const result = await policy.update({
        reject: firebase.firestore.FieldValue.increment(1),
      });
    }
    user.update({
      policies: firebase.firestore.FieldValue.arrayUnion(pol_id),
    });

    const data = await policy.get();
    res.status(StatusCodes.OK).json({ success: true, data: data.data() });
  } catch (err) {
    console.log(err);
    res
      .status(StatusCodes.NOT_FOUND)
      .json({ success: false, message: "Policy not found." });
  }
};

const getAllPolicies = async (req, res) => {
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
  console.log("Get current policies");
  const { userId } = req.params;
  console.log(`user id: ${userId}`);
  try {
    const user = await db.collection("users").doc(userId).get();
    const userPolices = Object.values(user.data().policies);
    console.log(userPolices);
    policies = [];
    const policiesRef = db.collection("policies");
    const snapshot = await policiesRef.where("status", "==", "CURRENT").get();
    snapshot.forEach((policy) => {
      if (!userPolices.includes(policy.id)) {
        const new_policy = { pol_id: policy.id, ...policy.data() };
        policies.push(new_policy);
      }
    });
    res.status(StatusCodes.OK).json({ success: true, data: policies });
  } catch (err) {
    console.log(err);
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
  votePolicy,
};
