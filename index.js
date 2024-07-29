require('dotenv').config();

const express = require("express");
const app = express();

const {user_controller} = require('./controllers/user_controller.js');
const {therapy_controller} = require("./controllers/therapy_controller");

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 5000;

app.use(express.json());

app.post("/login", async function (request, response) {
    let result = await user_controller.authorization(request.body);
    if (result == 401) {return response.status(401).send("Incorrect login or password");}
    return response.json(result);
});

app.get("/patient", async function (request, response) {
    let patient = await therapy_controller.get_patient(request.query.patient_id, request.session.user_id);
    if (patient == 400) {return response.status(400).send("Wrong patient ID");}
    return response.json(patient_list);
});

app.post("/patient_add", async function (request, response) {
    let result = await user_controller.create_child(request.body);
    if (result == 400) {return response.status(400).send("Incorrect or incomplete data");}
    return response.status(200).send("OK");
});

app.get("/patient_list", async function (request, response) {
    let patient_list = await therapy_controller.get_patient_list(request.body.user_id);
    if (patient_list == 400) {return response.status(400).send("Wrong user ID");}
    return response.json(patient_list);
});

app.listen(port, host, () => {
    console.log(`Server listens http://${host}:${port}`);
});