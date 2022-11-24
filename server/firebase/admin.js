var admin = require("firebase-admin");

var serviceAccount = require("../policyvoter-a5d55-firebase-adminsdk-75dd5-a4b4f4a5f2.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = { admin };
