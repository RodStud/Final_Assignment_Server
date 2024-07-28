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
    }
};