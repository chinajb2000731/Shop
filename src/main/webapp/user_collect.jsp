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
<link href="css/user_style.css" rel="stylesheet" type="text/css" />
<link href="skins/all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/iCheck.js" type="text/javascript"></script>
<script src="js/custom.js" type="text/javascript"></script>
<title>会员中心-我的收藏</title>
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
                  <a href="用户中心.jsp" class="green" >用户中心</a>&nbsp&nbsp
                  <a href="店铺专区.jsp" class="green">店铺专区</a>
              </c:when>
              <c:otherwise>
                  <span>欢迎:【${user.name}】</span>&nbsp&nbsp
                  <a href="用户中心.jsp" class="green">用户中心</a>
              </c:otherwise>
          </c:choose>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp)">首页</a></li>
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">消息中心</a></li>
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">我的购物车<b>(${totalcartnum})</b></a></li>
	  </ul>
	</div>
    </div>
  </div>
  <div id="header"  class="header page_style">
  <div class="logo"><a href="index.html"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
                <li class="current"><a href="product_lists.jsp">产品</a></li>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="searchName" class="search_box" onkeydown="keyDownSearch()" type="text">
           <input name="" type="submit" value="搜 索"  class="Search_btn"/>
        </div>
         <div class="clear hotword">热门搜索词：汽车&nbsp;&nbsp;&nbsp;电脑&nbsp;&nbsp;&nbsp;手机&nbsp;&nbsp;&nbsp;平板&nbsp;&nbsp;&nbsp;玩具</div>
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
			<li><a href="index.jsp">首页</a></li>
			<li><a href="settings/product/productlists.do?cid=1">商城</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="#">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<!--用户中心收藏样式-->
