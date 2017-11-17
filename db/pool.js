require('babel-polyfill');
let mysql = require('mysql');

let pool = global.pool;

if(!pool){
	pool = mysql.createPool({
		database:'exam',
		user:'root',
		password:'root'
	});
	//将连接挂在到global
	global.pool = pool;
}

function getConnection(){
	return new Promise(function(resolv,reject){
		pool.getConnection(function(err,conn){
			if(!err){
				resolv(conn);
			}else{
				reject(err);
			}
		})
	})
}

module.exports = { getConnection };