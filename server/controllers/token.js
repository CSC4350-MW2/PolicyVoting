const { StatusCodes } = require("http-status-codes");
const { readFile, writeFile } = require("fs");

const receiveToken = async (req, res) => {
  console.log("Token request recieved");

  const { token } = req.body;
 const tokenObj = { token, timestamp: Date.now() };

 console.log(tokenObj);

  try {
    const tokenFilePath = "./tokens.json";

    readFile(tokenFilePath, (error, data) => {
      if (error) {
        console.log(error);
        return;
      }

      const parsedData = JSON.parse(data);
      console.log(parsedData);
      console.log(typeof parsedData);

      if (!parsedData.includes(token)) {
        parsedData.push(token);
      }

      writeFile(tokenFilePath, JSON.stringify(parsedData, null, 2), (error) => {
        if (error) {
          console.log("Error writing token to file");
          return;
        }
      });
    });
    res
      .status(StatusCodes.OK)
      .json({ success: true, message: "Token received." });
  } catch (err) {
    res
      .status(StatusCodes.INTERNAL_SERVER_ERROR)
      .json({ success: false, message: err.message });
  }
};

module.exports = { receiveToken };
