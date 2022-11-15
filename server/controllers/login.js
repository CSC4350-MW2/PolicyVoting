const db = require("../db/connect.js");
const { StatusCodes } = require("http-status-codes");

const login = async (req, res) => {
  const { username, password } = req.body;
  try {
    const users = [];
    const userRef = db.collection("users");
    const snapshot = await userRef.where("username", "==", username).get();
    snapshot.forEach((user) => {
      users.push(user.data());
    });

    if (users[0] == null) throw new Error("User does not exist.");
    if (users[0].password != password) throw new Error("Incorrect password.");

    res.status(StatusCodes.OK).json({ success: true, data: users[0] });
  } catch (err) {
    res
      .status(StatusCodes.UNAUTHORIZED)
      .json({ success: false, message: err.message });
  }
};

module.exports = { login };
