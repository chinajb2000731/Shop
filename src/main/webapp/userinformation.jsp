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
<title>用户信息</title>
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
			<li><a href="./index.jsp">首页</a></li>
			<li><a href="#">预售专区</a><em class="hot_icon"></em></li>
			<li><a href="product_lists.jsp">商城</a></li>
			<li><a href="#">限时折扣</a></li>
			<li><a href="#">联系我们</a></li>
		 </ul>			 
		</div>
	<script >
        $("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});
        $(function () {
           if (${empty seller})
           {   if(${user.sex=="male"})
            {
                $("#gender").html("男");
            }
            else if(${user.sex=="female"})
           {
               $("#gender").html("女");
           }
           else
           {
               $("#gender").html("");
           }
           }
           else {
            if(${seller.sex=="male"})
            {
                $("#gender_s").html("男");
            }
            else if(${seller.sex=="female"})
            {
                $("#gender_s").html("女");
            }
            else
            {
                $("#gender_s").html("");
            }
           }

        })

    </script>
    </div>
</head>
<!--用户中心样式-->
<div class="user_style clearfix">
 <div class="user_center clearfix">
   <!--左侧样式-->
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
          <li><a href="#">跟踪包裹</a></li>
        </ul>
      </dd>
    </dl>
     <dl class="accountSideOption1">
      <dt class="transaction_manage"><em class="icon_2"></em>用户管理</dt>
        <dd>
      <ul>
        <li> <a href="userinformation.jsp"> 用户信息</a></li>
          <c:choose>
              <c:when test="${empty seller}">
                  <li><a href="settings/product/showcollect.do?loginAct=${user.loginAct}&flag=0">我的收藏</a></li>
              </c:when>
              <c:otherwise>
                  <li><a href="settings/product/showcollect.do?loginAct=${seller.loginAct}&flag=1">我的收藏</a></li>
              </c:otherwise>
          </c:choose>
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
 <!--右侧样式-->
   <div class="right_style">
 <!--消费记录样式-->
  <div class="user_address_style">
    <div class="title_style"><em></em>用户信息</div> 
      <!--用户信息样式-->
     <!--个人信息-->
      <div class="Personal_info" id="Personal">
          <c:choose>
              <c:when test="${empty seller}">
          <form action="settings/user/userinfo.do" method="post">
         <ul class="xinxi">
         <li><label>用户名：</label>  <span><input name="name" type="text" value="${user.name}"  class="text"  disabled="disabled"/></span></li>
         <li><label>真实姓名：</label>  <span><input name="rname" type="text" value="${user.rname}"  class="text"  disabled="disabled"/></span></li>
             <li><label>用户性别：</label> <span class="sex" id="gender"></span>
          <div class="add_sex">
                    <input type="radio" name="sex" id="sex1" value="male">
                    男&nbsp;&nbsp;
                    <input type="radio" name="sex" id="sex2" value="female">
                  女&nbsp;&nbsp;</div></li>
             <li><label>身份证号：</label> <span><input name="identity" type="text" value="${user.identity}"  class="text"  disabled="disabled"/></span></li>
          <li><label>电子邮箱：</label>  <span><input name="email" type="text" value="${user.email}"  class="text"  disabled="disabled"/></span></li>
          <li><label>用户QQ：</label>  <span><input name="QQnumber" type="text" value="${user.QQnumber}"  class="text"  disabled="disabled"/></span></li>
          <li><label>移动电话：</label>  <span><input name="phone" type="text" value="${user.phone}"  class="text"  disabled="disabled"/> </span></li>

          <div class="bottom">
              <input name="" type="button" value="修改信息"  class="modify"/>
              <input name="" type="submit" value="确认修改"  class="confirm"/>
          </div>
         </ul>
          </form>
              </c:when>
              <c:otherwise>
                  <form action="settings/user/sellerinfo.do" method="post">
                      <ul class="xinxi">
                          <li><label>用户名：</label>  <span><input name="name" type="text" value="${seller.name}"  class="text"  disabled="disabled"/></span></li>
                          <li><label>真实姓名：</label>  <span><input name="rname" type="text" value="${seller.rname}"  class="text"  disabled="disabled"/></span></li>
                          <li><label>用户性别：</label> <span class="sex" id="gender_s"></span>
                              <div class="add_sex">
                                  <input type="radio" name="sex" id="sex1_s" value="male">
                                  男&nbsp;&nbsp;
                                  <input type="radio" name="sex" id="sex2_s" value="female">
                                  女&nbsp;&nbsp;</div></li>
                          <li><label>身份证号：</label> <span><input name="identity" type="text" value="${seller.identity}"  class="text"  disabled="disabled"/></span></li>
                          <li><label>电子邮箱：</label>  <span><input name="email" type="text" value="${seller.email}"  class="text"  disabled="disabled"/></span></li>
                          <li><label>用户QQ：</label>  <span><input name="QQnumber" type="text" value="${seller.QQnumber}"  class="text"  disabled="disabled"/></span></li>
                          <li><label>移动电话：</label>  <span><input name="phone" type="text" value="${seller.phone}"  class="text"  disabled="disabled"/> </span></li>

                          <div class="bottom">
                              <input name="" type="button" value="修改信息"  class="modify"/>
                              <input name="" type="submit" value="确认修改"  class="confirm"/>
                          </div>
                      </ul>
                  </form>
              </c:otherwise>
          </c:choose>
         <ul class="Head_portrait">
            <c:choose>
                <c:when test="${empty seller}">
                    <li class="User_avatar"><img src="${pageContext.request.contextPath}/${user.headportrait}" width="200px" height="200px" /></li>
                </c:when>
                <c:otherwise>
                    <li class="User_avatar"><img src="${pageContext.request.contextPath}/${seller.headportrait}" width="200px" height="200px" /></li>
                </c:otherwise>
            </c:choose>

          <li>
              <c:choose>
                  <c:when test="${empty seller}">
              <form action="settings/user/userheadportrait.do" method="post" enctype="multipart/form-data">
                  <input name="headportrait" type="file" />
                  <input name="name" type="submit" value="上传头像"  class="submit"/>
               </form>
                  </c:when>
                  <c:otherwise>
                      <form action="settings/seller/sellerheadportrait.do" method="post" enctype="multipart/form-data">
                      <input name="headportrait" type="file" />
                      <input name="name" type="submit" value="上传头像"  class="submit"/>
                      </form>
                  </c:otherwise>
              </c:choose>
          </li>
         </ul>
      </div>    
   </div>
  </div>
 </div>
 </div>
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
