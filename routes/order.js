const express = require('express');
const router = express.Router();
const query = express.mysql
const fn = express.fn
const selector = require('./../module/selector')
const db = require('./../module/db')

//提交订单路由
router.post('/added',(req,res,next)=>{
    var sqlParamsEntity = [];
    let order = req.body.order
    let order_createTime = fn.getNowFormatDate()
    var days = fn.datedifference(order.check_time,order.outCheck_time)
    //事务1
    let sql1 = selector.addOrder
    let param1 = [order.house_id,express.openid,order.check_count,order.contact_name,order.contact_tel,order.check_name,order.check_ID,order_createTime,order.check_time,order.outCheck_time,0,order.Price,days]
    sqlParamsEntity.push(fn._getNewSqlParamEntity(sql1, param1));
    //事务2
    //构建sql
    let sql2 = selector.adddate
    let param2 =[]
    for(let i = 0;i<days;i++){
        sql2 += `(?,'${fn.GetDateStr(order.check_time,i)}')`
        if(i<days-1){
            sql2 +=','
        }else{
            sql2 +=';'
        }
        param2.push(parseInt(order.house_id))
    }
    sqlParamsEntity.push(fn._getNewSqlParamEntity(sql2, param2))
    db.execTrans(sqlParamsEntity,function (err,result) {
        if(err){
            console.log(err)
            res.json({
                code:-1,
                msg:'订单提交失败'
            });
            return
        }
        if(result){
            res.json({
                code:200,
                msg:'订单提交成功,跳转付款'
            });
        }else{
            res.json({
                code:-1,
                msg:'操作失败，请稍后再试！'
            });
        }
    })
})


//获取当前用户刚刚下的订单
router.post('/newOrder',(req,res)=>{
    query.sqlConnect(selector.newOrder,express.openid,(err,result)=>{
        if(err){
            res.json({
                code:-1,msg:'服务器错误'
            })
        }
        if(result){
            res.json({
                code:200,
                data:result
            })
        }
    })
})

//用户付款接口
router.post('/Shopping',(req,res)=>{
    let obj = req.body
    var sqlParamsEntity = [];
    let sql1 = selector.updateMoney
    let param1 = [obj.Price,express.openid]
    sqlParamsEntity.push(fn._getNewSqlParamEntity(sql1, param1))
    let sql2 = selector.updataOrder
    let param2 = [express.openid,obj.order_id]
    sqlParamsEntity.push(fn._getNewSqlParamEntity(sql2, param2))
    db.execTrans(sqlParamsEntity,function (err,result) {
        if(err){
            console.log(err)
            if(err =='受影响的行数为0'){
                res.json({
                    code:-1,
                    msg:'订单信息错误'
                });
            }else{
                res.json({
                    code:-1,
                    msg:'服务器错误'
                });
            }

            return
        }
        if(result){
            res.json({
                code:200,
                msg:'付款成功！'
            });
        }else{
            res.json({
                code:-1,
                msg:'付款失败'
            });
        }
    })
})

//获取当前用户所有的订单信息
router.post('/userAllOrder',(req,res)=>{
    query.sqlConnect(selector.userAllOrder,express.openid,(err,result)=>{
            if(err){
                res.json({
                    code:-1,
                    msg:'服务器错误'
                })
            }
            if(result){
                res.json({
                    code:200,
                    data:result
                })
            }else{
                res.json({
                    code:-1,
                    msg:'服务器错误'
                })
            }
    })
})

/*
* 用户提交评论接口
* 传入参数:
*   token,//用户标识
*   order_id，订单的id
*   house_id,//房屋的从订单中获取id
*   commentText,//评论的内容
*   Score//分数
* 请求方式:POST
* 返回值：
*   code 200成功，MSG为一般消息提醒
* */
router.post('/addadComment',(req,res)=>{
    let house_id = req.body.house_id || req.body.House_id
    let user_openid = express.openid
    let commentText = req.body.commentText
    let Score = req.body.Score
    let createTime = fn.getNowFormatDate(true)
    let order_id = req.body.order_id
    console.log(req.body)

    var sqlParamsEntity = [];
    if(house_id && user_openid){
        let sql1 = selector.addadcommenttable
        let pramr1 = [house_id,user_openid,commentText,Score,createTime,order_id]
        sqlParamsEntity.push(fn._getNewSqlParamEntity(sql1,pramr1))
        let sql2 =selector.updateOrderComment
        let pramr2 = order_id
        sqlParamsEntity.push(fn._getNewSqlParamEntity(sql2,pramr2))
    //    执行事务
        db.execTrans(sqlParamsEntity,function (err,result) {
            if(err){
                console.log(err)
                if(err =='受影响的行数为0'){
                    res.json({
                        code:-1,
                        msg:'评论信息错误或该订单已经评论'
                    });
                }else{
                    res.json({
                        code:-1,
                        msg:'服务器错误'
                    });
                }

                return
            }
            if(result){
                res.json({
                    code:200,
                    msg:'提交成功！'
                });
            }else{
                res.json({
                    code:-1,
                    msg:'付款失败'
                });
            }
        })
    }else{
        res.json({
            code:-1,
            msg:'house_id is not null and not login'
        })
    }





})


module.exports = router