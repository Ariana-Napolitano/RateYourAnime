const pool = require('./../utils/bd');

getCategories = async () => {
    try {
        const query = "select id,nombre_categoria FROM categorias order by id";
        const rows = await pool.query(query);
        return rows;
    } catch ( error ){
        console.log(error)
    }
}
module.exports = {
    getCategories
}