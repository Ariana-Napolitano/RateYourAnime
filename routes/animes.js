const express = require('express');
const router = express.Router();
const serviceAnimes = require('./../models/animes');


router.get('/', async(req,res)=> {
    const animes = await serviceAnimes.getAnimes()
    res.render ("adminanimes", {animes});
});

router.get('/:id', async (req,res)=> {
    const id = req.params.id; 
    const anime = await serviceAnimes.getAnime(id);
    res.render('animes', {anime});
});

module.exports = router;