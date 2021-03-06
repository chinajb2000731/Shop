
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">--%>
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
	<script type="text/javascript">
		function productsearch() {
		    var keyword=$("#keyword").val();
		    location.href="settings/product/productsearch.do?keyword="+keyword;

        }
	</script>
<title>网站首页</title>
</head>
<body>
<head>
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection">
		  <c:choose>
			  <c:when test="${empty user and empty seller}">
				  <a href="登录.jsp" class="green">请登录</a>
				  <a href="注册.jsp" class="green">免费注册</a>
			  </c:when>
			  <c:when test="${empty user and !empty seller}">
				  <span>欢迎:【${seller.name}】</span>&nbsp&nbsp
				  <a href="settings/product/selectusercenterorder.do?cid=${seller.loginAct}&flag=1" class="green" >用户中心</a>&nbsp&nbsp
				  <a href="settings/seller/selectsellershop.do?sid=${seller.sid}" class="green">店铺专区</a> &nbsp&nbsp
				  <a href="settings/user/logout.do">退出</a>
			  </c:when>
			  <c:otherwise>
				  <span>欢迎:【${user.name}】</span>&nbsp&nbsp
				  <a href="settings/product/selectusercenterorder.do?cid=${user.loginAct}&flag=0" class="green">用户中心</a>&nbsp&nbsp
				  <a href="settings/user/logout.do">退出</a>
			  </c:otherwise>
		  </c:choose>
	  </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
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
  <div id="header"  class="header page_style">
  <div class="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
                <li class="current"><a href="settings/product/productlists.do?cid=1">产品</a></li>
                <%--<li><a href="javascript:void(0)">信息</a></li>--%>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="keyword" class="search_box" type="text">
           <input name="" type="button" value="搜 索"  class="Search_btn" onclick="productsearch()"/>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart">
	   <c:choose>
		   <c:when test="${empty seller and empty user}">
			   <a href="登录.jsp">我的购物车</a>
		   </c:when>

		   <c:otherwise>
			   <a href="user_order.jsp">我的购物车</a>
		   </c:otherwise>
	   </c:choose>

	   <i class="ci-right">&gt;</i>
	   <i class="ci-count" id="shopping-amount">${totalcartnum}</i>
   </div>
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
						   <c:choose>
							   <c:when test="${shopcar.rent==''}">
								   <p class="Price">（此商品不支持租用） 购买价格：￥${shopcar.price*shopcar.buynum}</p>
							   </c:when>
							   <c:otherwise>
								   <p class="Price">租用价格：￥${shopcar.rent*shopcar.buynum}   购买价格：￥${shopcar.price*shopcar.buynum}</p>
							   </c:otherwise>
						   </c:choose>

					   </div>
				   </li>
			   </c:forEach>
		   </ul>
		   <div class="Shopping_style">
			   <c:choose>
				   <c:when test="${totalrentprice==0}">
					   <div class="p-total">共<b>${totalcartnum}</b>件商品　共计购买<strong>￥${totalcartprice} </strong></div>
				   </c:when>
				   <c:otherwise>
					   <div class="p-total">共<b>${totalcartnum}</b>件商品　共计购买<strong>￥${totalcartprice} </strong></div>
					   <div class="p-total">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  共计租用<strong>￥${totalrentprice} </strong></div>
				   </c:otherwise>
			   </c:choose>

			   <a href="user_order.jsp" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
		   </div>
	   </c:otherwise>
   </c:choose>


   </div>
 </div>
