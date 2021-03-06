<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<title>店铺专区</title>
</head>

<body>
<head>
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection"><a href="./登录.html" class="green">请登录</a> <a href="./注册.html" class="green">免费注册</a></div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="default.jsp">首页</a></li>
	   <!-- <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="#">我的小充</a> </li> -->
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="./消息中心.html">消息中心</a></li>
       <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="./产品-产品列表.html">商品分类</a></li>
        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">我的购物车<b>(${totalcartnum})</b></a></li>
	  </ul>
	</div>
    </div>
  </div>
  <div id="header"  class="header page_style">
  <div class="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
                <li class="current"><a href="./产品-产品列表.html">产品</a></li>
                <!-- <li><a href="#">信息</a></li> -->
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="searchName" class="search_box" onkeydown="keyDownSearch()" type="text">
           <input name="" type="submit" value="搜 索"  class="Search_btn"/>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><a href="./用户中心-我的订单.html">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${totalcartnum}</i></div>
   <div class="dorpdown-layer">
    <div class="spacer"></div>
       <c:choose>
           <c:when test="${empty productcartList}">
               <div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>
           </c:when>
           <c:otherwise>
               <ul class="p_s_list">
                   <c:forEach items="${productcartList}" var="shopcar">
                       <li>
                           <div class="img"><img src="${pageContext.request.contextPath}/${shopcar.pimage}"></div>
                           <div class="content"><p class="name">产品名称</p><p>${shopcar.pname}X${shopcar.buynum}</p></div>
                           <div class="Operations">
                               <p class="Price">￥${shopcar.price*shopcar.buynum}</p>
                           </div>
                       </li>
                   </c:forEach>
               </ul>
               <div class="Shopping_style">
                   <div class="p-total">共<b>${totalcartnum}</b>件商品　共计<strong>￥${totalcartprice}</strong></div>
                   <a href="#" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
               </div>
           </c:otherwise>
       </c:choose>
   </div>
 </div>
</div>
<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
		  <li><a href="./index.html">首页</a></li>
			<!-- <li><a href="#">你身边的超市</a></li> -->
		<!-- 	<li><a href="#">预售专区</a><em class="hot_icon"></em></li> -->
		  <li><a href="./产品-产品列表.html">商城</a></li>
      <li><a href="./半小时圈主页.html">半小时生活圈</a></li>
	<!-- 		<li><a href="#">好评商户</a></li> -->
      <li><a href="#">限时折扣</a></li>
      <li><a href="#">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<!--店铺专区样式-->
<div class="Inside_pages clearfix">
<div class="left_style">
  <!--列表-->
  <div class="menu_styles">
   <ul class="menu_list">
    <li class="on"><em></em><a href="店铺专区.jsp">店铺专区</a></li>
    <li ><em></em><a href="商品专区.html">商品专区</a></li>
    <li><em></em><a href="订单专区.html">订单专区</a></li>
    <li><em></em><a href="发货管理.html">发货管理</a></li>
    <li><em></em><a href="收款账号.html">收款账户</a></li>
   <!--  <li><em></em><a href="我的报表.html">我的报表</a></li> -->
   </ul>
  </div>
</div>
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>店铺专区</div>
   <div class="content_style">
    <!--添加店铺-->
   <!-- <div class="add_shops">
     <h3>你好，目前你没有任何店铺！</h3>
     <a href="#">添加店铺</a>
    </div>-->
    <div class="Add_shop_style"><a href="./店铺专区（添加店铺）.html" id="newShop" onclick="addShop()" class="New_Shop_btn">新增店铺</a></div>
    <div class="shops_list">
     <ul class="list_style">
      <li class="img_link"><a href="#"><img src="images/shop_logo.jpg" /></a><span class="status">审核通过</span></li>
      <li class="shopscontent">
       <a href="#" class="title">江苏业祥科技股份有限公司</a>
       <p class="Introduction">南京业祥科技发展有限公司成立于2003年，位于南京市风景秀丽的科技创新型科技园区----中山科技园。是安全技术防范领域的专业企业，集安全防范系统的设计研发、生产、销售及售后服务为一体的高科技企业。</p>
       <p class="shops_operating"><a href="#" class="View_info">查看详情</a><a href="#" class="edit_shops">编辑店铺</a><a href="店铺公告.html" class="shops_Bulletin">店铺公告</a></p>
      </li>
     </ul>
      <ul class="list_style">
      <li class="img_link"><a href="#"><img src="images/shop_logo.jpg" /></a><span class="status">审核中</span></li>
      <li class="shopscontent">
       <a href="#" class="title">江苏业祥科技股份有限公司</a>
       <p class="Introduction">南京业祥科技发展有限公司成立于2003年，位于南京市风景秀丽的科技创新型科技园区----中山科技园。是安全技术防范领域的专业企业，集安全防范系统的设计研发、生产、销售及售后服务为一体的高科技企业。</p>
       <p class="shops_operating"><a href="#" class="View_info">查看详情</a></p>
      </li>
     </ul>
      <ul class="list_style">
      <li class="img_link"><a href="#"><img src="images/shop_logo.jpg" /></a><span class="status">审核失败</span></li>
      <li class="shopscontent">
       <a href="#" class="title">江苏业祥科技股份有限公司</a>
       <p class="Introduction">南京业祥科技发展有限公司成立于2003年，位于南京市风景秀丽的科技创新型科技园区----中山科技园。是安全技术防范领域的专业企业，集安全防范系统的设计研发、生产、销售及售后服务为一体的高科技企业。</p>
       <p class="shops_operating"><a href="#" class="View_info">查看详情</a><a href="#" class="delete_shops">删除店铺</a></p>
      </li>
     </ul>
    </div>
   </div>
</div>
</div>
<!--网站地图-->
<div class="fri-link-bg clearfix">
    <div class="fri-link">
        <div class="logo left margin-r20"><img src="images/fo-logo.jpg" width="152" height="81" /></div>
        <div class="left"><img src="images/qd.jpg" width="90"  height="90" />
            <p>扫描下载APP</p>
        </div>
       <div class="">
    <dl>
	 <dt>新手上路</dt>
	 <dd><a href="#">售后流程</a></dd>
     <dd><a href="#">购物流程</a></dd>
     <dd><a href="#">订购方式</a> </dd>
     <dd><a href="#">隐私声明 </a></dd>
     <dd><a href="#">推荐分享说明 </a></dd>
	</dl>
	<dl>
	 <dt>配送与支付</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
	<dl>
	 <dt>售后保障</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
	<dl>
	 <dt>支付方式</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>	
    <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
     <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
     <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>	   
   </div>
    </div>
</div>
<!--网站地图END-->
<!--网站页脚-->
<div class="copyright">
    <div class="copyright-bg">
        <div class="hotline">为生活充电在线 <span>招商热线：****-********</span> 客服热线：400-******</div>
        <div class="hotline co-ph">
            <p>版权所有Copyright ©***************</p>
            <p>*ICP备***************号 不良信息举报</p>
            <p>总机电话：****-*********/194/195/196 客服电话：4000****** 传 真：********
                
                E-mail:****@****.gov.cn</p>
        </div>
    </div>
</div>
</body>
</html>
