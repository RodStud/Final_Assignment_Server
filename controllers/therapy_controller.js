const {db_controller} = require("./db_controller");

exports.therapy_controller = {

    async get_patient_list(user_id) {
        try {
            let result = await db_controller.sql_execute(`
            SELECT p.id,
                   u.first_name,
                   u.last_name,
                   u.login,
                   p.age,
                   p.medical_condition,
                   p.hospital_duration
            FROM tbl_118_patient AS p
                     INNER JOIN tbl_118_user AS u ON p.user_id = u.id
            WHERE p.user_id IN (SELECT patient_id
                                FROM tbl_118_therapy
                                WHERE tbl_118_therapy.doctor_id = '${user_id}')
        `);
            return result;
        } catch(error) {
            return 400;
        }
    }

};