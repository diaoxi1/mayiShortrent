const mysql = require('mysql')
// 设置数据库链接
const query={
    config:{
        host: "localhost",
        port: 3306,
        user: "root",
        password: "youpassword",
        database: "mayi",
        dateStrings:true//日期转为字符串
    },
    sqlConnect:function(sql,sqlArr,callBack){
        /*1.创建连接池，传入config，返回连接对象*/
        var pool = mysql.createPool(this.config);
        // console.log(pool);
        /*2.获取连接对象*/
        pool.getConnection(function(err,connection){
            if(err){
                console.log(connection)
            }
            // if(error) throw error;  // 拓展 try catch throw
            /*3.发送query语句*/
            connection.query(sql,sqlArr,callBack);
            /*4.将链接返回到连接池中，准备由其他人重复使用*/
            connection.release();
        })
    },
    // 事务处理 执行多条sql语句
    execTrans:function(sqlparamsEntities,callback){
        var pool = mysql.createPool(this.config);
        pool.beginTransaction(function(err){
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
        })
    }
}



module.exports=query;