const mysql = require("mysql2/promise");

exports.db_controller = {
    async Create_Connection() {
        let connection = await mysql.createConnection({
            host     : process.env.DB_HOST,
            user     : process.env.DB_USERNAME,
            password : process.env.DB_PASSWORD,
            database : process.env.DB_NAME
        });
        return connection;
    },

    async sql_execute(query) {
        const connection = await this.Create_Connection();
        const [rows] = await connection.execute(query);
        connection.end();
        return rows;
    }
};
