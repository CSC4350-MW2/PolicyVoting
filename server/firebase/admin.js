var admin = require("firebase-admin");

var serviceAccount = require("../policyvoter-a5d55-26689e550ae6.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = { admin };
