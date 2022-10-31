require("dotenv");
const express = require("express");
const app = express();
const policyRouter = require("./routes/policy");

app.use(express.json());
app.use("/policy", policyRouter);

const port = process.env.PORT || 3000;

app.listen(port, console.log(`Listening on http://localhost:${port}`));
