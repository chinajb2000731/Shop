<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-labelauty.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
    <script src="js/jquery-labelauty.js" type="text/javascript"></script>
    <script type="text/javascript">
        function productsearch() {
            var keyword=$("#keyword").val();
            location.href="settings/product/productsearch.do?keyword="+keyword;

        }
    </script>
<title>添加店铺</title>
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
              <a href="settings/seller/selectsellershop.do?sid=${seller.sid}" class="green">店铺专区</a>
          </c:when>
          <c:otherwise>
              <span>欢迎:【${user.name}】</span>&nbsp&nbsp
              <a href="settings/product/selectusercenterorder.do?cid=${user.loginAct}&flag=0" class="green">用户中心</a>
          </c:otherwise>
          </c:choose>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp">首页</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">消息中心</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="user_order.jsp">我的购物车<b>(${totalcartnum})</b></a></li>
	  </ul>
	</div>
    </div>
  </div>
  <div id="header"  class="header page_style">
      <div class="logo"><a href="default.jsp"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
               <li class="current"><a href="settings/product/productlists.do?cid=1">产品</a></li>
               <!--  <li><a href="#">信息</a></li> -->
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="searchName" class="search_box" onkeydown="keyDownSearch()" type="text">
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
       <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${totalcartnum}</i></div>
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
             <li><a href="index.jsp">首页</a></li>
             <li><a href="settings/product/productlists.do?cid=1">商城</a></li>
             <li><a href="#">热销活动</a></li>
             <li><a href="#">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<!--添加店铺样式-->
<div class="Inside_pages clearfix">
<div class="left_style">
  <!--列表-->
  <div class="menu_style">
   <ul class="menu_list">
    <li class="on"><em></em><a href="seller_center.jsp">店铺专区</a></li>
   </ul>
  </div>
</div>
<!--右侧内容样式-->
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>添加店铺</div>
   <div class="content_style">
   <ul class="add_shops_style">

   <form action="settings/seller/sellershop.do?sid=${seller.sid}" method="post" id="shop" enctype="multipart/form-data">
    <li><label>店铺名称：</label>
        <div class="add_right_style">
        <input name="shopname" type="text"  class="text_name"/>
    </div>
    </li>
    <li><label>店铺地址：</label><div class="add_right_style">
    <p><input name="shopaddress" type="text"  class="text_name"/></p>
    <p class="map_Callout">
                    	<a id="check_agreement" href="#" class="check_agreement">加入半小时经济圈</a>
                    	<input id="autoLoginCheck" type="hidden">
                    	<a id="agreement_tips" class="auto_tips" style="">地图标注</a>
                        </p>
    </div></li>
    <li><label>店铺简介：</label><div class="add_right_style">
    <textarea name="shopdesc" cols="" rows="" class="textarea"></textarea>
    </div>
  </li>
  <div class="content_style">
      <ul class="add_shops_style">
      <li>
        <label>营业法人身份证号码：</label>
        <div class="add_right_style">
          <input name="selleridcard" type="text"  class="text_name"/>
        </div>
      </li>
     
      <li>
        <label>营业执照：</label>
      <input id="photoimg2" type="file" name="businessscope">
</li> 
<li>
        <label>营业法人身份证照片：</label> 
          <input id="photoimg1" type="file" name="idcardphoto">
          </a>   
   </li>
          <li>
              <label>店铺照片：</label>
              <input id="photoimg3" type="file" name="pimage">
              </a>
          </li>
      </ul>
    </div>
    </form>
       <a href="javascript:void(0)" class="Next_btn" onclick="document:shop.submit()">提交资料</a>
   <%-- <script type="text/javascript">
    window.onload = function(){ 
var fileUploader = document.getElementById('FileUploader'); 
var pathDisplayer = document.getElementById('PathDisplayer'); 
if(fileUploader.addEventListener){ 
fileUploader.addEventListener('change', fileUploaderChangeHandler, false); 
}else if(fileUploader.attachEvent){ 
fileUploader.attachEvent('onclick', fileUploaderClickHandler); 
}else{ 
fileUploader.onchange = fileUploaderChangeHandler; 
} 
function fileUploaderChangeHandler(){ 
pathDisplayer.value = fileUploader.value; 
} 
function fileUploaderClickHandler(){ 
setTimeout(function(){ 
fileUploaderChangeHandler(); 
}, 0); 
} 
} </script>--%>

   </ul>
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
</body>
</html>
