const pool = require("./../utils/bd");


const createComentario = async(obj)=>{
  const query = "INSERT INTO ?? SET ? ";
  const params = [process.env.TABLA_COMENTARIOS, obj];
  const rows = await pool.query(query,params);
  return rows;
};

const getComentarios = async (id_anime) => {
  const query = "select * from ?? where id_anime = ? order by ts_create desc";
  const params = [process.env.TABLA_COMENTARIOS, id_anime]
  const rows = await pool.query(query,params);
  return rows; // [{}]
};


module.exports = {
  getComentarios,
  createComentario,
 
};
