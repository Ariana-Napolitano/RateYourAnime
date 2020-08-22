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

getCategoria = async (id) => {
    try {
        const query = "select a.nombre, a.imagen, c.id, c.nombre_categoria from animes as a join categorias as c where c.id = ?";
        const params = id;
        const rows = await pool.query (query, params);
        return rows;
    } catch(error){
        console.log(error)
    }
};
module.exports = {
    getCategories,
    getCategoria
}