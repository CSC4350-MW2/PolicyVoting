const admin = require("../firebase/admin");
const { readFile, readFileSync } = require("fs");
const path = require("node:path");
const { getMessaging } = require("firebase-admin/messaging");

const getTokens = () => {
  readFile("../tokens.json", (error, data) => {
    console.log("getTokensFunction:");
    console.log(data);
    return JSON.parse(data);
  });
};

const newPolicyNotify = (policy) => {
  console.log("Notification function callled");

  const data = readFileSync(path.join(__dirname, "../tokens.json"));
  console.log("Get tokens");

  const tokens = JSON.parse(data);
  console.log(tokens);

  const payload = {
    notification: {
      title: "New policy available for voting",
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

  console.log("Notification sent");
};

module.exports = { newPolicyNotify };
