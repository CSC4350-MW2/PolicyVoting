const db = require("../db/connect");

const addPolicy = async (req, res) => {
  const { title, description } = req.body;
  db.collection("policies")
    .add({
      title,
      description,
      votes: 0, // Default is 0 votes
      status: "CURRENT", // Default is "CURRENT" status
    })
    .then((docRef) => {
      console.log("Document written with ID: ", docRef.id);
      res.status(201).json({ message: "Success", data: req.body });
    })
    .catch((error) => {
      console.error("Error adding document: ", error);
    });
};

const getAllPolicies = async (req, res) => {
  const policies = [];
  const policiesRef = db.collection("policies");
  const snapshot = await policiesRef.get();
  snapshot.forEach((policy) => {
    policies.push(policy.data());
  });
  res.status(200).json({ message: "Success", data: policies });
};

const getCurrentPolicies = async (req, res) => {
  const policies = [];
  const policiesRef = db.collection("policies");
  const snapshot = await policiesRef.where("status", "==", "CURRENT").get();
  snapshot.forEach((policy) => {
    policies.push(policy.data());
  });
  res.status(200).json({ message: "Success", data: policies });
};

const getPolicy = (req, res) => {};

module.exports = { addPolicy, getAllPolicies, getCurrentPolicies, getPolicy };
