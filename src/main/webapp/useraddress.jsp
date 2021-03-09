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
<title>用户中心-收货地址</title>
    <style type="text/css">
        /* 模态框初始状态 */
        .modalbox {
            font-family: Arial, Helvetica, sans-serif;
            /* 通过 position 让遮罩层撑满整个屏幕 */
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            /* 遮罩层背景色为黑色 */
            /* background: #000;*/
            background: black;
            /* 给 z-index 一个过大的值，确保遮罩层”真的遮盖住了“模态框背后的元素 */
            z-index: 99999;
            /* 设置 opacity 为 0，用于隐藏模态框 */
            opacity: 0;
            /* 一些过渡效果 */
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            /* pointer-events 鼠标事件“穿透”该元素并且指定该元素“下面”的任何东西 */
            /* 请参阅：https://developer.mozilla.org/zh-CN/docs/Web/CSS/pointer-events */
            pointer-events: none;
        }

        /* 模态框显示状态 */
        .modalbox:target {
            /* 不透明为 0.8 */
            opacity: 0.8;
            /* 与 pointer-events 属性未指定时的表现效果相同 */
            /* 请参阅：https://developer.mozilla.org/zh-CN/docs/Web/CSS/pointer-events */
            pointer-events: auto;
        }

        /* 模态框内容，你也可以自定义 */
        .modalbox-dialog {
            width: 600px;
            position: relative;
            margin: 10% auto;
            padding: 5px 20px 13px 20px;

            border-radius: 10px;
            background: #fff;
        }



    </style>
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
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="keyword" class="search_box"  type="text">
            <input name="" type="button" value="搜 索"  class="Search_btn" onclick="productsearch()"/>
        </div>
        <div class="clear hotword">热门搜索词：汽车&nbsp;&nbsp;&nbsp;电脑&nbsp;&nbsp;&nbsp;手机&nbsp;&nbsp;&nbsp;平板&nbsp;&nbsp;&nbsp;玩具</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${totalcartnum}</i></div>
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
			<li><a href="Home.html">首页</a></li>
			<li><a href="#">预租专区</a><em class="hot_icon"></em></li>
			<li><a href="products_list.html">商城</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="Brands.html">联系我们</a></li>
		 </ul>			 
		</div>
	<script>
        $("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});
        function reset() {

            $("#consignee").val("");
            $("#address").val("");
            $("#postcode").val("");
            $("#phone").val("");
        }

       function updateuseraddress(aid,consignee,address,postcode,phone) {

        if( ${empty seller}) {
            $("#consignee2").val(consignee);
            $("#address2").val(address);
            $("#postcode2").val(postcode);
            $("#phone2").val(phone);
            $("#aid").val(aid);
        }
        else
        {
            $("#consignee3").val(consignee);
            $("#address3").val(address);
            $("#postcode3").val(postcode);
            $("#phone3").val(phone);
            $("#aid2").val(aid);
        }


       }
        function saveaddress() {
            var consignee = $.trim($("#consignee").val());
            var address = $.trim($("#address").val());
            var postcode = $.trim($("#postcode").val());
            var phone = $.trim($("#phone").val());
            if(consignee==''||address==''||postcode==''||phone=='')
            {

                $("#msg").html("带*的为必填项，请填写完毕");
                return false;
            }

            //去后台验证登录相关操作
            $.ajax({
                url:"settings/user/useraddress.do",
                data:{
                    "consignee":consignee,
                    "address":address,
                    "postcode":postcode,
                    "phone":phone
                },
                type:"post",
                dataType:"json",

                success:function (data) {

                    $("#consignee").val("");
                    $("#address").val("");
                    $("#postcode").val("");
                    $("#phone").val("");
                    window.location.href="useraddress.jsp";

                },
                error:function(e){
                    alert(111);
                }

            })


        }
        function saveselleraddress() {
            var consignee = $.trim($("#consignee").val());
            var address = $.trim($("#address").val());
            var postcode = $.trim($("#postcode").val());
            var phone = $.trim($("#phone").val());
            if(consignee==''||address==''||postcode==''||phone=='')
            {

                $("#msg").html("带*的为必填项，请填写完毕");
                return false;
            }

            //去后台验证登录相关操作
            $.ajax({
                url:"settings/seller/selleraddress.do",
                data:{
                    "consignee":consignee,
                    "address":address,
                    "postcode":postcode,
                    "phone":phone
                },
                type:"post",
                dataType:"json",

                success:function (data) {

                    $("#consignee").val("");
                    $("#address").val("");
                    $("#postcode").val("");
                    $("#phone").val("");
                    window.location.href="useraddress.jsp";

                },
                error:function(e){
                    alert(111);
                }

            })


        }
    </script>
    </div>
</head>
<!--用户中心样式-->
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
          <li> <a href="javascript:void(0)">我的订单</a></li>
          <li> <a href="useraddress.jsp">收货地址</a></li>
          <li> <a href="#">缺货登记</a></li>
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
 <!--右侧样式属性-->
 <div class="right_style">
 <!--地址管理-->
  <div class="user_address_style">
    <div class="title_style"><em></em>地址管理</div> 
   <div class="add_address">
    <span class="name">添加送货地址</span>
    <table cellpadding="0" cellspacing="0" width="100%">
     <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input id="consignee" type="text"  class="add_text" style=" width:100px" /><i>*</i></td></tr>
     <tr><td class="label_name">收货地址：</td><td><textarea id="address" cols="" rows="" style=" width:500px; height:100px; margin:5px 0px"></textarea><i>*</i></td></tr>
     <tr><td class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td><input id="postcode" type="text" class="add_text" style=" width:100px"/><i>*</i></td></tr>
        <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input id="phone" type="text" class="add_text" style=" width:200px"/>&nbsp;&nbsp;<i>*</i></td></tr>
     <tr class="moren_dz" style="color: #999"><td class="label_name"></td><td><label><input name="" type="checkbox" value="" />设置为默认地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         <span id="msg" style="color: red"></span></td></tr>
     <tr>
         <c:choose>
             <c:when test="${empty seller}">
                 <td colspan="2" class="center"><input name="" type="button" value="保存"  class="add_dzbtn" onclick="saveaddress()"/><input name="" type="button" value="清空"  class="reset_btn" onclick="reset()"/></td>
             </c:when>
             <c:otherwise>
                 <td colspan="2" class="center"><input name="" type="button" value="保存"  class="add_dzbtn" onclick="saveselleraddress()"/><input name="" type="button" value="清空"  class="reset_btn" onclick="reset()"/></td>
             </c:otherwise>
         </c:choose>

     </tr>

    </table>
   </div>
   <!--用户地址-->
   <div class="address_content">
    <table cellpadding="0" cellspacing="0" class="user_address" width="100%">
    <thead>
    <tr class="label"><td width="80px;">收货人</td><td width="220px;">收货地址</td><td width="80px;">邮编</td><td width="120px;">电话手机</td><td width="80px;">操作</td></tr>
     </thead>
     <tbody>
     <c:forEach items="${addressBean.list}" var="ad">
     <tr>

             <td>${ad.consignee}</td>
             <td>${ad.address}</td>
             <td>${ad.postcode}</td>
             <td>${ad.phone}</td>
         <c:choose>
             <c:when test="${empty seller}">
                 <td><a href="#my-modal-box" onclick="updateuseraddress('${ad.aid}','${ad.consignee}','${ad.address}','${ad.postcode}','${ad.phone}')">修改</a> | <a href="settings/user/deleteuseraddress.do?aid=${ad.aid}">删除</a></td>
             </c:when>
             <c:otherwise>
                 <td><a href="#my-modal-box" onclick="updateuseraddress('${ad.aid}','${ad.consignee}','${ad.address}','${ad.postcode}','${ad.phone}')">修改</a> | <a href="settings/seller/deleteselleraddress.do?aid=${ad.aid}">删除</a></td>
             </c:otherwise>
         </c:choose>

                     <%--${ad.aid},${ad.consignee},${ad.address},${ad.postcode},${ad.phone} --%>
         <%--#my-modal-box--%>
                   <%-- onclick="updateuseraddress('${ad.aid}','${ad.consignee}','${ad.address}','${ad.postcode}','${ad.phone}')"--%>
     </tr>
     </c:forEach>

     </tbody>
    </table>
<%--
       <div class="Paging">
           <div class="Pagination">
               <c:forEach begin="1" end="${addressBean.totalPage}" var="page">
                  <!--判断是否是当前页-->
                  <c:if test="${page==addressBean.currentPage}">
                      <a href="javascript:void(0);" class="on">${page}</a>
                  </c:if>
                   <c:if test="${page!=addressBean.currentPage}">
                       <a href="settings/user/finduseraddress.do?loginAct=${addressBean.loginAct}&currentPage=${page}">${page}</a>
                   </c:if>

               </c:forEach>
              &lt;%&ndash; <a href="#">首页</a>
               <a href="#" class="pn-prev disabled">&lt;上一页</a>
               <a href="#" class="on">1</a>

               <a href="#">3</a>
               <a href="#">4</a>
               <a href="#">下一页&gt;</a>
               <a href="#">尾页</a>&ndash;%&gt;
           </div>
       </div>--%>
   </div>  
  </div>
 </div>
 </div>
 </div>
    <script>
            $(document).ready(function(){
              $('.moren_dz input').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
              });
            });
            </script>
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


