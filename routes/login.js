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
    var contraseña = req.body.contraseña;
    const resultado = await logueado(nombre, contraseña);
    if(resultado.length == 1){
        console.log('logueado');
        req.session.username = nombre;
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