<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>半小时生活圈</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/supplie.css" rel="stylesheet" type="text/css" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function productsearch() {
            var keyword=$("#keyword").val();
            location.href="settings/product/productsearch.do?keyword="+keyword;

        }
    </script>
</head>

<body>
<!--头部导航-->
<div class="nofix_head">
    <div class="top wrapper">
        <div class="float-lt margin-b10">
            <ul>
                <c:choose>
                    <c:when test="${empty user and empty seller}">
                        <a href="登录.jsp" class="green">请登录</a>
                        <a href="注册.jsp" class="green">免费注册</a>
                    </c:when>
                    <c:when test="${empty user and !empty seller}">
                        <span>欢迎:【${seller.name}】</span>&nbsp&nbsp
                        <a href="settings/product/selectusercenterorder.do?cid=${seller.loginAct}&flag=1" class="green" >用户中心</a>&nbsp&nbsp
                        <a href="settings/seller/selectsellershop.do?sid=${seller.sid}" class="green">店铺专区</a>
                    </c:when>
                    <c:otherwise>
                        <span>欢迎:【${user.name}】</span>&nbsp&nbsp
                        <a href="settings/product/selectusercenterorder.do?cid=${user.loginAct}&flag=0" class="green">用户中心</a>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="float-rt">
            <ul>
                <c:choose>
                    <c:when test="${empty user and empty seller}">
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0)">首页</a></li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0)">首页</a></li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">消息中心</a></li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="user_order.jsp">我的购物车<b>(${totalcartnum})</b></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
<!--头部导航END--> 

<!--头部快捷栏-->
<div class="clear wrapper header">
    <div class="logo float-lt" style="margin-right:130px;"><img src="images/logo.png" width="193" height="97" /></div>
    <div class="search float-lt">
        <div class="search_list">
            <ul>
                <li class="current"><a href="settings/product/productlists.do?cid=1">产品</a></li>
              <%--  <li><a href="javascript:void(0)">信息</a></li>--%>
            </ul>
        </div>
        <div class="clear search_cur">
            <ul>
                <li>
                    <input name="searchName" id="keyword" class="search_box" onkeydown="keyDownSearch()" type="text">
                </li>
            </ul>
            <ul>
                <li class="search_btn"><a href="javascript:void(0)" onclick="productsearch()">搜索</a></li>
            </ul>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
    </div>
    <div class="homecart float-rt">购物车<strong>(${totalcartnum})</strong></div>
</div>
<!--头部快捷栏END-->

<div class="clear">&nbsp;</div>




<!--网站-->
<div class="wrapper hour-circle">
    <c:choose>
        <c:when test="${empty user and empty seller}">
            <div class="tipbox margin-b20">请先 <a href="登录.jsp">登录</a> 查看我的半小时生活圈</div>
        </c:when>

        <c:otherwise>
            <div class="hour-user margin-b10">
                <span class="padding-r20"><b class="font18 colorred">0</b>家商户</span>
                <span>通过 <b>我的位置：四川省郫都区西南交通大学(犀浦校区)犀安路999号</b></span>
            </div>
        </c:otherwise>
    </c:choose>

	<!-- left -->
	<div class="fl left">
		<div class="seclect">
			<input type="checkbox" class="middle">
			<lable>超市优先</lable>
			<input type="checkbox" class="middle">
			<lable>人气优先</lable>
		</div>
		<ul class="itemlist">
			<li>
				<div class="fl pic">
                	<div><img src="images/p_032.jpg" alt=""></div>
                	<div class="Bliuyan"><a href="" class="margin-t10">给我留言</a></div>
                </div>
				<div class="fl num">1</div>
				<div class="fl info">
					<a href="" class="font16 tit">商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称</a>
					<p style="margin-left:28px;">地址：商户店铺名称商户店铺名称商户店铺名称</p>
					<p style="margin-left:70px;">商户店铺地址商户店铺地址商户店铺</p>
					<p class="margin-t15">经营范围：商家填写的经营范围</p>
				</div>
				<div class="fr collect">
					<span class="half fr">半</span>
					<div class="clear"></div>
					<a href="" class="fr fav">收藏</a>
				</div>
			</li>
			<li>
				<div class="fl pic">
                	<div><img src="images/p_032.jpg" alt=""></div>
                	<div class="Bliuyan"><a href="" class="margin-t10">给我留言</a></div>
                </div>
				<div class="fl num">2</div>
				<div class="fl info">
					<a href="" class="font16 tit">商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称</a>
					<p style="margin-left:28px;">地址：商户店铺名称商户店铺名称商户店铺名称</p>
					<p style="margin-left:70px;">商户店铺地址商户店铺地址商户店铺</p>
					<p class="margin-t15">经营范围：商家填写的经营范围</p>
				</div>
				<div class="fr collect">
					<span class="half fr">半</span>
					<div class="clear"></div>
					<a href="" class="fr fav-no">收藏</a>
				</div>
			</li>
            <li>
				<div class="fl pic">
                	<div><img src="images/p_032.jpg" alt=""></div>
                	<div class="Bliuyan"><a href="" class="margin-t10">给我留言</a></div>
                </div>
				<div class="fl num">3</div>
				<div class="fl info">
					<a href="" class="font16 tit">商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称商户店铺名称</a>
					<p style="margin-left:28px;">地址：商户店铺名称商户店铺名称商户店铺名称</p>
					<p style="margin-left:70px;">商户店铺地址商户店铺地址商户店铺</p>
					<p class="margin-t15">经营范围：商家填写的经营范围</p>
				</div>
				<div class="fr collect">
					<span class="half fr">半</span>
					<div class="clear"></div>
					<a href="" class="fr fav">收藏</a>
				</div>
			</li>
		</ul>
	</div>
	<!-- left END-->
	
	<!-- right -->
	<div class="right fr">
		<img src="images/map.png" alt="">
		<div class="adress">
			<ul>
				<li>江苏省南京市六合区XX街道OO路OO路X村X组 龙池花园11幢一单元101室</li>
				<li>江苏省南京市六合区XX街道OO路OO路X村X组 龙池花园11幢一单元101室</li>
				<li>江苏省南京市六合区XX街道OO路OO路X村X组 龙池花园11幢一单元101室</li>
			</ul>
		</div>
	</div>
	
	<!-- right END-->
</div>

<div class="clear">&nbsp;</div>

<!--网站地图-->
<div class="fri-link-bg">
    <div class="fri-link">
        <div class="logo float-lt margin-r20"></div>
        <div class="float-lt">
        </div>
        <ul class="link-add float-lt ma">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
        <ul class="link-add float-lt">
            <li><a href="#" class="font14">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
            <li><a href="#">网站栏目</a></li>
        </ul>
    </div>
</div>

</body>
</html>
