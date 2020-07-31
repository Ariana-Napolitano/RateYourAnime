const pool = require('./../utils/bd');

getCategories = async () => {
    try {
        const query = "select id,nombre FROM categorias order by id desc";
        const rows = await pool.query(query);
        return rows;
    } catch ( error ){
        console.log(error)
    }
}
module.exports = {
    getCategories
}