const pool = require("./../utils/bd");
const serviceComentarios = require ("./comentarios");
const serviceAnimes = require ("./animes");

const calcularPuntajes = async () =>{
    const animes = serviceAnimes.getAnimes();
    for (i=0; i<animes.length; i++){
        const anime = animes [i];
        const comentarios = serviceComentarios.getComentarios(anime.id);

        const sumaPuntajes = 0;
        for (j=0; j<comentarios.length; j++){
            const comentario = comentarios [j];
            sumaPuntajes = sumaPuntajes + comentario.puntaje;
        }

        const puntaje = Math.round(sumaPuntajes / comentarios.length);

        const query = "UPDATE ?? SET  puntaje = ? where id_anime = ?";
        const rows = await pool.query(query,process.env.TABLA_PUNTUACION, puntaje, anime.id);
    };
};

module.exports = {
    calcularPuntajes,
  };