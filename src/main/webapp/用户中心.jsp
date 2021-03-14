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
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="layer/layer.js" type="text/javascript"></script>
<title>用户中心</title>
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
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="user_order.jsp">我的购物车<b>(${totalcartnum})</b></a></li>
      </ul>
	</div>
    </div>
  </div>
  <div id="header"  class="header top_header_style">
  <div class="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
                <li class="current"><a href="settings/product/productlists.do?cid=1">产品</a></li>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="keyword" class="search_box" type="text">
            <input name="" type="button" value="搜 索"  class="Search_btn" onclick="productsearch()"/>
        </div>
        <div class="clear hotword">热门搜索词：汽车&nbsp;&nbsp;&nbsp;电脑&nbsp;&nbsp;&nbsp;手机&nbsp;&nbsp;&nbsp;平板&nbsp;&nbsp;&nbsp;玩具</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><a href="user_order.jsp">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${totalcartnum}</i></div>
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
                   <<c:choose>
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
      <li><a href="javascript:void(0)">半小时生活圈</a></li>
			<li><a href="javascript:void(0)">限时折扣</a></li>
      <li><a href="javascript:void(0)">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<!--用户中心样式-->
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
            <c:choose>
                <c:when test="${empty seller}">
                    <a href="settings/product/selectorder.do?cid=${user.loginAct}&flag=0&orderflag=0" class="on">全部订单(${ordercount})</a>
                </c:when>
                <c:otherwise>
                    <a href="settings/product/selectorder.do?cid=${seller.loginAct}&flag=1&orderflag=0" class="on">全部订单(${ordercount})</a>
                </c:otherwise>
            </c:choose>
            <li> <a href="useraddress.jsp" onclick="">收货地址</a></li>
          <li> <a href="#">产品预租</a></li>
        </ul>
      </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_2"></em>用户管理</dt>
        <dd>
      <ul>
        <li><a href="userinformation.jsp">用户信息</a></li>
          <c:choose>
              <c:when test="${empty seller}">
                  <li><a href="settings/product/showcollect.do?loginAct=${user.loginAct}&flag=0">我的收藏</a></li>
              </c:when>
              <c:otherwise>
                  <li><a href="settings/product/showcollect.do?loginAct=${seller.loginAct}&flag=1">我的收藏</a></li>
              </c:otherwise>
          </c:choose>

        <li><a href="javascript:void(0)">我的评论</a></li>
      </ul>
    </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_3"></em>账户管理</dt>
      <dd>
       <ul>
        <li><a href="javascript:void(0)">消费记录</a></li>
       <li><a href="javascript:void(0)">跟踪包裹</a></li>
      </ul>
     </dd>
    </dl>
    
    </div>
      <script>jQuery(".sideMen").slide({titCell:"dt", targetCell:"dd",trigger:"click",defaultIndex:0,effect:"slideDown",delayTime:300,returnDefault:true});
      $(function () {
          <c:choose>
          <c:when test="${empty seller}">
          $.ajax({
              url:"settings/user/finduseraddress.do",
              data:{
                  "loginAct":${user.loginAct}
              },
              type:"post",
              datatype:"json",
              success:function (data) {


              },
              error:function(e){
                  alert(e);
              }

          })
          </c:when>
          <c:otherwise>
          $.ajax({
              url:"settings/seller/findselleraddress.do",
              data:{
                  "loginAct":${seller.loginAct}
              },
              type:"post",
              datatype:"json",
              success:function (data) {


              },
              error:function(e){
                  alert(e);
              }

          })
          </c:otherwise>
          </c:choose>
      })
      </script>
   </div>
   <!--浏览记录样式-->
    <div class="us_Records">
	  <div id="Record_ps" class="Record_p">
          <div class="title_name"><span class="name left">浏览历史</span><span class="pageState right"></span></div>
	      <div class="hd"><a class="next">&lt;</a><a class="prev">&gt;</a></div>
            <div class="bd">
                <ul >
                <li>
                   <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_1.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>	
                    </li>
                <li >
                <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_12.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>		
                </li>
                    <li >
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_23.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>	
                    </li>
                    <li >
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_4.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>							
                    </li>
                    <li>
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_5.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>							
                    </li>
                        <li>
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_8.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>				
                    </li>
                        <li >
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_1.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>	
                    </li>
                        <li>
                        <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_6.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>	
                    </li>
                    <li>
                <div class="p_width">
                    <div class="pic"><a href=""><img src="Products/P_11.jpg"></a></div>	
                    <div class="title"><a href="#">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
                    <div class="Purchase_info"><span class="p_Price">￥32.50</span> <a href="#" class="Purchase">立即购买</a></div>
                </div>		
                </li>
                </ul>
                </div>            
         </div>
         <script type="text/javascript">jQuery("#Record_ps").slide({mainCell:".bd ul",autoPage:true,effect:"leftLoop",vis:1,autoPlay:false });</script>
	    </div>
   
 </div>
 <div class="right_style">
     <div class="info_content">
    <div class="Notice"><span>系统最新公告:</span>为了更好地服务于【每日鲜】的会员朋友及读者 发表意见。</div>
     <div class="user_info">
      <ul class="">
       
       <li class="Order_form"><a href="user_order.jsp"><img src="images/user_img_04.png" /><h4>订单：(${ordercount})</h4></a></li>
      
      </ul>
     </div>
     <!--样式-->
     <div class="user_info_p_s  clearfix">
       <!--订单记录-->
       <div class="left_user_cont">
     <div class="us_Orders left clearfix">
  <div class="Orders_name">
   <div class="title_name">
   <div class="Records">购买记录</div>
   <div class="right select">
   只记录你最近30天的购买记录   </div>
   </div>   
  </div>
  <table>
  <thead>
  <tr>
   <th>产品名称</th>
   <th>数量</th>
   <th>状态</th>
   <th>操作</th>
   </tr>
  </thead>
  <tbody>
  <c:forEach items="${productcartList2}" var="shopcar">
      <tr>
          <td class="img_link">
              <a href="javascript:void(0)" class="img"><img src="${pageContext.request.contextPath}/${shopcar.pimage}" width="80" height="80"></a>
              <a href="javascript:void(0)" class="title">${shopcar.pname}</a>
          </td>
          <td>${shopcar.pname}</td>
          <c:choose>
              <c:when test="${shopcar.is_get=='1'}">
                  <td>完成</td>
              </c:when>
              <c:otherwise>
                <c:choose>
                    <c:when test="${shopcar.is_pay=='1' or shopcar.is_rent=='1'}">
                        <td style="color: blue">待收货</td>
                    </c:when>
                    <c:otherwise>
                        <td style="color: red">待付款</td>
                    </c:otherwise>
                </c:choose>
              </c:otherwise>
          </c:choose>

          <td><a href="user_order.jsp" class="View">查看</a></td>
      </tr>
  </c:forEach>

   </tbody>
  </table>
   <div class="us_jls">共${ordercount}条记录</div>
  </div>
    </div>
      <!--右侧记录样式-->
    <div class="right_user_recording">
    <div class="us_Record">
	  <div id="Record_p" class="Record_p">
	    <div class="title_name"><span class="name left">广告区(西南交通大学)</span><span class="pageState right"><span>1</span>/7</span></div>
	      <div class="hd"><a class="next">&lt;</a><a class="prev">&gt;</a></div>
            <div class="bd">
                <ul >
                <li class="clone">
                        <div class="p_width">
                    <div class="pic"><a href="javascript:void(0)"><img src="userheadportrait/1.jpg"></a></div>
                    <div class="title"><a href="javascript:void(0)">西南交通大学</a></div>
                    <div class="Purchase_info"><span class="p_Price">百年学府</span> <a href="https://www.swjtu.edu.cn/" class="Purchase">立即加入</a></div>
                </div>	
                    </li>
                </ul>
            </div>
         </div>
         <script type="text/javascript">jQuery("#Record_p").slide({ mainCell:".bd ul",effect:"leftLoop",vis:1,autoPlay:false });</script>
	    </div>
       </div>      
     </div>
        <!--收藏商品-->

   <!--结束-->       
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
     <%--<dl>--%>

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
