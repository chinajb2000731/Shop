<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="skins/all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
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
<script type="text/javascript">
$(document).ready(function () {
	
	$('#CheckedAll').on('ifChecked', function(event){
		$('input').iCheck('check');
	});
	$('#CheckedAll').on('ifUnchecked', function(event){
		$('input').iCheck('uncheck');
	});
   //全选
//   $("#CheckedAll").click(function () {
//	   if (this.checked) {                 //如果当前点击的多选框被选中
//		   $('ifChecked').attr("check", true);
//	   } else {
//		   $('ifUnchecked').attr("uncheck", false);
//	   }
//   });
//   $('input[type=checkbox][name=checkitems]').click(function () {
//	   var flag = true;
//	   $('input[type=checkbox][name=checkitems]').each(function () {
//		   if (!this.checked) {
//			   flag = false;
//		   }
//	   });
//
//	   if (flag) {
//		   $('#CheckedAll').attr('checked', true);
//	   } else {
//		   $('#CheckedAll').attr('checked', false);
//	   }
//   });
   //输出值
   $("#send").click(function () {
	      if($("input[type='checkbox'][name='checkitems']:checked").attr("checked")){
	   var str = "批量确认收货订单：\r\n";
	   $('input[type=checkbox][name=checkitems]:checked').each(function () {
		   str += $(this).val() + "\r\n";
	   })
	   alert(str);
		  }
		  else{
			   var str = "你未选中任何商品，请选择后在操作！"; 
			   alert(str);
       }
	   	    
   });
})
</script>
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
                <%--<li><a href="javascript:void(0)">信息</a></li>--%>
            </ul>
        </div>
        <div class="clear search_cur">
            <input name="searchName" id="keyword" class="search_box" onkeydown="keyDownSearch()" type="text">
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
         </c:choose>>
       <i class="ci-right"></i>
       <i class="ci-count" id="shopping-amount">${totalcartnum}</i>
   </div>
   <div class="dorpdown-layer">
    <div class="spacer">

    </div>
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
<div class="Inside_pages clearfix">
 <div class="left_style">
<!--列表-->
  <div class="menu_style">
   <ul class="menu_list">
    <li ><em></em><a href="seller_center.jsp">店铺专区</a></li>
    <li ><em></em><a href="settings/seller/selectcheckproduct.do?sid=${seller.sid}">商品专区</a></li>
    <li class="on"><em></em><a href="javascript:void(0)">订单专区</a></li>
    <li><em></em><a href="settings/seller/selectdeliveryaddress.do?sid=${seller.sid}">发货管理</a></li>
    <li><em></em><a href="收款账号.jsp">收款账户</a></li>
    <!-- li><em></em><a href="我的报表.html">我的报表</a></li> -->
   </ul>
  </div>