<!-- 1. 模态框的显示按钮，通常用于显示指定的模态框 -->
<!-- <a href="#my-modal-box">显示模态框</a> -->

<!-- 2. 模态框容器的根节点，它通常会显示为一个透明的遮罩覆盖全屏 -->
<div id="my-modal-box" class="modalbox">

    <!-- 3. 模态框内容的跟节点，它通常是一个非透明的容器，用于展示具体内容 -->
    <div class="modalbox-dialog">

        <!-- 4. 模态框的关闭按钮，通常用于关闭模态框 -->
        <a href="#close" title="关闭" class="modalbox-close-btn">X</a>

        <!--    5. 你的自定义内容，纯文字、表单、提示信息等 -->
        <!--  <h2>ModalBox Tutorial</h2>
         <p>这是一个使用 HTML5 和 CSS3 构建的模态框</p>
         <p>你可以将它加入到 Web APP 中的许多交互中，如：登录/注册、操作反馈、提示信息等。</p> -->
        <c:choose>
            <c:when test="${empty seller}">
                <form action="settings/user/updateuseraddress.do" method="post">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input name="consignee" id="consignee2"  type="text"  class="add_text" style=" width:100px" /><i>*</i></td></tr>
                        <tr><td class="label_name">收货地址：</td><td><textarea name="address" id="address2" cols="" rows="" style=" width:500px; height:100px; margin:5px 0px;border: #999   1px   solid;"></textarea><i>*</i></td></tr>
                        <tr><td class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td><input name="postcode" id="postcode2" type="text" class="add_text" style=" width:100px"/><i>*</i></td></tr>
                        <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input name="phone" id="phone2" type="text" class="add_text" style=" width:200px"/>&nbsp;&nbsp;<i>*</i></td></tr>
                        <tr style="color: #999"><td class="label_name"></td><td><label><input name="" type="checkbox" value="" />设置为默认地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <tr><td colspan="2" class="center"><input name="" type="submit" value="保存" /></td>
                        </tr>
                        </td>
                        </tr>
                        <input id="aid" name="aid" type="hidden" value=""/>
                    </table>
                </form>
            </c:when>
            <c:otherwise>
                <form action="settings/seller/updateselleraddress.do" method="post">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input name="consignee" id="consignee3"  type="text"  class="add_text" style=" width:100px" /><i>*</i></td></tr>
                        <tr><td class="label_name">收货地址：</td><td><textarea name="address" id="address3" cols="" rows="" style=" width:500px; height:100px; margin:5px 0px;border: #999   1px   solid;"></textarea><i>*</i></td></tr>
                        <tr><td class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td><input name="postcode" id="postcode3" type="text" class="add_text" style=" width:100px"/><i>*</i></td></tr>
                        <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input name="phone" id="phone3" type="text" class="add_text" style=" width:200px"/>&nbsp;&nbsp;<i>*</i></td></tr>
                        <tr style="color: #999"><td class="label_name"></td><td><label><input name="" type="checkbox" value="" />设置为默认地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <tr><td colspan="2" class="center"><input name="" type="submit" value="保存" /></td>
                        </tr>
                        </td>
                        </tr>
                        <input id="aid2" name="aid" type="hidden" value=""/>
                    </table>
                </form>
            </c:otherwise>
        </c:choose>


    </div>

</div>
</body>
</html>
