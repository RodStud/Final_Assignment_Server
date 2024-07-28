require('dotenv').config();

const express = require("express");
const app = express();

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 5000;

app.listen(port, host, () => {
    console.log(`Server listens http://${host}:${port}`);
});