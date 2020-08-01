var createError = require('http-errors');
var express = require('express');
var session = require ('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const ingresoRouter = require('./routes/ingreso');
const registroRouter = require('./routes/registro');
const categoriasRouter = require('./routes/categorias');
const loginRouter = require('./routes/login');
const animesRouter = require('./routes/animes');
const animeRouter = require('./routes/anime');
const adminAnimeRouter = require('./routes/admin/anime');
const adminIndexRouter = require('./routes/admin/index');
const adminUsuariosRouter =require('./routes/admin/usuarios');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
	secret: '1234',
	resave: true,
	saveUninitialized: true
}));


app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/ingreso', ingresoRouter);
app.use('/registro', registroRouter);
app.use('/categorias', categoriasRouter);
app.use('/login', loginRouter);
app.use('/animes',animesRouter);
app.use('/anime', animeRouter);
app.use('/admin/anime', adminAnimeRouter);
app.use('/admin/index', adminIndexRouter);
app.use('/admin/usuarios', adminUsuariosRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});


// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
