var express = require('express');
var router = express.Router();
let env = require('dotenv').config();
const cron = require('node-cron');
const {getCategories} = require('./../models/categoria');
const puntuacion = require('./../models/puntuacion');
const { calcularPuntajes } = require('./../models/puntuacion');
const serviceAnime = require ('./../models/animes');


cron.schedule('*/30 * * * * *', () => {
  puntuacion.calcularPuntajes();
});
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Rate Your Anime '});
});

router.get('/', async (req,res)=>{
  const categorias = await getCategories();
  res.render ('index', {categorias});
});
router.post('/animes', async (req,res)=>{
  const nombre = req.body.buscador;
  const animes = await serviceAnime.buscarAnime(nombre);
  res.render ('animes', {animes});
});

module.exports = router;
