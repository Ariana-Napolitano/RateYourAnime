const express = require('express');
const router = express.Router();
const {create}= require('./../models/loginModel');

router.get('/',(req,res) => {
    res.render('registro');
});

router.post('/', async (req,res) =>{
    try {
        const { nombre, correo, pass} = req.body;
        const object = {
          nombre: nombre,
          correo: correo,
          pass: contraseña,
        };
        const result = await create(object);
        console.log(`El insert id retornado es : ${result}`);
        res.redirect("/login");
      } catch (error) {
        console.log(error);
        
      }
});

module.exports = router;