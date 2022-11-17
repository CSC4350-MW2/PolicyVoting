require("dotenv");
const express = require("express");
const cors = require("cors");
const app = express();

const policyRouter = require("./routes/policy");
const loginRouter = require("./routes/login");

app.use(cors());
app.use(express.json());
app.use("/policy", policyRouter);
app.use("/login", loginRouter);

const port = process.env.PORT || 3000;

app.listen(port, console.log(`Listening on http://localhost:${port}`));
