const express = require('express');
const router = express.Router();
const serviceAnimes = require('./../models/animes');

router.get('/single/:id', async (req,res)=> {
    const id = req.params.id; 
    const anime = await serviceAnimes.getAnime(id);
    res.render('anime', {anime, rating});
})

router.get('/all', async(req,res)=> {

})
module.exports = router;