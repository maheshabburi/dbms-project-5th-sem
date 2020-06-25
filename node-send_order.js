var mysql      = require('mysql');
var express = require("express");
var app = express();
var deferred = require("deferred");
var bcrypt = require("bcrypt");
//var popupS = require("popups");
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  port : '8080',
  database : 'mahi',
  multipleStatements : true
});
connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... nn");
} else {
    console.log("Error connecting database ... nn" + err);
}
});

exports.send_order = function(req,res){
	var order_from = req.session.cur_restaurant;
	var order_by=req.session.log_email;
	var items = req.items;
	var total = req.total;
	var address = req.address;
	var otp=1212;
	connection.query("SELECT email from riders where status='Online' and streak IN(SELECT MIN(streak) FROM riders WHERE status='Online' ",function(error,results){
		if(error){
			console.log("error occured in send_order:",error);
		}
		else{
			if(results.length>0){
             var rider = results.email;
             var streak = results.streak;
             var set_streak = streak+1;
             var orders_s ={
             	"order_from" : order_from,
             	"order_by" : order_by,
             	"rider" : rider,
             	"items" : items,
             	"total" : total,
             	"address" : address,
             	"otp":otp
             }
             connection.query("INSERT INTO `orders` SET ?",orders_s,function(error,results1){
             	if(error) throw error;

             });
             connection.query("UPDATE `riders` SET `streak`= '"+set_streak+"' WHERE `email`='"+rider+"'",function(err,results2){
             	if(err) throw err;
             });
			}
			else{
				var orders_no={
				"order_from" : order_from,
             	"order_by" : order_by,
             	"rider" : 'NOT ALLOTED',
             	"items" : items,
             	"total" : total,
             	"address" : address,
             	"rider_status": 'not alloted',
             	"otp":otp
				}
				connection.query("INSERT INTO orders SET ?",orders_no,function(err,results3){if(err) throw err;});
			}
			connection.query("UPDATE orders set rider_status='pending' rider =(SELECT MAX(email) from riders where status='Online' and streak IN(SELECT MIN(streak) FROM riders WHERE status='Online' ) ) where rider_status='not allotted' ",function(err,result){if(err) throw err;});
		}
	}
		);
	}

	exports.login = function (req,res){

         var error_msg="";

		var log_email = req.log_email;
		var log_pass  = req.log_pass;
		connection.query("SELECT name,password from users where email='"+log_email+"' ",function(err,result){
			if(err) throw err;
			if(result.password==log_pass){
				var sess = req.session;
				req.session.log_email=log_email;
				req.session.log_name=result.name;
				result.session.log_client="user";
				res.render("home");
			}
		});
		
		else{
			error_msg="incorrect email or password";
		}
	}

exports.signup = function(req,res){
	var error_msg='';
	var sign_name=req.sign_name;
	var sign_pass=req.sign_pass;
	var sign_email=req.sign_email;
	var sign_phone=req.sign_phone;
	var sign_address=req.sign_address;
	connection.query("SELECT email from users where email='"+sign_email"'",function(err,result){
		if(err) throw err;
		if(result>0)
            error_msg="email already exists";
        else{
        	var user_d={
                  "name":sign_name,
                  "password":sign_pass,
                  "email":sign_email,
                  "phone":sign_phone,
                  "address":sign_address
        	}
        	connection.query("INSERT INTO users SET ?",user_d,function(err,results){
        		if(err) throw err;
        		var session=req.session;
        		req.session.log_email=sign_email;
        		req.session.log_name=sign_name;
        		req.session.log_client="user";
        		res.render("home");
        	});
        }
	});
}

