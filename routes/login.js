const express = require("express");
const router = express.Router();
const {logueado} = require("./../models/loginModel");

router.get("/", async (req, res) => {
    try {
      res.render("login");
    } catch (error) {
        console.log(error);
    }
  });
router.post("/", async (req, res, next) => {
    var nombre = req.body.nombre;
    var pass = req.body.pass;
    const resultado = await logueado(nombre, pass);
    if(resultado.length == 1){
        console.log(resultado);
        console.log('logueado');
        req.session.userId = resultado [0].id;
        console.log(req.session.userId);
        req.session.username = nombre;
        req.session.iniciado = true;
        if(resultado[0].admin == 1){
            req.session.admin = true;
            res.redirect('/admin/anime');
        }
        else{
            req.session.admin = false;
            res.redirect('/');
        }
    }
    else {
        console.log('usuario o contraseña incorrectas');
    }


});
module.exports = router;