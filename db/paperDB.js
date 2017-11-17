require('babel-polyfill');
var pool = require('./pool');
module.exports = {
	//执行所有的增删改查
	All(sql){
		return new Promise(function(resolv,reject){
			pool.getConnection().then(function(conn){
				connection = conn;
				conn.query(sql,function(err,results){
					if(!err){
						resolv(results);
					}else{
						reject(err);
					}
				})
			}).catch(function(err){
				reject(err);
			}).finally(function(){
				connection.release();
				console.log('释放完成');
			})
		})
	}
}