<div class="user_style clearfix">
 <div class="user_center clearfix">
     <div class="left_style">
     <div class="menu_style">
     <div class="user_title">用户中心</div>
     <div class="user_Head">
     <div class="user_portrait">

         <c:choose>
             <c:when test="${empty seller}">
                 <img src="${pageContext.request.contextPath}/${user.headportrait}" width="200px" height="200px">
             </c:when>
             <c:otherwise>
                 <img src="${pageContext.request.contextPath}/${seller.headportrait}" width="200px" height="200px">
             </c:otherwise>
         </c:choose>

      <div class="background_img"></div>
      </div>
      <div class="user_name">

          <c:choose>
              <c:when test="${empty seller}">
                  <p><span class="name">${user.name}</span><a href="#">[修改密码]</a></p>
              </c:when>
              <c:otherwise>
                  <p><span class="name">${seller.name}</span><a href="#">[修改密码]</a></p>
              </c:otherwise>
          </c:choose>
       <p>访问时间：2016-1-21 10:23</p>

       </div>           
     </div>
     <div class="sideMen">
     <!--菜单列表图层-->
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_1"></em>订单管理</dt>
      <dd>
        <ul>
          <li> <a href="用户中心-我的订单.html">我的订单</a></li>
          <li> <a href="useraddress.jsp">收货地址</a></li>
          <li> <a href="#">缺货登记</a></li>
        </ul>
      </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_2"></em>用户管理</dt>
        <dd>
      <ul>
        <li> <a href="userinformation.jsp"> 用户信息</a></li>
        <li> <a href="user_collect.jsp"> 我的收藏</a></li>
        <li><a href="#"> 我的评论</a></li>
      </ul>
    </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_3"></em>账户管理</dt>
      <dd>
       <ul>
        <li><a href="用户中心-消费记录.html">消费记录</a></li>   
      </ul>
     </dd>
    </dl>
    
    </div>
      <script>jQuery(".sideMen").slide({titCell:"dt", targetCell:"dd",trigger:"click",defaultIndex:0,effect:"slideDown",delayTime:300,returnDefault:true});</script>
   </div>
 </div>
 <!--收藏样式-->
  <div class="right_style">
  <div class="title_style"><em></em>我的收藏</div> 
  <div class="Favorites_slideTxtBox">
     <div class="hd"><ul><li>收藏的商品</li><li>收藏的店铺</li></ul></div>
     <div class="bd">
        <ul class="commodity_list clearfix">
         <div class="Number_Favorites">共收藏：${pageBean.totalcount}条</div>
         <div class="clearfix">
             <c:forEach items="${pageBean.list}" var="pro">
                 <li class="collect_p">
                     <c:choose>
                         <c:when test="${empty seller}">
                             <a href="settings/product/deletecollect.do?pid=${pro.pid}&loginAct=${user.loginAct}&flag=0&currentPage=${pageBean.currentPage}"> <em class="iconfont  delete"></em></a>
                         </c:when>
                         <c:otherwise>
                             <a href="settings/product/deletecollect.do?pid=${pro.pid}&loginAct=${seller.loginAct}&flag=1&currentPage=${pageBean.currentPage}"> <em class="iconfont  delete"></em></a>
                         </c:otherwise>
                     </c:choose>
                     <a href="#" class="buy_btn">立即购买</a>
                     <div class="collect_info">
                         <div class="img_link"> <a href="#" class="center "><img src="${pageContext.request.contextPath}/${pro.pimage}"></a></div>
                         <dl class="xinxi">
                             <dt><a href="#" class="name">${pro.pname}</a></dt>
                             <dd><span class="Price"><b>￥</b>${pro.price}</span><span class="collect_Amount"><i class="iconfont icon-shoucang"></i>345</span></dd>
                         </dl>
                     </div>
                 </li>
             </c:forEach>

       </div>
       <div class="Paging">
    <div class="Pagination">
        <c:if test="${pageBean.currentPage==1}">
            <a href="javascript:void(0);" class="pn-prev disabled">&lt;上一页</a>
        </c:if>
        <c:if test="${pageBean.currentPage!=1}">
            <c:choose>
                <c:when test="${empty seller}">
                    <a href="settings/product/showcollect.do?loginAct=${user.loginAct}&flag=0&currentPage=${pageBean.currentPage-1}" class="pn-prev disabled">&lt;上一页</a>
                </c:when>
                <c:otherwise>
                    <a href="settings/product/showcollect.do?loginAct=${seller.loginAct}&flag=1&currentPage=${pageBean.currentPage-1}" class="pn-prev disabled">&lt;上一页</a>
                </c:otherwise>
            </c:choose>
        </c:if>
     <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
         <c:if test="${page==pageBean.currentPage}">
             <a href="javascript:void(0);" class="on">${page}</a>
         </c:if>
         <c:if test="${page!=pageBean.currentPage}">
             <c:choose>
                 <c:when test="${empty seller}">
                     <a href="settings/product/showcollect.do?loginAct=${user.loginAct}&flag=0&currentPage=${page}">${page}</a>
                 </c:when>
                 <c:otherwise>
                     <a href="settings/product/showcollect.do?loginAct=${seller.loginAct}&flag=1&currentPage=${page}">${page}</a>
                 </c:otherwise>
             </c:choose>

         </c:if>

     </c:forEach>
        <c:if test="${pageBean.currentPage==pageBean.totalPage}">
            <a href="javascript:void(0);">下一页&gt;</a>
        </c:if>
        <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
            <c:choose>
                <c:when test="${empty seller}">
                    <a href="settings/product/showcollect.do?loginAct=${user.loginAct}&flag=0&currentPage=${pageBean.currentPage+1}">下一页&gt;</a>
                </c:when>
                <c:otherwise>
                    <a href="settings/product/showcollect.do?loginAct=${seller.loginAct}&flag=1&currentPage=${pageBean.currentPage+1}">下一页&gt;</a>
                </c:otherwise>
            </c:choose>

        </c:if>

   <%-- <a href="#">首页</a>


	 <a href="#">2</a>
	 <a href="#">3</a>
	 <a href="#">4</a>
	 <a href="#">下一页&gt;</a>
	 <a href="#">尾页</a>	--%>
     </div>
    </div>
        </ul>
        <ul class="Shops_list">
        <div class="Number_Favorites">共收藏：23家店铺</div>
        <li class="">
          <div class="shop_logo">
          
          </div>
          <div class="shop_content">
          
          </div>
        </li>
        </ul>
     </div>
   </div>
   <script>jQuery(".Favorites_slideTxtBox").slide({trigger:"click"});
 </script>
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
