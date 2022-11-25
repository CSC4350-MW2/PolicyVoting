const admin = require("../firebase/admin");
const { readFile, readFileSync } = require("fs");
const path = require("node:path");
const { getMessaging } = require("firebase-admin/messaging");


const sendNotification = (policy, message) => {
  const data = readFileSync(path.join(__dirname, "../tokens.json"));

  const tokens = JSON.parse(data);
  console.log(tokens);

  const payload = {
    notification: {
      title: message,
      body: policy.title,
    },
    tokens: tokens,
  };

  getMessaging()
    .sendMulticast(payload)
    .then((response) => {
      if (response.failureCount > 0) {
        const failedTokens = [];
        response.responses.forEach((resp, idx) => {
          if (!resp.success) {
            failedTokens.push(registrationTokens[idx]);
          }
        });

        console.log("List of tokens that caused failures: " + failedTokens);
      }
    });

}


module.exports = { sendNotification };
