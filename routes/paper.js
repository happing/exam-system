require('babel-polyfill');
var express = require('express');
var paperDB = require('../db/paperDB');

var paper = express.Router();

paper.get('/types',function(req,resp){
	var sql = "select * from tbl_exam_subjecttype";
	findAllInfo(sql,resp);
})
paper.get('/departmentes',function(req,resp){
	var sql = "select * from tbl_exam_department";
	findAllInfo(sql,resp);
})
paper.get('/levels',function(req,resp){
	var sql = "select * from tbl_exam_subjectlevel";
	findAllInfo(sql,resp);
})
paper.get('/topics',function(req,resp){
	var sql = "select * from tbl_exam_topic";
	findAllInfo(sql,resp);
})

paper.post('/querySubject',function(req,resp){
	var queryInfo = req.body;
	var dep = queryInfo['subject.department.id'];
	var topic = queryInfo['subject.topic.id'];
	var types = queryInfo['subject.subjectType.id'];
	var level = queryInfo['subject.subjectLevel.id'];
	var sql = "select * from tbl_exam_subject where department_id="+dep+" and subjectLevel_id="+level+" and subjectType_id="+types+" and topic_id="+topic;
	findAllInfo(sql,resp);
})

paper.post('/findById',function(req,resp){
	var sql = "select * from tbl_exam_choice where subject_id="+req.body.id;
	findAllInfo(sql,resp);
})

//审核通过&不通过
paper.post('/checkSubject',function(req,resp){
	var sql = "update tbl_exam_subject set checkState='"+req.body['subject.checkState']+"' where id="+req.body['subject.id'];
	findAllInfo(sql,resp);
})
//级联删除
paper.post('/delete',function(req,resp){
	var sql = "delete from tbl_exam_subject where id="+req.body['subject.id'];
	findAllInfo(sql,resp);
})
//查询题目所有可选信息
function findAllInfo(sql,resp){
	paperDB.All(sql).then(function(data){
		resp.end(JSON.stringify(data));
	}).catch(function(err){
		console.log(err);
	})
}
module.exports = paper;