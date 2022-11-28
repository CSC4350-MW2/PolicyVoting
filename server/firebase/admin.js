require("dotenv").config();
var admin = require("firebase-admin");

var serviceAccount = require(process.env.SERVICE_ACCOUNT_JSON);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = { admin };
