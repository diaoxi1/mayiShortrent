const express = require('express');
const router = express.Router();
const query = express.mysql
const fn = express.fn
const selector = require('./../module/selector')
const db = require('./../module/db')

//获取用户余额
router.post('/money',(req,res)=>{
    query.sqlConnect(selector.userMoney,express.openid,(err,result)=>{
        if(err){
            res.json({
                code:-1,
                msg:'服务器错误'
            })
        }
        if(result){
            res.json({
                code:200,
                money:result[0].moneyCount
            })
        }
    })
})




module.exports = router