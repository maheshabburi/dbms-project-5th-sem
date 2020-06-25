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
  database : 'food',
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
	console.log("hello");
	// connection.query("SELECT email FROM riders WHERE status='Online' AND streak IN(SELECT MIN(streak) FROM riders WHERE status='Online') ",function(error,results){
	// 	if(error){
	// 		console.log("error occured in send_order:",error);
	// 	}
	// 	else{
	// 		if(results.length>0){
 //             var rider = results.email;
 //             var streak = results.streak;
 //             var set_streak = streak+1;
 //             var orders_s ={
 //             	"order_from" : order_from,
 //             	"order_by" : order_by,
 //             	"rider" : rider,
 //             	"items" : items,
 //             	"total" : total,
 //             	"address" : address,
 //             	"otp":otp
 //             }
 //             connection.query("INSERT INTO `orders` SET ?",orders_s,function(error,results1){
 //  //           	if(error) throw error;

 //             });
 //             connection.query("UPDATE `riders` SET `streak`= '"+set_streak+"' WHERE `email`='"+rider+"'",function(err,results2){
 //      //       	if(err) throw err;
               
 //             });
	// 		}
	// 		else{
	// 			var orders_no={
	// 			"order_from" : order_from,
 //             	"order_by" : order_by,
 //             	"rider" : 'NOT ALLOTED',
 //             	"items" : items,
 //             	"total" : total,
 //             	"address" : address,
 //             	"rider_status": 'not alloted',
 //             	"otp":otp
	// 			}
	// 			connection.query("INSERT INTO orders SET ?",orders_no,function(err,results3){
	// 				//if(err) throw err;
	// 			});
	// 		}
	// 		connection.query("UPDATE orders set rider_status='pending' rider =(SELECT MAX(email) from riders where status='Online' and streak IN(SELECT MIN(streak) FROM riders WHERE status='Online' ) ) where rider_status='not allotted' ",function(err,result){
	// 			//if(err) throw err;
	// 			//res.render("index");
	// 		});
	// 	}
	// }
	// 	);
        
      connection.query("SELECT * FROM orders",function(errr,rest){
      	if(rest.length>0){
      		var order=[];
      		console.log("hi");
      		for(i=0;i<rest.length;i++){
      			var r={
      				'order_id':rest[i].order_id,
      				'order_from':rest[i].order_from,
      				'total':rest[i].total,
      				'address':rest[i].address,
      				'rider':rest[i].rider,
      				'instance':rest[i].instance
      			}
      			order.push(r);
      		}
      		console.log(rest[0].order_from);
      	res.render("view_order",{'order':order});
      	}

      });
	}

	exports.login = function (req,resp){

         var error_msg="";

		var log_email = req.body.log_email;
		var log_pass  = req.body.log_pass;
		console.log(log_email);
		connection.query("SELECT name,password FROM users WHERE email='"+log_email+"' ",function(err,result){
			if(result.length>0){
			if(result[0].password==log_pass){
				var sess = req.session;
				req.session.log_email=log_email;
				req.session.log_name=result[0].name;
				var name = result[0].name;
		//		result.session.log_client="user";
		    connection.query(" SELECT * FROM restaurants ",function(error,results,fields){
      		console.log('results');
      		var rest=[];

			for(i=0;i<results.length;i++){
			var res = {
		//		'session_name':req.session.log_name,
				'name':results[i].name,
				'password':results[i].password,
				'email': results[i].email,
				'phone':results[i].phone,
				'address':results[i].address,
				'description':results[i].description,
				'wallet':results[i].wallet,
				'status':results[i].status
			}
                  rest.push(res);
		}
				resp.render('home',{'rest':rest,'sign_name':name});
				//resp.render('home',{'result':rest});
			});
			}
			else{
			error_msg="incorrect email or password";
		}
		}
		else{
			res.render("index");
		}
	}
		);
		
	}

exports.signup = function(req,resp){
	var error_m='';
	var sign_name=req.body.sign_name;
	var sign_pass=req.body.sign_pass;
	var sign_email=req.body.sign_email;
	var sign_phone=req.body.sign_phone;
	var sign_address=req.body.sign_address;
	console.log(sign_name);
	connection.query("SELECT email from users where email='"+sign_email+"'",function(err,result){
	//	if(err) throw err;
		if(result>0)
            error_m="email already exists";
        else{
        	var user_d={
                  "name":sign_name,
                  "password":sign_pass,
                  "email":sign_email,
                  "phone":sign_phone,
                  "address":sign_address
        	}
        	connection.query("INSERT INTO users SET ?",user_d,function(error,results){
        //		if(err) throw err;
        		var session=req.session;
        		req.session.log_email=sign_email;
        		req.session.log_name=sign_name;
       // 		req.session.log_client="user";
        		connection.query(" SELECT * FROM restaurants ",function(error,results,fields){
      		console.log('results');
      		var rest=[];

			for(i=0;i<results.length;i++){
			var res = {
		//		'session_name':req.session.log_name,
				'name':results[i].name,
				'password':results[i].password,
				'email': results[i].email,
				'phone':results[i].phone,
				'address':results[i].address,
				'description':results[i].description,
				'wallet':results[i].wallet,
				'status':results[i].status
			}
                  rest.push(res);
		}
				resp.render('home',{'rest':rest,'sign_name':sign_name});
				//resp.render('home',{'result':rest});
			});

        	});
        }

	});
}

exports.show_restaurant_menu=function(req,res){
	var res_name=req.body.hotel;
	console.log(res_name);
var rest=[];
var menu=[];
	connection.query("SELECT * FROM restaurants where name='ashwins'",function(err,result){
		
		for(i=0;i<result.length;i++){
			var resp = {
		//		'session_name':req.session.log_name,
				'name':result[i].name,
				'password':result[i].password,
				'email': result[i].email,
				'phone':result[i].phone,
				'address':result[i].address,
				'description':result[i].description,
				'wallet':result[i].wallet,
				'status':result[i].status
			}
                  rest.push(resp);
		}

	});

//	connection.query("SELECT * FROM restaurants where name='ashwins'",function(error,results){
   //                var email=results.email;
   //                req.session.cur_restaurant=email;
                connection.query("SELECT * FROM menu",function(errr,restt){
                	console.log(restt[0].name);
                	for(i=0;i<restt.length;i++){
                		var r={
                			'name':restt[i].name,
                			'restaurant_id':restt[i].restaurant_id,
                			'price':restt[i].price,
                			'sno':restt[i].sno,
                			'discount':restt[i].discount,
                			'description':restt[i].description
                		}
                		menu.push(r);
                	}
                	res.render("restaurant_menu",{'menu':menu});
                });
//	});
	
}