const pool = require("./../utils/bd");

const getComentarios = async () => {
  const query = "select * from ?? order by ts_create";
  const rows = await pool.query(query, process.env.TABLA_COMENTARIOS);
  return rows; // [{}]
};

module.exports = {
  getComentarios,
};
