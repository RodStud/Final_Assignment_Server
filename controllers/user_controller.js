const {db_controller} = require("./db_controller");

exports.user_controller = {

    async authorization(data) {
        try {
            let result = await db_controller.sql_execute(`
                SELECT u.id AS user_id, r.role_name AS role
                FROM tbl_118_user AS u
                         INNER JOIN tbl_118_role AS r ON u.role_id = r.id
                WHERE u.login = "${data.login}"
                  AND u.password = "${data.password}"
            `);
            return result;
        } catch (error) {
            return 401;
        }
    },

    async get_user(data) {
        try {
            let result = await db_controller.sql_execute(`
                SELECT *
                FROM tbl_118_user AS u
                         INNER JOIN tbl_118_role AS r ON u.role_id = r.id
                WHERE u.id = ${data.user_id}
            `);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async create_user(data) {
        try {
            let result = await db_controller.sql_execute(`
                INSERT INTO tbl_118_user (login, password, first_name, last_name, telephone, email, role_id)
                VALUES ("${data.login}", "${data.password}", "${data.first_name}",
                        "${data.last_name}", "${data.telephone}", "${data.email}",
                        ${data.role_id})
            `);
            return 200;
        } catch (error) {
            return 400;
        }
    },

    async create_patient(data) {
        try {
            result = await db_controller.sql_execute(`
                INSERT INTO tbl_118_patient (user_id, birthday, age, hmo, medical_condition, hospital_duration)
                VALUES (${data.user_id}, "${data.birthday}",
                        TIMESTAMPDIFF(YEAR, '${data.birthday}', CURDATE()),
                        "${data.hmo}", "${data.medical_condition}",
                        ${data.hospital_duration})
            `);
            return 200;
        } catch (error) {
            return 400;
        }
    }
};