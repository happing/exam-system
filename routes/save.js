require('babel-polyfill');
var express = require('express');
var paperDB = require('../db/paperDB');

var save = express.Router();

save.post('/saveSubject',function(req,resp){
	var queryInfo = req.body;
	var dep = queryInfo['subject.department.id'];
	var topic = queryInfo['subject.topic.id'];
	var types = queryInfo['subject.subjectType.id'];
	var level = queryInfo['subject.subjectLevel.id'];
	var stem = queryInfo['subject.stem'];
	var analysis = queryInfo['subject.analysis'];
	var choiceContent = queryInfo['choiceContent'];
	var checkState = queryInfo['checkState'];
	var choiceContents = queryInfo['choiceContents[]'];
	var choiceCorrect = queryInfo['choiceCorrect[]'];

	var sql = "insert into tbl_exam_subject(stem,department_id,subjectLevel_id,subjectType_id,topic_id,analysis,answer,checkState) values('"+stem+"',"+dep+","+level+","+types+","+topic+",'"+analysis+"','"+choiceContent+"','"+checkState+"')";
	findSubject(sql,resp).then((ids)=>{
		choiceCorrect.forEach(function(item,index){
		var sql = "insert into tbl_exam_choice(content,correct,subject_id) values('"+choiceContents[index]+"',"+item+","+ids+")";
			findAllInfo(sql,resp);
		})
	});
})

function findAllInfo(sql,resp){
	paperDB.All(sql).then(function(data){
		resp.end(JSON.stringify(data));
	}).catch(function(err){
		console.log(err);
	})
}


function findSubject(sql,resp){
	return new Promise((resolve, reject)=>{
		paperDB.All(sql).then(function(data){
			resolve(data.insertId);
		}).catch(function(err){
			console.log(err);
		})
	}); 
}
module.exports = save;