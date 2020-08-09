const express = require("express");
const router = express.Router();
const multer = require("multer");
const config = { dest: "./public/tmp" };
const upload = multer(config);
const { getAnimes, getAnime, create, update } = require("./../../models/animes");
const { getCategories } = require("./../../models/categoria");
const imageHandler = require("./../../utils/imageHandler");

router.get("/modificacion/:id", async (req, res) => {
 if(req.session.admin){
  let { id } = req.params;
  const anime = await getAnime(id);
  const categorias = await getCategories(); 
  console.log(anime)
  console.log(categorias)
  res.render("adminmodif", { anime, categorias});
}else{
  res.send("No tenes permisos para ingresar");
}
});

router.post("/modificacion/:id", upload.single("imagen"), async (req, res) => {
  try {
    console.log(req.body)
    console.log(req.file)
    
    const handledImage = await imageHandler.saveImage(req.file);
    let { nombre, descripcion, id_categoria } = req.body;
    const obj= {
      nombre: nombre,
      descripcion: descripcion,
      id_categoria: parseInt(id_categoria),
      imagen: "images/" + handledImage,
    };
    let { id } = req.params;
    console.log(id);
    const result = await update(id, obj);
    console.log(`El insert id a editar es : ${result}`);
    res.render("adminmodif", { message: "Anime modificado con exito." });
  } catch (error) {
    console.log(error);
   
  }
});

router.get("/baja/:id", async (req, res) => {
  if(req.session.admin){
  try {
    const { id } = req.params;
    const result = await update(id, { estado: 0 });
    res.redirect("/admin/anime");
  } catch (error) {}
  }
  else{
    res.send("no tenes permisos para ingresar")
  }
 
});



router.get("/alta", async (req, res) => {
 if(req.session.admin){
  const categorias = await getCategories();
  res.render("altaanime", { categorias }); // categorias
}else{
  res.send("No tenes permisos para ingresar");
}
});

router.post("/alta", upload.single("imagen"), async (req, res) => {
  try {
  
    const handledImage = await imageHandler.saveImage(req.file);
    const { nombre, descripcion, id_categoria} = req.body;
    const object = {
      nombre: nombre,
      descripcion: descripcion,
      id_categoria: parseInt(id_categoria),
      imagen: "images/" + handledImage
    };
    const result = await create(object);
    console.log(`El insert id retornado es : ${result}`);
    res.render("altaanime", { message: "Anime dado de alta" });
  } catch (error) {
    console.log(error);
    
  }
});


router.get("/", async (req, res) => {
 if(req.session.admin){
  try {
    const animes = await getAnimes();
    res.render("adminanimes", {animes});
  } catch(error) {
    console.log(error);
  }
}else{
  res.send("No tenes permisos para ingresar");
}
});


module.exports = router;
