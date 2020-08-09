const pool = require("./../utils/bd");

const getComentarios = async (id_anime) => {
  const query = "select * from ?? order by ts_create where id_anime = ?";
  const rows = await pool.query(query, process.env.TABLA_COMENTARIOS, id_anime);
  return rows; // [{}]
};


module.exports = {
  getComentarios,
 
};
