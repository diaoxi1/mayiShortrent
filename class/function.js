const fn = {
    //事务操作函数
    _getNewSqlParamEntity:function(sql, params, callback) {
        if (callback) {
            return callback(null, {
                sql: sql,
                params: params
            });
        }
        return {
            sql: sql,
            params: params
        };
    },
    getToken :function (app,jwt,openid) {
        // 登录成功，生成token
        // 产生token过期时间，这里设置
        let expires = Date.now() + 7*24*60*60*1000;
        let token = jwt.encode({
            iss: openid, // issuer 表明请求的实体
            exp: expires, // expires token的生命周期
            aud: 'user'
        }, app.get('jwtTokenSecret'));
        return token;
    },
    getNowFormatDate:function(i) {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        var f = date.getMinutes()
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        if(f>=1 && f <=9){
            f ="0"+f
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + f
            + seperator2 + date.getSeconds();
        var newDate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        if(i){
            return newDate;
        }else{
            return currentdate;
        }

    },

    datedifference:function (sDate1, sDate2) {    //sDate1和sDate2是2006-12-18格式
        var dateSpan,
            tempDate,
            iDays;
        sDate1 = Date.parse(sDate1);
        sDate2 = Date.parse(sDate2);
        dateSpan = sDate2 - sDate1;
        dateSpan = Math.abs(dateSpan);
        iDays = Math.floor(dateSpan / (24 * 3600 * 1000));

        return iDays
    },
    GetDateStr:function (newDate,AddDayCount) {
        var dd = new Date(newDate);
        dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
        var y = dd.getFullYear();
        var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
        var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate();//获取当前几号，不足10补0
        return y+"-"+m+"-"+d;
    }

}

module.exports = fn