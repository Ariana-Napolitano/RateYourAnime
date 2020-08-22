const express = require ('express');
const router = express.Router();
const pool = require ("../utils/bd");




getAnimes = async () => {
    try{
        const query = "SELECT a.id, a.nombre, a.imagen, c.nombre_categoria, p.puntaje FROM animes as a INNER JOIN categorias as c on a.id_categoria = c.id INNER JOIN puntuacion as p on p.id_anime= a.id  WHERE estado= 1";
        const rows = await pool.query(query);
        return rows;    
    }catch (error) {
        console.log (error);
    }
};
getAnime = async (id) => {
    try {
        const query = "SELECT a.id, a.nombre, a.descripcion, a.imagen, c.nombre_categoria, p.puntaje FROM animes as a INNER JOIN categorias as c on a.id_categoria = c.id INNER JOIN puntuacion as p on p.id_anime= a.id WHERE a.id = ?";
        const params = [id];
        const rows = await pool.query(query, params);
        return rows [0];
    }catch (error){
        console.log(error);
    }
};
createPuntaje = async (puntaje) => {
    try{
        const query = "INSERT INTO ?? SET ?"
        const params = [process.env.TABLA_PUNTUACION, puntaje];
        const rows= await pool.query(query, params);
        return rows.insertId;
    }catch(error){
        console.log(error);
    }
};


create = async(obj)=>{
    try{
        const query = "INSERT INTO ?? SET ?"
        const params = [process.env.TABLA_ANIMES, obj];
        const rows= await pool.query(query, params);

        const puntaje = {
            id_anime: rows.insertId,
            puntaje: 0
        }

        createPuntaje(puntaje);

        return rows.insertId;
    }catch(error){
        console.log(error);
    }
};

update = async(id,obj) =>{
    try{
        const query ="UPDATE ?? SET nombre = ?, id_categoria = ?,descripcion =?,imagen =?  where id = ?"
        const params = [process.env.TABLA_ANIMES,obj.nombre, obj.id_categoria, obj.descripcion, obj.imagen,id];
        return await pool.query(query,params);
    }catch(error){
        console.log(error);
    }
};

buscarAnime = async (nombre) =>{
    try {
        const query = "SELECT id, nombre, imagen FROM ?? WHERE nombre LIKE ?";
        const params = [process.env.TABLA_ANIMES, "%"+nombre+"%"];
        return await pool.query (query, params);
    }catch(error) {
        console.log (error);
    }
};




module.exports = {
    getAnimes,
    getAnime,
    create,
    update,
    buscarAnime
} 