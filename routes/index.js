const express = require('express');
const router = express.Router();
const query = express.mysql
const fn = express.fn
const selector = require('./../module/selector')

// 拦截GET请求
router.get('/',(req,res,next)=>{
    let data;
    query.sqlConnect(selector.ctiyAll,(err,city)=>{
        if(err){
            console.log(err)
            res.status(404).send('服务器错误!')
            return;
        }
        if(city){
            data = city
            query.sqlConnect(selector.homeGoods,(err,result)=>{
                if(err){
                    console.log(err)
                    res.status(404).send('服务器错误!')
                    return;
                }
                if(result){
                   for(let i in data) {
                       data[i].cityList = []
                       for (let j in result) {
                           if(result[j].Ctiy_name == data[i].Ctiy_name) {
                               data[i].cityList.push(result[j])
                           }
                       }
                   }
                    res.json({
                        code:'200',
                        data:data
                    })
                }else {
                    res.json({
                        code:'200',
                        city:{},
                        data:{}
                    })
                }
            })
        }
    })

})

router.get('/CityList',(req,res)=>{
    query.sqlConnect(selector.CityList,(err,result)=>{
        if(err){
            console.log(err)
            res.status(404).send('服务器错误！')
        }
        if(result){
            res.json({
                code:200,
                CityList:result
            })
        }
    })
})

//房间搜索接口
// citySearch
router.get('/citySearch',(req,res,next)=>{
    let citySearch = req.query.citySearch || req.query.citysearch
    query.sqlConnect(selector.citySearch,citySearch,(err,result)=>{
        if(err){
            console.log(err)
            res.status(404).send('服务器错误!')
            return;
        }
        if(result){
            res.json({
                code:200,
                city:req.query.citySearch,
                data:result
            })
        }
    })
})

//房间详情接口
router.get('/info',(req,res,next)=>{
    console.log(req.query.House_id)
    var House_id =  req.query.House_id || req.query.house_id
    if(House_id){
        houseRecommend(House_id,res);
    }else{
        res.json({
            code:-1,
            msg:'House_id is not defined'
        })
    }
})

//房屋详情封装方法
function houseRecommend(House_id,res) {
    let houseImg
    let houseComment
    let housedescribe
    let houseRecommend
    let cityAndpfAndmoney
    //所有图片
    query.sqlConnect(selector.houseImg,House_id,(err,result)=>{
        if(err){
            console.log(err)
            res.json({
                code:404,
                msg:'服务器错误'
            })
        }
        if(result.length){
            console.log(result.length)
            houseImg = result
            //所有评论
            query.sqlConnect(selector.houseComment,House_id,(err,result)=>{
                if(err){
                    console.log(err)
                    res.json({
                        code:404,
                        msg:'服务器错误'
                    })
                }
                if(result){
                    houseComment = result
                    //房屋描述
                    query.sqlConnect(selector.housedescribe,House_id,(err,result)=>{
                        if(err){
                            console.log(err)
                            res.json({
                                code:404,
                                msg:'服务器错误'
                            })
                        }
                        if(result){
                            housedescribe = result[0]

                                //房东推荐
                                query.sqlConnect(selector.houseRecommend,[housedescribe.users_id,House_id],(err,result)=>{
                                    if(err){
                                        console.log(err)
                                        res.json({
                                            code:404,
                                            msg:'服务器错误'
                                        })
                                    }
                                    if(result){
                                        houseRecommend = result
                                        //同类型房源推荐
                                        query.sqlConnect(selector.cityAndpfAndmoney,[House_id,House_id,House_id],(err,result)=>{
                                            if(err){
                                                console.log(err)
                                                res.json({
                                                    code:404,
                                                    msg:'服务器错误'
                                                })
                                            }
                                            if(result){
                                                res.json({
                                                    code:200,
                                                    houseImg:houseImg,
                                                    houseComment:houseComment,
                                                    housedescribe:housedescribe,
                                                    cityAndpfAndmoney:result,
                                                    houseRecommend:houseRecommend
                                                })
                                            }
                                        })
                                    }
                                })
                        }
                    })
                }
            })
        }else{
            res.json({
                code:200,
                msg:'没有当前房屋的信息'
            })
        }
    })
}

//房间已被预订日期查询
/*
* 接口地址:/calendadate
* 请求方式：get
* 传入参数：house_id
* */
router.get('/calendadate',(req,res)=>{
    query.sqlConnect(selector.calendadate,req.query.house_id,(err,result)=>{
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
//首页的搜索接口
/*
* /index/citySearchTime?citySearch=成都&startTime=2019-01-26&endTime=2019-01-28
* @接口地址 /citySearchTime
* @请求方式 get
* @传入参数 citySearch || citysearch,[startTime||startTime],[endTime,||endtime]
*
* */
router.get('/citySearchTime',(req,res)=>{
    let citySearch = req.query.citySearch || req.query.citysearch
    let startTime = req.query.startTime || req.query.startTime
    let endTime = req.query.endTime || req.query.endtime
    if(startTime && endTime){
        query.sqlConnect(selector.citySearchTime,[citySearch,startTime,endTime],(err,result)=>{
            if(err){
                console.log(err)
                res.status(404).send('服务器错误!')
                return;
            }
            if(result){
                res.json({
                    code:200,
                    city:req.query.citySearch,
                    startTime:startTime,
                    endTime:endTime,
                    data:result
                })
            }
        })
    }else if(citySearch){
        query.sqlConnect(selector.citySearch,citySearch,(err,result)=>{
            if(err){
                console.log(err)
                res.status(404).send('服务器错误!')
                return;
            }
            if(result){
                res.json({
                    code:200,
                    city:req.query.citySearch,
                    data:result
                })
            }
        })
    }else{
        res.json({
            code:-1,
            msg:'筛选条件为空！'
        })
    }
})


module.exports = router