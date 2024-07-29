const {db_controller} = require("./db_controller");

exports.therapy_controller = {

    async get_patient_list(data) {
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
                                    WHERE tbl_118_therapy.doctor_id = '${data.user_id}')
            `);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_patient(data) {
        try {
            let temp_result;
            let result = {};
            temp_result = await db_controller.sql_execute(`
                SELECT p.id, p.age, u.login, u.first_name, u.last_name
                FROM tbl_118_patient AS p
                         INNER JOIN tbl_118_user AS u ON p.id = u.id
                WHERE p.id = ${data.patient_id}
            `);
            result.patient = temp_result[0];

            temp_result = await db_controller.sql_execute(`
                SELECT u.id, u.first_name, u.last_name, u.email, u.telephone
                FROM tbl_118_parent AS p
                         INNER JOIN tbl_118_user AS u ON p.parent_id = u.id
                WHERE p.child_id = ${data.patient_id};
            `);
            result.parent_1 = temp_result[0];
            result.parent_2 = temp_result[1];

            temp_result = await db_controller.sql_execute(`
                SELECT FORMAT(tp.total_progress * 100, 1)                            AS total_progress,
                       tp.attendance,
                       tp.total_attendance,
                       FORMAT(tp.attendance / tp.total_attendance * 100, 1)          AS percent_attendance,
                       tp.finished_games,
                       tp.total_games,
                       FORMAT(tp.finished_games / tp.total_games * 100, 1)           AS percent_games,
                       FORMAT(tp.personal_result, 1)                                 AS personal_result,
                       FORMAT(tp.average_result, 1)                                  AS average_result,
                       FORMAT((tp.personal_result / tp.average_result - 1) * 100, 1) AS result_diff
                FROM tbl_118_therapy AS t
                         INNER JOIN tbl_118_therapy_progress AS tp ON t.id = tp.therapy_id
                WHERE t.patient_id = ${data.patient_id};
            `);
            result.therapy_progress = temp_result[0];

            temp_result = await db_controller.sql_execute(`
                SELECT *
                FROM tbl_118_session AS s
                WHERE s.therapy_id = (SELECT t.id
                                      FROM tbl_118_therapy AS t
                                      WHERE t.patient_id = ${data.patient_id})
                  AND s.session_number >
                      (SELECT t.session_counter FROM tbl_118_therapy AS t WHERE t.patient_id = ${data.patient_id});
            `);
            result.schedule = temp_result[0];

            result.requests = await db_controller.sql_execute(`
                SELECT r.id, r.game_id, r.title, r.content
                FROM tbl_118_request AS r
                WHERE r.recipient_id = ${data.doctor_id}
                  AND r.sender_id = (SELECT user_id FROM tbl_118_patient WHERE id = ${data.patient_id})
                  AND r.status = "No Reply";
            `);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_therapy_list(data) {
        try {
            let result = await db_controller.sql_execute(`
                SELECT id AS therapy_id, therapy_type
                FROM tbl_118_therapy
                WHERE doctor_id = ${data.doctor_id}
                  AND patient_id = ${data.patient_id}
            `);
            return result;
        } catch (error) {
            return 400;
        }
    },

    async get_physical_info(therapy_id) {
        let result = await db_controller.sql_execute(`
            SELECT s.therapy_id, s.session_number, s.date, p.*
            FROM tbl_118_therapy AS t
                     INNER JOIN tbl_118_session AS s ON t.id = s.therapy_id
                     INNER JOIN tbl_118_p_characteristic AS p ON p.id = s.id
            WHERE t.id = ${therapy_id}
              AND s.session_number = t.session_counter;
        `);
        return result[0];
    },

    async get_games_progress(session_id) {
        let result = await db_controller.sql_execute(`
            SELECT g.*,
                   FORMAT(gp.game_progress * 100, 1)                        AS game_progress,
                   FORMAT(gp.achievement_progress * 100, 1)                 AS achievement_progress,
                   FORMAT(gp.personal_result, 1)                            AS personal_result,
                   FORMAT(gp.total_progress * 100, 1)                       AS total_progress,
                   FORMAT(gp.total_achievements * 100, 1)                   AS total_achievements,
                   FORMAT(gp.total_result, 1)                               AS total_result,
                   FORMAT((gp.total_result / g.average_score - 1) * 100, 1) AS result_diff
            FROM tbl_118_game_progress AS gp
                     INNER JOIN tbl_118_game AS g ON g.id = gp.game_id
            WHERE gp.session_id = ${session_id};
        `);
        return result;
    },

};