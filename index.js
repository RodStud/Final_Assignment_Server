require('dotenv').config();

const express = require("express");
const session = require("express-session");
const cookieParser = require("cookie-parser");
const RedisStore = require('connect-redis')(session);
const redis = require('redis');
const app = express();


const {user_controller} = require('./controllers/user_controller.js');
const {therapy_controller} = require("./controllers/therapy_controller");

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 5000;

app.use(express.json());

const redisClient = redis.createClient({
    url: 'redis://red-cqm2r4hu0jms73fkkhh0:6379'
});

redisClient.on('error', (err) => {
    console.error('Redis error: ', err);
});

let secret = 'JKirjes998ifds4k';
app.use(cookieParser(secret));
app.use(session({
    store: new RedisStore({ client: redisClient }),
    secret: secret,
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: true,
        maxAge: 1000 * 60 * 60 * 24
    }
}));

app.use((request, response, next) => {
    response.set({
        'Access-Control-Allow-Origin': 'http://se.shenkar.ac.il',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
        'Content-Type': 'application/json'
    });
    next();
});

const cors = require('cors');

app.use(cors({
    origin: 'http://se.shenkar.ac.il',
    credentials: true
}));

app.post("/login", async function (request, response) {
    const {login, password} = request.body;
    let result = await user_controller.authorization(login, password);
    if (result === 401) {
        return response.status(401).send({"user_id": 0});
    }
    request.session.user_id = result[0].user_id;
    return response.json(result[0]);
});

app.get("/test_auth", async function (request, response) {
    if (request.session.user_id > 0) return response.status(200).send();
    return response.status(401).send();
});

app.get("/logout", async function (request, response) {
    request.session.destroy();
    return response.status(200).send();
});

app.get("/patient", async function (request, response) {
    let result = {};
    result.patient = await therapy_controller.get_patient(request.query.patient_id, request.session.user_id);
    result.therapy_list = await therapy_controller.get_therapy_list(request.query.patient_id, request.session.user_id);
    if (result.patient == 400 || result.therapy_list == 400) {
        return response.status(400).send("Wrong doctor or patient ID");
    }
    return response.json(result);
});

app.post("/patient_add", async function (request, response) {
    let result = await user_controller.create_child(request.body, request.session.user_id);
    if (result == 400) {
        return response.status(400).send("Incorrect or incomplete data");
    }
    return response.status(200).send();
});

app.get("/hobbies", async function (request, response) {
    let result = await user_controller.get_hobbies();
    if (result == 400) {
        return response.status(400).send("No hobbies found");
    }
    return response.json(result);
});

app.get("/hmo", async function (request, response) {
    let result = await user_controller.get_hmo();
    if (result == 400) {
        return response.status(400).send("No hmo found");
    }
    return response.json(result);
});

app.get("/medical_condition", async function (request, response) {
    let result = await user_controller.get_medical_condition();
    if (result == 400) {
        return response.status(400).send("No diagnoses found");
    }
    return response.json(result);
});

app.get("/patient_list", async function (request, response) {
    let patient_list = await therapy_controller.get_patient_list(request.session.user_id);
    if (patient_list === 400) {
        return response.status(400).send("Wrong user ID");
    }
    return response.json(patient_list);
});

app.get("/therapy", async function (request, response) {
    let therapy = await therapy_controller.get_therapy(request.query.therapy_id);
    if (therapy == 400) {
        return response.status(400).send("Wrong therapy or session ID");
    }
    return response.json(therapy);
});

app.get("/parent", async function (request, response) {
    let child_id = await user_controller.get_child_list(request.session.user_id)
    if (child_id === 400) {
        return response.status(400).send("Wrong user ID");
    }
    let child = {};
    child = await therapy_controller.get_patient(child_id, 0);
    if (child === 400) {
        return response.status(400).send("Wrong user ID");
    }
    child.p_info = await therapy_controller.get_physical_info(child.therapy_progress.therapy_id);
    child.therapy_list = await therapy_controller.get_therapy_list(child_id, child.therapy_progress.doctor_id)
    child.user_info = await user_controller.get_user(child_id);
    child.games = await therapy_controller.get_games(child.therapy_progress.therapy_id);
    child.requests = await therapy_controller.get_requests(request.session.user_id);
    return response.json(child);
});

app.get("/parent_appointment", async function (request, response) {
    let appointments = await therapy_controller.get_appointments(request.session.user_id);
    if (appointments === 400) {
        return response.status(400).send("Wrong user ID");
    }
    return response.json(appointments);
});

app.listen(port, host, () => {
    console.log(`Server listens http://${host}:${port}`);
});
