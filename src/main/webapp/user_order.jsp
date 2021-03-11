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
<script src="layer/layer.js" type="text/javascript"></script>
<script src="js/iCheck.js" type="text/javascript"></script>
<script src="js/custom.js" type="text/javascript"></script>
    <script type="text/javascript">
        function productsearch() {
            var keyword=$("#keyword").val();
            location.href="settings/product/productsearch.do?keyword="+keyword;

        }
    </script>
<title>订单管理</title>
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
                  <a href="用户中心.jsp" class="green">用户中心</a>&nbsp&nbsp
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
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp">首页</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0)">消息中心</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0)">我的购物车<b>(${totalcartnum})</b></a></li>
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
                <li><a href="javascript:void(0)">信息</a></li>
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
       <a href="javascript:void(0)">我的购物车</a>
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

                   <a href="javascript:void(0)" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
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
			<li><a href="#">预租专区</a><em class="hot_icon"></em></li>
			<li><a href="settings/product/productlists.do?cid=1">商城</a></li>
            <li><a href="#">限时折扣</a></li>
			<li><a href="#">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<div class="user_style clearfix">
 <div class="user_center clearfix">
   <div class="left_style">
     <div class="menu_style">
     <div class="user_title"><a href="用户中心.jsp">用户中心</a></div>
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
            <li> <a href="user_order.jsp">我的订单</a></li>
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
        <li> <a href="#"> 我的评论</a></li>
      <!--   <li><a href="#"> 我的评论</a></li> -->
      </ul>
    </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_3"></em>账户管理</dt>
      <dd>
       <ul>
        <li><a href="用户中心-消费记录.html">消费记录</a></li>   
       <li><a href="#">跟踪包裹</a></li>
      </ul>
     </dd>
    </dl>
    </div>
      <script>jQuery(".sideMen").slide({titCell:"dt", targetCell:"dd",trigger:"click",defaultIndex:0,effect:"slideDown",delayTime:300,returnDefault:true});</script>
   </div>
 </div>
 <!--右侧样式-->
  <div class="right_style">
  <div class="title_style"><em></em>订单管理</div> 
   <div class="Order_form_style">
      <div class="Order_form_filter">
       <a href="settings/product/selectorder.do?cid=${user.loginAct}&flag=0&orderflag=0" class="on">全部订单(${ordercount})</a>
       <a href="settings/product/selectorder.do?cid=${user.loginAct}&flag=0&orderflag=1" class="">代付款</a>
       <%--<a href="javascript:void(0)" class="">代发货</a>--%>
       <a href="settings/product/selectorder.do?cid=${user.loginAct}&flag=0&orderflag=3" class="">待收货</a>
       <%--<a href="javascript:void(0)" class="">退货/退款</a>--%>
       <a href="settings/product/selectorder.do?cid=${user.loginAct}&flag=0&orderflag=5" class="">交易成功</a>
      <%-- <a href="#" class="">交易关闭（0）</a>--%>
      </div>
      <!-- <div class="Order_Operation"> -->
     <!-- <div class="left"> <label><input name="" type="checkbox" value=""  class="checkbox"/>全选</label> <input name="" type="submit" value="批量确认收货"  class="confirm_Order"/></div> -->
     <!-- <div class="right_search"><input name="" type="text"  class="add_Ordertext" placeholder="请输入产品标题或订单号进行搜索"/><input name="" type="submit" value="搜索订单"  class="search_order"/></div> -->
      <!-- </div> -->
      <div class="Order_form_list">
         <table>
         <thead>
          <tr><td class="list_name_title0">商品</td>
          <td class="list_name_title1">单价(元)</td>
          <td class="list_name_title2">数量</td>
          <td class="list_name_title4">购买价格(元)</td>
          <td class="list_name_title4">租赁价格(元)</td>
          <td class="list_name_title5">订单状态</td>
          <td class="list_name_title6">操作</td>
         </tr>
         </thead> 
            <c:forEach items="${productcartList2}" var="shopcar">
                <tbody>
                <tr class="Order_info">
                    <td colspan="7" class="Order_form_time"><input name="" type="checkbox" value=""  class="checkbox"/>下单时间：2015-12-3 | 订单号：445454654654654</td>
                </tr>
                <tr class="Order_Details" >
                    <td colspan="3">
                        <table class="Order_product_style">
                            <tbody><tr>
                                <td>
                                    <div class="product_name clearfix">
                                        <a href="#" class="product_img"><img src="${pageContext.request.contextPath}/${shopcar.pimage}" width="80px" height="80px"></a>
                                        <a href="#" class="p_name">${shopcar.pname}</a>
                                        <%--<p class="specification">礼盒装20个/盒</p>--%>
                                    </div>
                                </td>
                                <c:choose>
                                    <c:when test="${shopcar.rent==''}">
                                        <td>租:不支持</br>买:${shopcar.price}(元)</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>租:${shopcar.rent}</br>买:${shopcar.price}(元)</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${shopcar.buynum}</td>
                            </tr>
                            </tbody></table>
                    </td>
                    <td class="split_line">${shopcar.price*shopcar.buynum}</td>
                    <c:choose>
                        <c:when test="${shopcar.rent==''}">
                            <td class="split_line">不支持租赁</td>
                        </c:when>
                        <c:otherwise>
                            <td class="split_line">${shopcar.rent*shopcar.buynum}</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${shopcar.is_pay=='0' and shopcar.is_rent=='0'}">
                            <td class="split_line">等待付款</td>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${shopcar.is_get=='0'}">
                                    <td class="split_line"><p style="color:#F33">买家已付款</p></td>
                                </c:when>
                                <c:otherwise>
                                   <td class="split_line"><p style="color:#F33">已收货,交易成功</p></td>
                                </c:otherwise>
                            </c:choose>

                        </c:otherwise>
                    </c:choose>

                    <td class="operating">
                        <c:choose>
                            <c:when test="${shopcar.is_pay=='0' and shopcar.is_rent=='0'}">
                                <c:choose>
                                    <c:when test="${empty seller}">
                                        <a href="settings/product/productorder.do?loginAct=${user.loginAct}&pid=${shopcar.pid}&flag=0&pay=${shopcar.price*shopcar.buynum}">去购买付款</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="settings/product/productorder.do?loginAct=${seller.loginAct}&pid=${shopcar.pid}&flag=1&pay=${shopcar.price*shopcar.buynum}">去购买付款</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${shopcar.rent==''}">
                                <c:choose>
                                    <c:when test="${shopcar.is_pay=='0'}">

                                    </c:when>
                                    <c:otherwise>
                                        <a href="#">查看订单</a>
                                        <a href="#">在线客服</a>
                                       <%-- <a href="#">查看物流</a>--%>
                                    </c:otherwise>
                                </c:choose>

                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${shopcar.is_pay=='0' and shopcar.is_rent=='0' }">
                                        <c:choose>
                                            <c:when test="${empty seller}">
                                                <a href="settings/product/productorderent.do?loginAct=${user.loginAct}&pid=${shopcar.pid}&flag=0&pay=${shopcar.rent*shopcar.buynum}">去租赁付款</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="settings/product/productorderent.do?loginAct=${seller.loginAct}&pid=${shopcar.pid}&flag=1&pay=${shopcar.rent*shopcar.buynum}">去租赁付款</a>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:when>
                                    <c:otherwise>
                                        <a href="#">查看订单</a>
                                        <a href="#">在线客服</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${shopcar.is_get=='0' and (shopcar.is_pay=='1' or shopcar.is_rent=='1') }">
                                <a href="#">查看物流</a>
                            </c:when>
                        </c:choose>

                        <c:choose>
                            <c:when test="${shopcar.is_get=='1'}">
                               <c:choose>
                                   <c:when test="${shopcar.is_pay=='1'}">
                                       <a href="#">申请售后</a>
                                   </c:when>
                                   <c:otherwise>
                                       <a href="#">申请售后</a>
                                       <a href="#">退租</a>
                                   </c:otherwise>
                               </c:choose>
                            </c:when>

                        </c:choose>
                        <c:choose>
                            <c:when test="${(shopcar.is_pay=='0') and (shopcar.is_rent=='0')}">
                                <c:choose>
                                    <c:when test="${empty seller}">
                                        <a href="settings/product/deleteorder.do?id=${shopcar.id}&loginAct=${user.loginAct}&flag=0">删除</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="settings/product/deleteorder.do?id=${shopcar.id}&loginAct=${seller.loginAct}&flag=1">删除</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${shopcar.is_get=='0'}">
                                        <c:choose>
                                            <c:when test="${empty seller}">
                                                <a href="settings/product/productget.do?loginAct=${user.loginAct}&pid=${shopcar.pid}&flag=0" class="Delivery_btn">确认收货</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="settings/product/productget.do?loginAct=${seller.loginAct}&pid=${shopcar.pid}&flag=1" class="Delivery_btn">确认收货</a>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${empty seller}">
                                                <a href="settings/product/deleteorder.do?id=${shopcar.id}&loginAct=${user.loginAct}&flag=0">删除</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="settings/product/deleteorder.do?id=${shopcar.id}&loginAct=${seller.loginAct}&flag=1">删除</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>

                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
             <%--<tbody>
           <tr class="Order_info"><td colspan="7" class="Order_form_time"><input name="" type="checkbox" value=""  class="checkbox"/>下单时间：2015-12-3 | 订单号：445454654654654</td></tr>
           <tr class="Order_Details">
           <td colspan="3">
           <table class="Order_product_style">
           <tbody><tr>
           <td>
            <div class="product_name clearfix">
            <a href="#" class="product_img"><img src="Products/p_12.jpg" width="80px" height="80px"></a>
            <a href="3" class="p_name">天然绿色多汁香甜无污染水蜜桃</a>
            <p class="specification">礼盒装20个/盒</p>
            </div>
            </td>
            <td>5</td>
           <td>2</td>
            </tr>
            </tbody></table>
           </td>   
           <td class="split_line">100</td>
           <td class="split_line">100</td>
           <td class="split_line">等待买家付款</td>
           <td class="operating">
                <a href="#">去购买付款</a>
                <a href="#">去租赁付款</a>
               <!--   <a href="#">查看物流</a>
                  <a href="#">取消订单</a> -->
             <a href="#">删除</a>
           </td>
           </tr>
           </tbody>--%>
         </table>
    </div>
     </div>
   </div>
   <script>
            $(document).ready(function(){
              $('.Order_form_style input').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
              });
            });
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
     <dl>
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
