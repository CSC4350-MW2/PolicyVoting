require("dotenv").config();
const firebase = require("firebase/app");
require("firebase/firestore");

const firebaseConfig = {
  apiKey: process.env.API_KEY,
  authDomain: process.env.AUTH_DOMAIN,
  projectId: process.env.PROJECT_ID,
  storageBucket: process.env.STORAGE_BUCKET,
  messagingSenderId: process.env.MESSAGING_SENDER_ID,
  appId: process.env.APP_ID,
  measurementId: process.env.MEASUREMENT_ID,
};

const initFirebase = () => {
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
};

module.exports = initFirebase;
