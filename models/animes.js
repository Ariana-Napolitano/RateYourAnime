const express = require ('express');
const router = express.Router();
const pool = require ("../utils/bd");

getAnimes = async () => {
    try{
        const query = "SELECT a.id, a.nombre, a.imagen, a.rating, c.nombre_categoria, c.id FROM animes as a JOIN categorias as c where a.id_categoria = c.id";
        const rows = await pool.query(query, [process.env.TABLA_ANIMES, process.env.TABLA_CATEGORIAS]);
        return rows;    
    }catch (error) {
        console.log (error);
    }
};
getAnime = async (id) => {
    try {
        const query = "SELECT id, nombre, descripcion, imagen, rating FROM ?? WHERE id = ?";
        const params = [process.env.TABLA_ANIMES, id];
        const rows = await pool.query(query, params);
        return rows [0];
    }catch (error){
        console.log(error);
    }
};

create = async(obj)=>{
    try{
        const query = "INSERT INTO ?? SET ?"
        const params = [process.env.TABLA_ANIMES,obj];
        return await pool.query(query, params);
    }catch(error){
        console.log(error);
    }
};
update = async(obj) =>{
    try{
        const query ="UPDATE INTO ?? SET ?"
        const params = [process.env.TABLA_ANIMES, obj];
        return await pool.query(query,params);
    }catch(error){
        console.log(error);
    }
};

module.exports = {
    getAnimes,
    getAnime,
    create,
    update,
} 