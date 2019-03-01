var db = {};
var mysql = require('mysql');
var async = require('async');
var pool = mysql.createPool({
    host: 'localhost',
    port:'3306',
    user: 'root',
    password : 'youpassword',
    database : 'mayi',
    dateStrings:true//日期转为字符串
});
//建立连接池
function getConnection(callback){
    pool.getConnection(function(err, connection) {
        if (err) {
            console.log('数据库连接失败!');
            console.log(err);
            callback(null);
            return;
        }
        callback(connection);
    });
}



//执行单条sql语句
db.exec = function(sql,param,callback){
    getConnection(function(connection){
        if(connection){
            connection.query(sql,param,function(err,result){
                if(err){
                    console.log(err);
                    callback(err,null);
                    return;
                }
                callback(null,result);
            });
            connection.release();
        }else{
            callback('数据库连接失败',null);
        }
    });
}

//执行事物
db.execTrans = function(sqlparamsEntities,callback){
    getConnection(function(connection){
        if(connection){
            connection.beginTransaction(function(err){
                if (err) {
                    console.log(err);
                    return;
                }
                var funcAry = [];
                sqlparamsEntities.forEach(function (sql_param) {
                    var temp = function (cb) {
                        var sql = sql_param.sql;
                        var param = sql_param.params;
                        connection.query(sql, param, function (err, result) {
                            if (err) {
                             
                                cb(err,null);
                                return;
                            }
                            if(result.affectedRows){
                                cb(null,result);

                            }else{
                                let err = '受影响的行数为0'
                                cb(err,null);
                                return;
                            }
                        });
                    };
                    funcAry.push(temp);
                });
                async.series(funcAry,function(err,result){

                    if(err){
                        connection.rollback(function () {
                            connection.release();
                        });
                        callback(err, null);
                        return;
                    }
                    connection.commit(function (err) {
                        if(err){
                            console.log(err);
                            return;
                        }
                        connection.release();
                        callback(null,true );
                    });
                });
            });
        }else{
            callback('数据库连接失败',null);
        }
    });
}

module.exports = db;
