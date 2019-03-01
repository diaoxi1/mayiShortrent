var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
express.mysql = require('./module/mysql')
express.fn = require('./class/function')
var selector =require('./module/selector')

const jwt =  require('jwt-simple')
var https = require("https");

var indexRouter = require('./routes/index');
var orderRouter = require('./routes/order')
var usersRouter = require('./routes/users')

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// 创建一个用户专属令牌
app.set('jwtTokenSecret', 'diaoxin');

let appid ='wx0bfd1015d1db2f91'//appid
let secret ='84adec11fde11b54f5e4292b377524b6'//secret

var user ={}

app.post('/token',(req,res)=>{
    let userInfo = req.body.userInfo//上传的用户信息
    let code = req.body.code//code上传的code
    console.log(code)
    let url = 'https://api.weixin.qq.com/sns/jscode2session?appid='+appid+'&secret='+secret+'&js_code='+code+'&grant_type=authorization_code'
    if(code){
        https.get(url, function (ress) {
            ress.on('data', function (data) {
                user = JSON.parse(data.toString())
                console.log(user)
                if(user.openid){
                    console.log(user.openid)
                    express.mysql.sqlConnect(selector.users,user.openid,(err,result)=>{
                        if(err){
                            res.json({
                                code:-1,
                                msg:'服务器错误'
                            })
                        }
                        if(!result.length) {
                            console.log("没有这个用户，先插入数据库",user.openid)
                            express.mysql.sqlConnect(selector.addUsers,[user.openid,userInfo.avatarUrl,userInfo.city,userInfo.country,userInfo.languages,userInfo.nickName,userInfo.province,userInfo.gender],(err,result)=>{
                                if(err){
                                    res.json({
                                        code:-1,
                                        msg:'服务器错误'
                                    })
                                }
                                if(result.affectedRows){
                                    res.json({
                                        code:200,
                                        token:express.fn.getToken(app,jwt,user.openid)
                                    })
                                }else{
                                    res.json({
                                        code:-2,
                                        msg:'新用户登记失败'
                                    })
                                }
                            })
                        }else{
                            console.log("有这个用户，登录")
                            res.json({
                                code:200,
                                token:express.fn.getToken(app,jwt,user.openid)
                            })
                        }
                    })
                }else{
                    res.json({
                        code:-1,
                        msg:'userCode无效'
                    })
                }
            });
        })
    }else{
        res.json({
        code:401,
        msg:'code'
    })
}
})


app.post('*',(req,res,next)=>{
    // 接受解析令牌
    let token = req.body.token ||req.query.token
    let err ={code:401,msg:'token错误，请重新登录'}
    let overtime ={code:401,msg:'token超时'}
    // 验证令牌是否合法
    if(token){
        // 解析令牌
        let decoded  = jwt.decode(token, app.get('jwtTokenSecret'));
        // 读取openid，方便以后的所有位置获取
        express.openid = decoded.iss
        if(decoded.exp >= Date.now() && decoded.aud == 'user'){
            next()
        }else{
            res.json(overtime)
        }
    } else {
        res.json(err)
    }

})








app.use('/index', indexRouter);
app.use('/order',orderRouter);
app.use('/users',usersRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
