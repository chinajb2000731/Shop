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
<title>商品专区</title>
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
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="default.jsp">首页</a></li>
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
                <li><a href="javascript:void(0)">信息</a></li>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="keyword" class="search_box"  type="text">
           <input name="" type="button" value="搜 索"  class="Search_btn" onclick="productsearch()"/>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><a href="user_order.jsp">我的购物车</a>
       <i class="ci-right">&gt;</i>
       <i class="ci-count" id="shopping-amount">${totalcartnum}</i></div>
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
	<script>
        $("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});
    </script>
    </div>
</head>
<!--商品专区-->
<div class="Inside_pages clearfix">
<div class="left_style">
<!--列表-->
  <div class="menu_style">
   <ul class="menu_list">
    <li><em></em><a href="店铺专区.jsp">店铺专区</a></li>
    <li class="on"><em></em><a href="javascript:void(0)">商品专区</a></li>
    <li><em></em><a href="settings/seller/sellerorder.do?sid=${seller.sid}">订单专区</a></li>
    <li><em></em><a href="settings/seller/selectdeliveryaddress.do?sid=${seller.sid}">发货管理</a></li>
    <li><em></em><a href="javascript:void(0)">收款账户</a></li>
   </ul>
  </div>
</div>
<!--内容-->
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>商品专区</div>
   <div class="content_style">
    <div class="Products_area_style">
     <div class="Add_product_style"><a href="seller_onproduct.jsp" class="Add_btn">发布商品</a> <!-- <a href="#">公共商品库下载</a> --></div>

     <div class="Products_list_style">
      <table>
       <thead>
        <tr class="title">
         <td class="checkbox_style"><input name="" type="checkbox" value="" /></td>
         <td class="title_name">商品标题</td>
         <td class="inventory">商品库存</td>
         <td class="status">商品转态</td>
         <td class="operating">操作</td>
         </tr>
        </thead>
       <tbody>
       <c:forEach items="${checkproductBean.list}" var="pro">
           <tr>
               <td><input name="" type="checkbox" value="" /></td>
               <td><a href="#">${pro.pname}</a></td>
               <td>${pro.inventory}</td>
               <c:if test="${pro.check_flag=='0'}">
                   <td style="color: blue">待审核</td>
               </c:if>
               <c:if test="${pro.check_flag=='1'}">
                   <c:if test="${pro.sell_flag == '1'}">
                       <td style="color: green">审核通过(已上架)</td>
                   </c:if>
                   <c:if test="${pro.sell_flag == '0'}">
                       <td style="color: green">审核通过(未上架)</td>
                   </c:if>
               </c:if>
               <c:if test="${pro.check_flag=='2'}">
                   <td style="color: red">审核失败</td>
               </c:if>
               <td class="operating_btn relative">
                   <div class="inventory_style">
                       <form action="settings/seller/setproductinventory.do">
                       <input  name="inventory" type="text" value="${pro.inventory}" class="add_Number"/>
                       <input  name="currentPage" type="hidden" value="${checkproductBean.currentPage}"/>
                       <input  name="pid" type="hidden" value="${pro.pid}"/>
                           <input  name="sid" type="hidden" value="${seller.sid}"/>
                       <input   type="submit" value="确认" class="confirm_btn"/>
                       <a href="javascript:void(0)" class="cancel"><em class="cancel-icon"></em></a>
                       </form>
                   </div>
                   <a href="javascript:void(0)" class="pjgl_btn">评价管理</a>
                   <a href="javascript:void(0)" class="szkc_btn">设置库存</a>
                   <c:if test="${pro.check_flag=='0' or pro.check_flag=='2'}">
                       <a href="settings/seller/deletesellproduct.do?sid=${seller.sid}&pid=${pro.pid}&currentPage=${checkproductBean.currentPage}" class="sj_btn">删除</a>
                   </c:if>
                   <c:if test="${pro.check_flag=='1'and pro.sell_flag=='0'}">
                       <a href="settings/seller/onsellproduct.do?sid=${seller.sid}&pid=${pro.pid}&currentPage=${checkproductBean.currentPage}&sellflag=1" class="sj_btn">上架</a>
                   </c:if>
                   <c:if test="${pro.check_flag=='1'and pro.sell_flag=='1'}">
                       <a href="settings/seller/onsellproduct.do?sid=${seller.sid}&pid=${pro.pid}&currentPage=${checkproductBean.currentPage}&sellflag=0" class="sj_btn">下架</a>
                   </c:if>

               </td>
           </tr>
       </c:forEach>

       </tbody>
      </table>
      <div class="page_style">共${checkproductBean.totalPage}页 共${checkproductBean.totalcount}条，当前第${checkproductBean.currentPage}/${checkproductBean.totalPage}页
          <c:if test="${checkproductBean.currentPage==1}">
              <a href="javascript:void(0);">上一页</a>
          </c:if>
          <c:if test="${checkproductBean.currentPage!=1}">
              <a href="settings/seller/selectcheckproduct.do?sid=${seller.sid}&currentPage=${checkproductBean.currentPage-1}">上一页</a>
          </c:if>

          <c:if test="${checkproductBean.currentPage==checkproductBean.totalPage}">
              <a href="javascript:void(0);">下一页</a>
          </c:if>
          <c:if test="${checkproductBean.currentPage!=checkproductBean.totalPage}">
              <a href="settings/seller/selectcheckproduct.do?sid=${seller.sid}&currentPage=${checkproductBean.currentPage+1}">下一页</a>
          </c:if>
      </div>
     </div>
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