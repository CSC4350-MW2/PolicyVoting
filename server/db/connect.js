const firebase = require("firebase/app");

// Initialize Cloud Firestore and get a reference to the service
const db = firebase.firestore();

module.exports = db;
