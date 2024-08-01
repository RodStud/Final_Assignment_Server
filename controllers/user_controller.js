const {db_controller} = require("./db_controller");

exports.user_controller = {

    async authorization(login, password) {
        try {
            let result = await db_controller.sql_execute(`
                SELECT u.id AS user_id, r.role_name AS role
                FROM tbl_118_user AS u
                         INNER JOIN tbl_118_role AS r ON u.role_id = r.id
                WHERE u.login = "${login}"
                  AND u.password = "${password}"
            `);
            if (result.length > 0) {
                return result
            }
            return 401;
        } catch (error) {
            return 401;
        }
    },

    async get_user(patient_id) {
        try {
            let result = await db_controller.sql_execute(`
                SELECT *
                FROM tbl_118_user AS u
                         INNER JOIN tbl_118_role AS r ON u.role_id = r.id
                WHERE u.id = (SELECT user_id FROM tbl_118_patient WHERE id = ${patient_id})
            `);
            return result[0];
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
            result = await this.authorization(data.login, data.password);
            return result[0].user_id;

        } catch (error) {
            return 400;
        }
    },

    async create_patient(data) {
        try {
            let result = await db_controller.sql_execute(`
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
    },

    async connect_child_to_parent(child_id, parent_id) {
        try {
            let result = await db_controller.sql_execute(`
                INSERT INTO tbl_118_parent (parent_id, child_id)
                VALUES (${parent_id}, ${child_id})
            `);
            return 200;
        } catch (error) {
            return 400;
        }
    },

    async create_child(data, doctor_id) {
                if (data.child.login.length < 9) {
                    return 400;
                }
        try {
            let result = await this.create_user(data.child);
            data.child.user_id = result;
            let temp = await this.create_patient(data.child);
            result = await  db_controller.sql_execute(`SELECT id FROM tbl_118_patient WHERE user_id = ${result}`);
            result = await this.create_therapy(doctor_id, result[0].id);
            result = await this.connect_child_to_parent(data.child);

            if (data.parent_1.login) {
                result = await this.create_user(data.parent_1);
                data.parent_1.user_id = result;
                result = await this.connect_child_to_parent(data.child.user_id, data.parent_1.user_id);
            }
            if (data.parent_2.login) {
                result = await this.create_user(data.parent_2);
                data.parent_2.user_id = result.id;
                result = await this.connect_child_to_parent(data.child.user_id, data.parent_2.user_id);
            }
            return 200;
        } catch (error) {
            return 400;
        }
    },

    async get_hobbies() {
        try {
            let result = await db_controller.sql_execute(`SELECT *
                                                          FROM tbl_118_hobby`);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_hmo() {
        try {
            let result = await db_controller.sql_execute(`SELECT *
                                                          FROM tbl_118_hmo`);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_medical_condition() {
        try {
            let result = await db_controller.sql_execute(`SELECT *
                                                          FROM tbl_118_medical_condition`);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_child_list(parent_id) {
        try {
            let result = await db_controller.sql_execute(`SELECT child_id
                                                          FROM tbl_118_parent
                                                          WHERE parent_id = ${parent_id}`);
            return result[0].child_id;
        } catch (error) {
            return 400;
        }
    },

    async create_therapy(doctor_id, patient_id) {
        try {
            let result = await db_controller.sql_execute(`
                INSERT INTO tbl_118_therapy (doctor_id, patient_id) VALUES (${doctor_id}, ${patient_id})
            `);
            return 200;
        } catch (error) {
            return 400;
        }
    }
};