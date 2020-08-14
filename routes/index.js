var express = require('express');
var router = express.Router();
let env = require('dotenv').config();
const cron = require('node-cron');
const {getCategories} = require('./../models/categoria');
const comentarios = require('./../models/comentarios');

/* GET home page. */
router.get('/', function(req, res, next) {
  cron.schedule('1-5 * * * *', () => {
    comentarios.calculoComentarios();
  });
  res.render('index', { title: 'Rate Your Anime '});
});

router.get('/', async (req,res)=>{
  const categorias = await getCategories();
  res.render ('index', {categorias});
});

module.exports = router;
