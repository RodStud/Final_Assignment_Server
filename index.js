require('dotenv').config();

const express = require("express");
const app = express();

const {user_controller} = require('./controllers/user_controller.js');

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 5000;

app.use(express.json());

app.post("/login", async function (request, response) {
    let result = await user_controller.authorization(request.body);
    if (result == 401) {return response.status(401).send("Incorrect login or password");}
    return response.json(result);
});

app.listen(port, host, () => {
    console.log(`Server listens http://${host}:${port}`);
});