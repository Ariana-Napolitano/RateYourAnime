var express = require('express');
var router = express.Router();
const {getCategories} = require('./../models/categoria');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Rate Your Anime '});
});

router.get('/', async (req,res)=>{
  const categorias = await getCategories();
  res.render ('index', {categorias});
});

module.exports = router;
