var express    = require("express");
var login = require('./routes/node-send_order');
var bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
var session = require('express-session');
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 60000 }
}));
//var router = express.Router();
// test route
app.use(express.static('images'));
app.use(express.static('public'));
app.use(express.static('css'));
app.get('/', function(req, res) {
    res.render('index');
    console.log('got /');
});
//app.use(express.static(path.join('./css', 'css')));
app.set('view engine','pug');
app.set('views','./views');
//route to handle user registration
//app.post('/signup',function(req,res){
//    res.render('signup');
//});
app.get('/view_order',login.send_order);
app.post('/signup',login.signup);
app.post('/login',login.login);
app.post('/sendorder',login.send_order);
app.get('/restaurant',login.show_restaurant_menu);
app.get('/logout',function(req,res){
	res.render('index');
});
//app.post('/addnote',login.addnote);
//app.post('/addingnote',login.addingnote);
//app.post('/signedout',login.signedout);
//app.post('/login2',login.login2);
//app.use('/api', router);
app.listen(5000);