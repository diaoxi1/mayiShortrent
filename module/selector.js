// 这个文件定义存储所有的sql语句
const selector = {
    register:'INSERT INTO u_user (u_name,pwd) VALUES (?,?)',
    commodity:'SELECT * FROM commodity',
    //城市列表
    CityList:'select Ctiy_name FROM citytable',
    //热门城市
    ctiyAll:'SELECT Ctiy_name FROM citytable LIMIT 0,4',
    //首页城市分类显示所有城市接口
    homeGoods:'SELECT house_info.Houser_name,house_info.House_address,house_info.House_Price,citytable.Ctiy_name,housetable.House_id,house_img.img_url,house_info.Houser_Bed_size,house_info.House_square,house_info.Houser_Bed,house_info.House_pf,house_info.Houser_Type FROM housetable,house_info,citytable,house_img WHERE housetable.House_id = house_info.Houser_id AND housetable.City_id = citytable.City_id AND house_img.House_id =housetable.House_id  GROUP BY housetable.House_id',
    //城市搜索接口
    citySearch:'SELECT Ctiy_name,housetable.House_id,house_info.House_Price,house_info.House_address,house_info.Houser_name,house_info.Houser_Type,house_info.Houser_Bed,house_img.img_url,house_info.House_pf,house_info.Houser_Bed_size,house_info.House_square,users.avatarUrl FROM housetable,citytable,house_info,house_img,users,users_house_rp WHERE citytable.Ctiy_name =? AND housetable.City_id = citytable.City_id AND house_info.Houser_id = housetable.House_id AND house_img.House_id =housetable.House_id AND users_house_rp.House_id =housetable.House_id and users.users_id = users_house_rp.users_id GROUP BY housetable.House_id',
    //城市加入住日期筛选接口
    citySearchTime:'SELECT a.* FROM (SELECT Ctiy_name,housetable.House_id,house_info.House_Price,house_info.House_address,house_info.Houser_name,house_info.Houser_Type,house_info.Houser_Bed,house_img.img_url,house_info.House_pf,house_info.Houser_Bed_size,house_info.House_square,users.avatarUrl FROM housetable,citytable,house_info,house_img,users,users_house_rp WHERE citytable.Ctiy_name = ? AND housetable.City_id = citytable.City_id AND house_info.Houser_id = housetable.House_id AND house_img.House_id = housetable.House_id AND users_house_rp.House_id = housetable.House_id AND users.users_id = users_house_rp.users_id GROUP BY housetable.House_id) a WHERE a.House_id not in(SELECT houser_id FROM house_datatable WHERE houser_data BETWEEN ? AND ? GROUP BY houser_id)',
    //房间详情
    //房间被预订的日期
    calendadate:'SELECT houser_data FROM house_datatable WHERE house_datatable.houser_id = ?',
    //房间的所有图片
    houseImg:'SELECT * FROM house_img WHERE house_img.House_id = ?',
    //房间所有的评论
    houseComment: 'SELECT users.nickName,users.avatarUrl,commenttable.house_comment_Text,commenttable.house_create_time,commenttable.house_comment_Score FROM commenttable,users WHERE commenttable.house_id = 1 AND users.user_openid = commenttable.house_comment_user_openid',
    //房间描述：
    housedescribe:' SELECT a.*,users.avatarUrl,users.nickName,users.users_id FROM users_house_rp,users,(SELECT Houser_id,describe_Text FROM house_describe WHERE Houser_id =?) a WHERE users_house_rp.House_id = a.Houser_id AND users.users_id = users_house_rp.users_id',
    //同类型房源推荐
    cityAndpfAndmoney:`SELECT a.* FROM housetable,citytable,
(SELECT * FROM (SELECT house_info.*,house_img.img_url FROM house_info,house_img,(SELECT house_info.House_Price,house_info.House_pf FROM house_info WHERE Houser_id = ? GROUP BY Houser_id) a WHERE house_info.House_Price BETWEEN a.House_Price - 50 AND a.House_Price+50  or house_info.House_pf  BETWEEN a.House_pf-0.5 AND  a.House_pf AND house_info.Houser_id AND house_img.House_id = house_info.Houser_id GROUP BY house_info.Houser_id) a WHERE a.Houser_id not IN(SELECT Houser_id FROM house_info WHERE Houser_id= ?)) a
WHERE citytable.Ctiy_name in(SELECT citytable.Ctiy_name FROM citytable,housetable WHERE housetable.House_id = ? AND housetable.City_id = citytable.City_id) AND housetable.City_id =citytable.City_id AND a.Houser_id = housetable.House_id`,
    //房东同类型房源推荐
    houseRecommend:'SELECT users_house_rp.House_id,house_info.House_Price,house_info.House_address,house_info.Houser_name,house_info.Houser_Type,house_info.Houser_Bed,house_img.img_url,house_info.House_pf FROM users_house_rp,house_info,house_img WHERE users_house_rp.users_id = ? AND house_info.Houser_id = users_house_rp.House_id AND house_img.House_id = users_house_rp.House_id  AND users_house_rp.House_id not IN(SELECT users_house_rp.House_id FROM house_info,users_house_rp WHERE users_house_rp.house_id = ? and house_info.Houser_id =users_house_rp.House_id) GROUP BY users_house_rp.House_id',
    //用户查询
    users:'SELECT * FROM users WHERE user_openid = ?',
    //创建用户
    addUsers:'INSERT INTO users (user_openid, avatarUrl, city,country,languages,nickName,province,gender) VALUES (?,?,?,?,?,?,?,?)',
    //提交订单
    addOrder:'INSERT INTO order_table ( house_id,user_openid,check_count,contact_name, contact_tel, check_name, check_ID, order_createTime, check_time, outCheck_time, order_state,Price,days)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)',
    //新增预定时间:
    adddate:'INSERT INTO house_datatable (houser_id,houser_data) VALUES ',
    //获取用户刚刚创建的订单
    newOrder:'SELECT order_table.order_id,order_table.contact_tel,order_table.contact_name,order_table.check_name,order_table.check_ID,order_table.check_time,order_table.outCheck_time,order_table.order_createTime,order_table.Price,order_table.order_state,house_info.Houser_name,house_info.Houser_Type,house_info.Houser_Bed,house_info.House_address,house_img.img_url FROM order_table,house_info,house_img WHERE user_openid = ?  AND house_info.Houser_id = order_table.house_id AND house_img.House_id = house_info.Houser_id ORDER BY order_createTime DESC LIMIT 0,1',
    //获取用户余额
    userMoney:'SELECT moneyCount FROM money WHERE user_openid = ?',
    //用户提交订单扣款
    updateMoney:'UPDATE money SET  moneyCount = moneyCount - ? WHERE user_openid =?',
    //用户扣款成功 更新订单状态
    updataOrder:'UPDATE order_table SET order_table.order_state = 1 WHERE user_openid =? AND order_id = ?',
    //用户全部订单
    userAllOrder:'SELECT order_table.order_id,order_table.days,order_table.check_time,order_table.outCheck_time,order_table.Price,house_info.Houser_name FROM order_table,house_info WHERE order_table.user_openid = ? AND house_info.Houser_id = order_table.house_id GROUP BY order_table.order_id',
    //用户提交评论
    addadcommenttable:'INSERT INTO commenttable (house_id,house_comment_user_openid,house_comment_Text,house_comment_Score,house_create_time,order_id) VALUES (?,?,?,?,?,?)'
//    评论后修改订单状态
    ,updateOrderComment:'UPDATE order_table SET comments = 1 WHERE order_id = ? AND comments =0'
}
module.exports = selector