</div>
<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
			<li><a href="javascript:void(0)">首页</a></li>
            <li class="hour"><a href="半小时圈主页.jsp">半小时生活圈</a></li>
			 <li><a href="settings/product/productlists.do?cid=1">商城</a></li>
			<%--<li><a href="javascript:void(0)">预售专区</a><em class="hot_icon"></em></li>--%>
			<li><a href="javascript:void(0)">热销活动</a></li>
			<li><a href="javascript:void(0)">联系我们</a></li>
		 </ul>			 
		</div>
	<script>
        $("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});
	</script>
    </div>
</head>
<!--广告幻灯片样式-->
   	<div id="slideBox" class="slideBox">
			<div class="hd">
				<ul class="smallUl"></ul>
			</div>
			<div class="bd">
				<ul>
					<li><a href="javascript:void(0);"><div style="background:url(AD/ad-1.jpg) no-repeat; background-position:center; width:100%; height:450px;"></div></a></li>
					<li><a href="javascript:void(0);" ><div style="background:url(AD/ad-2.jpg) no-repeat; background-position:center ; width:100%; height:450px;"></div></a></li>
					<li><a href="javascript:void(0);" ><div style="background:url(AD/ad-7.jpg) no-repeat rgb(226, 155, 197); background-position:center; width:100%; height:475px;"></div></a></li>
                  <%--  <li><a href="#" target="_blank"><div style="background:url(AD/ad-2.jpg) no-repeat #f7ddea; background-position:center; width:100%; height:450px;"></div></a></li>
                    <li><a href="#" target="_blank"><div style="background:url(AD/ad-1.jpg) no-repeat  #F60; background-position:center; width:100%; height:450px;"></div></a></li>--%>
				</ul>
			</div>
			<!-- 下面是前/后按钮-->
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>

		</div>
		<script type="text/javascript">
		jQuery(".slideBox").slide({titCell:".hd ul",mainCell:".bd ul",autoPlay:true,autoPage:true});
		</script>
 </div>

<!--内容样式-->
<div id="mian">
 <div class="clearfix marginbottom">
 <!--产品分类样式-->
  <div class="Menu_style" id="allSortOuterbox">
   <div class="title_name"><em></em>所有商品分类</div>
   <div class="content hd_allsort_out_box_new">
    <ul class="Menu_list">
		<c:forEach items="${categoryList}" var="category">
			<li class="name">
				<div class="Menu_name"><a href="settings/product/productlists.do?cid=${category.cid}" >${category.cname}</a><span>&lt;</span></div>
				<%--<div class="link_name">
					<p>
						<a href="#">茅台</a> |
						<a href="#">五粮液</a> |
						<a href="#">郎酒</a> |
						<a href="#">剑南春</a>
						<a href="#">茅台</a> |
						<a href="#">五粮液</a> |
						<a href="#">郎酒</a> |
						<a href="#">剑南春</a>
					</p>
				</div>--%>
				<%--<div class="menv_Detail">
					<div class="cat_pannel clearfix">
						<div class="hd_sort_list">
							<dl class="clearfix" data-tpc="1">
								<dt><a href="#">面膜<i>></i></a></dt>
								<dd><a href="#">撕拉面膜</a><a href="#">面膜贴</a><a href="#">免洗面膜</a><a href="#">水洗面膜</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="2">
								<dt><a href="#">洁面<i>></i></a></dt>
								<dd><a href="#">洁面摩丝</a><a href="#">洁面乳 </a><a href="#">洁面啫哩/胶</a><a href="#">面部去角质/磨砂</a><a href="#">洁面膏/霜</a><a href="#">洁肤皂</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="3">
								<dt><a href="#">化妆水<i>></i></a></dt>
								<dd><a href="#"> 喷雾</a><a href="#"> 精华水</a><a href="#"> 柔肤水</a><a href="#">爽肤水</a><a href="#">收敛水/紧肤水</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="4">
								<dt><a href="#">眼部护理<i>></i></a></dt>
								<dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="4">
								<dt><a href="#">眼部护理<i>></i></a></dt>
								<dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="4">
								<dt><a href="#">防晒<i>></i></a></dt>
								<dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a></dd>
							</dl>
							<dl class="clearfix" data-tpc="4">
								<dt><a href="#">唇部护理<i>></i></a></dt>
								<dd><a href="#"> 眼膜</a><a href="#"> 眼部凝胶</a><a href="#">眼部精华</a><a href="#">眼霜</a></dd>
							</dl> <dl class="clearfix" data-tpc="4">
							<dt><a href="#">乳液/面霜<i>></i></a></dt>
							<dd><a href="#"> 乳液</a><a href="#"> 面霜</a><a href="#">按摩霜</a><a href="#">面部啫喱</a><a href="#">凝露/凝胶</a></dd>
						</dl>
						</div><div class="Brands">
					</div>
					</div>--%>
					<!--品牌-->
			<%--	</div>--%>
			</li>
		</c:forEach>
    </ul>
   </div>
  </div>
  <script>
	  $("#allSortOuterbox").slide({ titCell:".Menu_list li",mainCell:".menv_Detail",	});

  </script>
  <!--产品栏切换-->
  <div class="product_list left">
  		<div class="slideGroup">
			<div class="parHd">
				<ul><li>免押金</li><li>先租后买</li><li>一台起租</li><li>产品精选</li><li>上门服务</li></ul>
			</div>
			<div class="parBd">
					<div class="slideBoxs">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>


							<c:forEach items="${newProductList}" var="newpro">
								<li>
									<div class="pic"><a href="settings/product/productinfo.do?pid=${newpro.pid}" ><img src="${pageContext.request.contextPath}/${newpro.pimage}"/></a></div>
									<div class="title">
										<a href="settings/product/productinfo.do?pid=${newpro.pid}" class="name">${newpro.pname}</a>
										<h3><b>租用￥</b>${newpro.rent}</h3>
									</div>
								</li>
							</c:forEach>
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->

					<div class="slideBoxs">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>
							<c:forEach items="${saleProductList}" var="salepro">
								<li>
									<div class="pic"><a href="settings/product/productinfo.do?pid=${salepro.pid}" ><img src="${pageContext.request.contextPath}/${salepro.pimage}" /></a></div>
									<div class="title">
										<a href="settings/product/productinfo.do?pid=${salepro.pid}"  class="name">${salepro.pname}</a>
										<h3><b>租用￥</b>${salepro.rent}</h3>
									</div>
								</li>
							</c:forEach>
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->

					<div class="slideBoxs">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>
							<c:forEach items="${grouProductList}" var="groupro">
								<li>
									<div class="pic"><a href="settings/product/productinfo.do?pid=${groupro.pid}" ><img src="${pageContext.request.contextPath}/${groupro.pimage}" /></a></div>
									<div class="title">
										<a href="settings/product/productinfo.do?pid=${groupro.pid}"  class="name">${groupro.pname}</a>
										<h3><b>租用￥</b>${groupro.rent}</h3>
									</div>
								</li>
							</c:forEach>
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->
                    	<div class="slideBoxs">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>
							<c:forEach items="${essenceroductList}" var="essencepro">
								<li>
									<div class="pic"><a href="settings/product/productinfo.do?pid=${essencepro.pid}"><img src="${pageContext.request.contextPath}/${essencepro.pimage}" /></a></div>
									<div class="title">
										<a href="settings/product/productinfo.do?pid=${essencepro.pid}" class="name">${essencepro.pname}</a>
										<h3><b>租用￥</b>${essencepro.rent}</h3>
									</div>
								</li>
							</c:forEach>
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->
                    	<div class="slideBoxs">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>
							<c:forEach items="${fastProductList}" var="fastpro">
								<li>
									<div class="pic"><a href="settings/product/productinfo.do?pid=${fastpro.pid}" ><img src="${pageContext.request.contextPath}/${fastpro.pimage}" /></a></div>
									<div class="title">
										<a href="settings/product/productinfo.do?pid=${fastpro.pid}"  class="name">${fastpro.pname}</a>
										<h3><b>租用￥</b>${fastpro.rent}</h3>
									</div>
								</li>
							</c:forEach>

						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->

			</div><!-- parBd End -->
		</div>
        <script type="text/javascript">
			/* 内层图片无缝滚动 */
			jQuery(".slideGroup .slideBoxs").slide({ mainCell:"ul",vis:4,prevCell:".sPrev",nextCell:".sNext",effect:"leftMarquee",interTime:50,autoPlay:true,trigger:"click"});
			/* 外层tab切换 */
			jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"});
		</script>
        <!--广告样式-->
        <div class="Ads_style">
			<a href="settings/product/productinfo.do?pid=2161b21f-411a-43e1-9f2f-3f7d2cb1aaf9"><img src="products/33.png"  width="318"/></a>
			<a href="settings/product/productinfo.do?pid=515985f3-28c6-4460-844b-3ebecf17c2ee"><img src="products/34.jpg" width="318"/></a>
			<a href="settings/product/productinfo.do?pid=57bd3f64-2705-4a89-b5c7-9e323cee4d8f"><img src="products/35.jpg" width="318"/></a>
		</div>
  </div>
 </div>
 <!--板块栏目样式-->
 <div class="clearfix Plate_style">
  <div class="Plate_column Plate_column_left">
    <div class="Plate_name">
    <h2>产品名称</h2>
    <div class="Sort_link">
		<c:forEach items="${categoryList}" var="category">
			<a href="settings/product/productlists.do?cid=${category.cid}" class="name">${category.cname}</a>
		</c:forEach>
	</div>
    <a href="javascript:void(0)" class="Plate_link"> <img src="images/bk_img_14.png" /></a>
   
    </div>
    <div class="Plate_product">
    <ul id="lists1">
     <li class="product_display">
     <a href="settings/product/productinfo.do?pid=6472522e-8ea6-4803-84df-ee5ea41be339" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=6472522e-8ea6-4803-84df-ee5ea41be339" class="img_link"><img src="products/u=3895995738,3266159354&fm=11&gp=0.jpg"  width="140" height="140"/></a>
     <a href="#" class="name">台式电脑</a>
     <h3><b>租用￥:</b>125</h3>
    <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=6e0c3fd8-87d1-46ff-8aad-c42f885c0797" class="img_link"><img src="products/27.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=6e0c3fd8-87d1-46ff-8aad-c42f885c0797" class="name">心电仪</a>
     <h3><b>租用￥:</b>6000</h3>
      <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=f0aace74-0545-4aed-8893-893eb42b7eba" class="img_link"><img src="products/26.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=f0aace74-0545-4aed-8893-893eb42b7eba" class="name">超声诊断设备</a>
     <h3><b>租用￥:</b>3000</h3>
       <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=8a297d14-63ac-4aac-b979-1966f160df06" class="img_link"><img src="products/25.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=8a297d14-63ac-4aac-b979-1966f160df06" class="name">心电测试仪</a>
     <h3><b>租用￥:</b>1500</h3>
     <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
    </ul>
    </div>
  </div>
  <!--板块名称-->
    <div class="Plate_column Plate_column_right">
    <div class="Plate_name">
    <h2>产品名称</h2>
    <div class="Sort_link">
		<c:forEach items="${categoryList}" var="category">
			<a href="settings/product/productlists.do?cid=${category.cid}" class="name">${category.cname}</a>
		</c:forEach>
	</div>
    <a href="javascript:void(0)" class="Plate_link"> <img src="images/bk_img_19.png" /></a>
   
    </div>
    <div class="Plate_product">
    <ul id="lists2">
     <li class="product_display">
     <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=9177d0cc-ade5-4296-8adc-3c33718c9ec1" class="img_link"><img src="products/17.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=9177d0cc-ade5-4296-8adc-3c33718c9ec1" class="name">中学英语教材配套影碟</a>
     <h3><b>租用￥:</b>12</h3>
    <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=d77bf95b-6817-400d-a2fb-7c45f27298e9" class="img_link"><img src="products/16.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=d77bf95b-6817-400d-a2fb-7c45f27298e9" class="name">英语教程</a>
     <h3><b>租用￥:</b>10</h3>
      <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=95fc661e-01a0-4249-ac19-2ee1c897c364" class="img_link"><img src="products/15.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=95fc661e-01a0-4249-ac19-2ee1c897c364" class="name">建设工程管</a>
     <h3><b>租用￥:</b>25</h3>
       <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
     <li class="product_display">
      <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=bf70d5cd-a007-4963-a5a0-ba27be87bad6" class="img_link"><img src="products/19.jpg"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=bf70d5cd-a007-4963-a5a0-ba27be87bad6" class="name">婴语密码</a>
     <h3><b>租用￥:</b>10</h3>
     <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
    </ul>
    </div>
  </div>
   <div class="Plate_column Plate_column_left">
    <div class="Plate_name">
    <h2>产品名称</h2>
    <div class="Sort_link">
		<c:forEach items="${categoryList}" var="category">
			<a href="settings/product/productlists.do?cid=${category.cid}" class="name">${category.cname}</a>
		</c:forEach>
	</div>
    <a href="javascript:void(0)" class="Plate_link"> <img src="images/bk_img_22.png" /></a>
   
    </div>
    <div class="Plate_product">
    <ul id="lists3">
		<c:forEach items="${newProductList}" var="newpro">
     <li class="product_display">
     <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=${newpro.pid}" class="img_link"><img src="${pageContext.request.contextPath}/${newpro.pimage}"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=${newpro.pid}" class="name">${newpro.pname}</a>
     <h3><b>租用￥:</b>${newpro.rent}</h3>
    <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
		</c:forEach>
    </ul>
    </div>
  </div>
  <!--板块名称-->
    <div class="Plate_column Plate_column_right">
    <div class="Plate_name">
    <h2>产品名称</h2>
    <div class="Sort_link">
		<c:forEach items="${categoryList}" var="category">
			<a href="settings/product/productlists.do?cid=${category.cid}" class="name">${category.cname}</a>
		</c:forEach>
	</div>
    <a href="javascript:void(0)" class="Plate_link"> <img src="images/bk_img_14.png" /></a>
   
    </div>
    <div class="Plate_product">
    <ul id="list">
		<c:forEach items="${saleProductList}" var="salepro">
     <li class="product_display">
     <a href="" class="Collect"><em></em>收藏</a>
     <a href="settings/product/productinfo.do?pid=${salepro.pid}" class="img_link"><img src="${pageContext.request.contextPath}/${salepro.pimage}"  width="140" height="140"/></a>
     <a href="settings/product/productinfo.do?pid=${salepro.pid}" class="name">${salepro.pname}</a>
     <h3><b>租用￥:</b>${salepro.rent}</h3>
    <div class="Detailed">
	   <div class="content">
		  <p class="center"><a href="#" class="Buy_btn">立即购买</a></p>
		  </div>
	   </div>
     </li>
		</c:forEach>
    </ul>
    </div>
  </div>
 </div>
 <!--友情链接-->
 <%--<div class="link_style clearfix">
 <div class="title"></div>
 <div class="link_name">
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
  <a href="#"><img src="products/logo/34.jpg"  width="100"/></a>
 </div>
 </div>
</div>--%>
<!--网站地图-->
<div class="fri-link-bg clearfix">
    <div class="fri-link">
        <div class="logo left margin-r20"></div>
        <div class="left">

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
<%--<div class="copyright">
    <div class="copyright-bg">
        <div class="hotline">为生活充电在线 <span>招商热线：****-********</span> 客服热线：400-******</div>
        <div class="hotline co-ph">
            <p>版权所有Copyright ©***************</p>
            <p>*ICP备***************号 不良信息举报</p>
            <p>总机电话：****-*********/194/195/196 客服电话：4000****** 传 真：********
                
                E-mail:****@****.gov.cn</p>
        </div>
    </div>
</div>--%>
 <!--右侧菜单栏购物车样式-->
<div class="fixedBox">
  <ul class="fixedBoxList">
      <li class="fixeBoxLi user"><a href="#"> <span class="fixeBoxSpan"></span> <strong>消息中心</strong></a> </li>
    <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs1">
		<p class="good_cart">${totalcartnum}</p>
		<a href="user_order.jsp"><span class="fixeBoxSpan"></span></a> <strong>购物车</strong>
			<%--<div class="cartBox">
       		<div class="bjfff"></div>
				&lt;%&ndash;
				<div class="message">购物车内暂无商品，赶紧选购吧</div>&ndash;%&gt;
			</div>--%>
	</li>
    <li class="fixeBoxLi Service "> <span class="fixeBoxSpan"></span> <strong>客服</strong>
      <div class="ServiceBox">
        <div class="bjfffs"></div>
        <dl onclick="javascript:;">
		    <dt><img src="images/Service1.png"></dt>
		       <dd><strong>QQ客服1</strong>
		          <p class="p1">9:00-22:00</p>
		           <p class="p2"><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a></p>
		          </dd>
		        </dl>
				<dl onclick="javascript:;">
		          <dt><img src="images/Service1.png"></dt>
		          <dd> <strong>QQ客服1</strong>
		            <p class="p1">9:00-22:00</p>
		            <p class="p2"><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=123456&amp;site=DGG三端同步&amp;menu=yes">点击交谈</a></p>
		          </dd>
		        </dl>
	          </div>
     </li>
	 <li class="fixeBoxLi code cart_bd " style="display:block;" id="cartboxs">
			<span class="fixeBoxSpan"></span> <strong>微信</strong>
			<div class="cartBox">
       		<div class="bjfff"></div>
			<div class="QR_code">
			 <p><img src="images/erweim.jpg" width="180px" height="180px" /></p>
			 <p>微信扫一扫，关注我们</p>
			</div>		
			</div>
			</li>

    <li class="fixeBoxLi Home"> <a href="WEB-INF"> <span class="fixeBoxSpan"></span> <strong>收藏夹</strong> </a> </li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>

</body>
</html>
