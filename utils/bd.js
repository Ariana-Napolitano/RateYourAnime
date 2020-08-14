const mysql = require ('mysql');
const util = require ('util');

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'rateyouranime',
    connectionLimit: 10,
});

pool.query = util.promisify(pool.query);

module.exports = pool; 