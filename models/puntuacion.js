const pool = require("./../utils/bd");
const serviceComentarios = require ("./comentarios");
const serviceAnimes = require ("./animes");



calcularPuntajes = async () =>{
    try{
    const animes =await serviceAnimes.getAnimes();
    for (i=0; i<animes.length; i++){
        const anime = animes [i];
        const comentarios =await serviceComentarios.getComentarios(anime.id);

        let sumaPuntajes = 0;
        for (j=0; j<comentarios.length; j++){
            const comentario = comentarios [j];
            sumaPuntajes = sumaPuntajes + comentario.puntaje;
        }
        let puntaje; 

        if (comentarios.length==0){
            puntaje=0;
        }else{
            puntaje= Math.round(sumaPuntajes / comentarios.length);
        }

        const query = "UPDATE ?? SET  puntaje = ? where id_anime = ?";
        const rows = await pool.query(query,[process.env.TABLA_PUNTUACION, puntaje, anime.id]);
    };
        }catch(error){
            console.log(error);
    }
};

module.exports = {
    calcularPuntajes,
};