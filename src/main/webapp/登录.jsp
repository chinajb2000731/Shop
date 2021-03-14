<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登陆</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}js/jquery-2.1.1.min.js"></script>
<style>
.tab {
	overflow: hidden;
	margin-top: 20px; margin-bottom:-1px;
}
.tab li {
	display: block;
	float: left;
	width: 100px;padding:10px 20px; cursor:pointer; border:1px solid #ccc; 
}
.tab li.on {
	background: #90B831; color:#FFF;padding:10px 20px;
}
.conlist {padding:30px; border:1px solid #ccc; width:300px;}
.conbox {
	display: none;
}
</style>
<script>
$(function(){
	$(".tab li").each(function(i){
		$(this).click(function(){
		$(this).addClass("on").siblings().removeClass("on");
		$(".conlist .conbox").eq(i).show().siblings().hide();
		})
	})
})
    
 function login() {
     // alert("112");
     // 验证账号密码不能为空
     //取得账号密码
     var loginAct = $.trim($("#loginAct").val());
     var loginPwd = $.trim($("#loginPwd").val());
     if (loginAct == "" || loginPwd == "") {

         $("#msg").html("账号密码不能为空");
         return false;

     }
     //去后台验证登录相关操作
     $.ajax({
         url:"settings/user/login.do",
         data:{
             "loginAct":loginAct, "loginPwd":loginPwd

         },
         type:"post",
         dataType:"json",
         success:function (data) {

             if(data.success)

             {
                 location.href="settings/product/showcart.do?flag=0&loginAct="+loginAct;


             }else {
                 $("#msg").html(data.msg);

             }

         },
         error:function(e){
            alert(e);
         }

     })
 }


function sellerlogin() {
    // alert("112");
    // 验证账号密码不能为空
    //取得账号密码
    var loginAct = $.trim($("#sellerloginAct").val());
    var loginPwd = $.trim($("#sellerloginPwd").val());
    if (loginAct == "" || loginPwd == "") {

        $("#msg2").html("账号密码不能为空");
        return false;

    }
    //去后台验证登录相关操作
    $.ajax({
        url:"settings/seller/login.do",
        data:{
            "loginAct":loginAct, "loginPwd":loginPwd

        },
        type:"post",
        dataType:"json",
        success:function (data) {

            if(data.success)

            {
                location.href="settings/product/showcart.do?flag=1&tloginAc="+loginAct;

            }else {

                $("#msg2").html(data.msg);
            }

        },
        error:function(e){
            alert(e);
        }

    })
}

 $(function () {

     $("#loginAct").val("");
     $("#sellerloginAct").val("");
   /*  $(window).keydown(function (event) {

     if(event.keyCode==13)
     {
        login();
     }
 })*/

 })
 //为当前登录页报绑定敲键盘事件

</script>
</head>

<body>
<div class="login-top">
    <div class="wrapper">
        <div class="fl font30">LOGO</div>
        <div class="fr">您好，欢迎为生活充电在线！</div>
    </div>
</div>
<div class="l_main">
    <div class="l_bttitle2"> 
        <!-- <h2>登录</h2>-->
        <h2><a href="default.jsp">< 返回首页</a></h2>
    </div>
    <div class="loginbox fl">
        <div class="tab">
            <ul>
                <li class="on">我是买家</li>
                <li>我是卖家</li>
            </ul>
        </div>
        <div class="conlist">
            <div class="conbox" style="display:block;">

                  <span id="msg" style="color: red"></span>
                <p>
                    <input type="text" class="loginusername" id="loginAct">
                </p>
                <p>
                    <input type="password" class="loginuserpassword" id="loginPwd">
                </p>
                <p><span class="fl fntz14 margin-t10"><a href="注册.jsp" style="color:#ff6000">立即注册</a></span><span class="fr fntz12 margin-t10"><a href="#">忘记密码？</a></span></p>
                <p>
                    <input type="button" class="loginbtn" value="登  录" onclick="login()"/>
                </p>

            </div>
            <div class="conbox">
                <span id="msg2" style="color: red"></span>
            	<p>
                    <input type="text" class="loginusername" id="sellerloginAct">
                </p>
                <p>
                    <input type="password" class="loginuserpassword" id="sellerloginPwd">
                </p>
                <p><span class="fl fntz14 margin-t10"><a href="注册.jsp" style="color:#ff6000">立即注册</a></span><span class="fr fntz12 margin-t10"><a href="#">忘记密码？</a></span></p>
                <p>
                    <input type="button" class="loginbtn" value="登  录" onclick="sellerlogin()">
                </p>

            </div>
        </div>
    </div>
    
    <div class="fr margin-r100 margin-t45"><img src="images/login-pic.jpg" width="507" height="325"></div>
</div>
</body>
</html>
