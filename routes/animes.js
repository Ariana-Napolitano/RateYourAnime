const express = require('express');
const router = express.Router();
const serviceAnimes = require('./../models/animes');
const serviceComentarios = require('./../models/comentarios');


router.get('/', async(req,res)=> {
    const animes = await serviceAnimes.getAnimes()
    res.render ("animes", {animes});
});

router.get('/:id', async (req,res)=> {
    const id = req.params.id; 
    const anime = await serviceAnimes.getAnime(id);
    const comentarios = await serviceComentarios.getComentarios(id);
    res.render('anime', {anime, comentarios});
});

router.post('/:id/comentario', async (req,res)=>{
    const id = req.params.id;
    const {puntaje, comentario} = req.body;
    const obj = {
        id_usuario: req.session.userId,
        id_anime: id,
        puntaje: puntaje,
        comentario: comentario,
    };
    const comentarioNuevo = await serviceComentarios.createComentario(obj);
    const anime =await serviceAnimes.getAnime(id);
    const comentarios = await serviceComentarios.getComentarios(id);
    res.render('anime', {anime,comentarios});

});


module.exports = router;