</div>
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>发布商品</div>
    <div class="content_style">
    <!--订单管理-->
     <div class="Order_form_style">
      <div class="Order_form_filter">
       <a href="settings/seller/selectsellorder.do?sid=${seller.sid}&orderflag=0" class="on">全部订单</a>
       <a href="settings/seller/selectsellorder.do?sid=${seller.sid}&orderflag=1" class="">代发货</a>
       <a href="settings/seller/selectsellorder.do?sid=${seller.sid}&orderflag=2" class="">待收货</a>
       <a href="#" class="">退货/退款</a>
       <a href="settings/seller/selectsellorder.do?sid=${seller.sid}&orderflag=4" class="">交易成功</a>
      </div>
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
         <tbody>
         <c:forEach items="${productcartList3}" var="shopcar" >
           <tr class="Order_info"><td colspan="7" class="Order_form_time"><input name="checkitems" type="checkbox" value="天然绿色多汁香甜无污染水蜜桃"  class=""/> 订单号:${shopcar.id} <em></em></td></tr>
           <tr class="Order_Details">
           <td colspan="3">
           <table class="Order_product_style">
                   <tbody>
                   <tr>
                       <td>
                           <div class="product_name clearfix">
                               <a href="#" class="product_img">
                                   <img src="${pageContext.request.contextPath}/${shopcar.pimage}" width="80px" height="80px">
                               </a>
                               <a href="#">${shopcar.pname}</a>
                               <c:if test="${shopcar.deposit==''}">
                                   <p class="specification" style="color: red;font-size: 15px">此商品无押金</p>
                               </c:if>
                               <c:if test="${shopcar.deposit!=''}">
                                   <c:if test="${shopcar.is_pay!='1'}">
                                       <p class="specification" style="color: red;font-size: 15px">押金:${shopcar.deposit*shopcar.buynum}元</p>
                                   </c:if>
                                   <c:if test="${shopcar.is_pay=='1'}">
                                       <p class="specification" style="color: red;font-size: 15px">已购买</p>
                                   </c:if>
                               </c:if>
                           </div>
                       </td>
                       <c:choose>
                           <c:when test="${shopcar.rent==''}">
                               <td>租:不支持</br>买:${shopcar.price}(元)</td>
                           </c:when>
                           <c:otherwise>
                               <td>租:${shopcar.rent}(元)</br>买:${shopcar.price}(元)</td>
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

               <c:if test="${shopcar.is_deliver=='0'and shopcar.is_rent=='1'}">
                   <td class="split_line"><p style="color:blue">买家已租用,等待发货</p></td>
               </c:if>
               <c:if test="${shopcar.is_deliver=='0'and shopcar.is_pay=='1'}">
                   <td class="split_line"><p style="color:blue">买家已购买,等待发货</p></td>
               </c:if>
               <c:if test="${shopcar.is_deliver=='1'and shopcar.is_get=='0'}">
                   <td class="split_line"><p style="color:red;">已发货，待收货</p></td>
               </c:if>
               <c:if test="${shopcar.is_deliver=='1' and shopcar.is_get=='1' and shopcar.is_rent=='1' and shopcar.is_eviction=='0'}">
                   <td class="split_line"><p style="color:green">买家已收货,租赁开始</p></td>
               </c:if>

               <c:if test="${shopcar.is_deliver=='1' and shopcar.is_get=='1' and shopcar.is_pay=='1'}">
                   <td class="split_line"><p style="color:green">买家已收货,交易完成</p></td>
               </c:if>

               <c:if test="${shopcar.is_deliver=='1' and shopcar.is_get=='1' and shopcar.is_rent=='1' and shopcar.is_eviction=='1' }">
                   <td class="split_line"><p style="color:orange">买家已发货,等待收货</p></td>
               </c:if>

               <c:if test="${shopcar.is_deliver=='1' and shopcar.is_get=='1' and shopcar.is_rent=='1' and shopcar.is_eviction=='2' }">
                   <td class="split_line"><p style="color:blueviolet">租赁交易完成</p></td>
               </c:if>
               <td class="operating">
                   <c:if test="${shopcar.is_deliver=='0'}">
                       <a href="#">查看订单</a>
                       <a href="#">联系管理员</a>
                       <a href="settings/seller/sellconfirmdeliver.do?id=${shopcar.id}&sid=${seller.sid}" class="Delivery_btn">确认发货</a>
                   </c:if>
                   <c:if test="${shopcar.is_deliver=='1'}">
                       <a href="#">查看订单</a>
                       <a href="#">联系管理员</a>
                       <a href="#">查看物流</a>
                   </c:if>
                   <c:if test="${shopcar.is_get=='1' and shopcar.is_deliver=='1' and shopcar.is_rent=='1' and shopcar.is_eviction!='2'}">
                       <a href="settings/seller/updateeviction.do?id=${shopcar.id}&sid=${seller.sid}" class="Delivery_btn">收到退租并退押金</a>
                   </c:if>
<%--
                   <a href="#">查看物流</a>

                   <a href="#">删除</a>--%>
               </td>
           </tr>
         </tbody>
               </c:forEach>
          </table>
    </div>
     </div>
     </form>
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

</body>
</html>
