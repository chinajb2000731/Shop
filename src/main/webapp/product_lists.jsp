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
<script src="js/accordion.js" type="text/javascript"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<title>产品列表页</title>
</head>
<script type="text/javascript" charset="UTF-8">
<!--
 //点击效果start
 function infonav_more_down(index)
 {
  var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length)*30;//先设置了P的高度，然后计算所有P的高度
  if(inHeight > 60){
   $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:inHeight});
   $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up('+index+');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
  }else{
   return false;
  }
 }
 function infonav_more_up(index)
 {
  var infonav_height = 85;
  $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:infonav_height});
  $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down('+index+');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
 }
   
 function onclick(event) {
  info_more_down();
 return false;
 }
 //点击效果end  
//-->
<!--实现手风琴下拉效果-->
$(function(){
   $(".nav").accordion({
        //accordion: true,
        speed: 500,
	    closedSign: '+',
		openedSign: '-'
	});
}); 

$(function() { 
	$("#scrollsidebar").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime : 600
	});
});
function productsearch() {
    var keyword=$("#keyword").val();
    location.href="settings/product/productsearch.do?keyword="+keyword;

}
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
                  <a href="店铺专区.jsp" class="green">店铺专区</a>
              </c:when>
              <c:otherwise>
                  <span>欢迎:【${user.name}】</span>&nbsp&nbsp
                  <a href="settings/product/selectusercenterorder.do?cid=${user.loginAct}&flag=0" class="green">用户中心</a>
              </c:otherwise>
          </c:choose>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
          <c:choose>
              <c:when test="${empty user and empty seller}">
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp">首页</a></li>
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
              </c:when>
              <c:otherwise>
                  <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp">首页</a></li>
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
           <input name="" type="button" value="搜 索" onclick="productsearch()" class="Search_btn"/>
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
            <li><a href="index.jsp">首页</a></li>
            <li class="hour"><span class="bg_muen"></span><a href="半小时圈主页.jsp">半小时生活圈</a></li>
            <li><a href="javascript:void(0)">预售专区</a><em class="hot_icon"></em></li>
            <li><a href="settings/product/productlists.do?cid=1">商城</a></li>

            <li><a href="javascript:void(0)">热销活动</a></li>
            <li><a href="javascript:void(0)">联系我们</a></li>
        </ul>
    </div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<!--产品列表样式-->
<div class="Inside_pages">
<!--位置-->
<div id="Filter_style">
  
<!--条件筛选样式-->
 
 </div>
 <!--产品列表样式-->
 <div  class="scrollsidebar side_green clearfix" id="scrollsidebar"> 
    <div class="show_btn" id="rightArrow"><span></span></div>
     <!--左侧样式-->
   <div class="page_left_style side_content"  >
  <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
   <div class="side_list">
    <div class="title_name">广告区</div>
   <div class="demo">
      <ul class="nav">
         <li class="Menu_Bar"><a href="javascript:void(0)">西南交通大学</a>
              <ul>
                  <li><a href="javascript:void(0)">西南交通大学</a></li>
                  <li><a href="javascript:void(0)">西南交通大学</a></li>
                  <li><a href="javascript:void(0)">西南交通大学</a></li>
                  <li><a href="javascript:void(0)">西南交通大学</a></li>
              </ul>
         </li>
         <li class="Menu_Bar"><a href="javascript:void(0)">西南交通大学</a></li>
         <li class="Menu_Bar"><a href="javascript:void(0)">西南交通大学</a></a>
              <ul>
                   <li class="active"><a href="javascript:void(0)">西南交通大学</a></li>
                   <li><a href="#">西南交通大学</a>
                        <ul>
                            <li><a href="javascript:void(0)">西南交通大学</a></li>
                            <li><a href="javascript:void(0)">西南交通大学</a></li>
                            <li><a href="javascript:void(0)">西南交通大学</a></li>
                            <li><a href="javascript:void(0)">西南交通大学</a></li>
                        </ul>
                   </li>
                   <li><a href="javascript:void(0)" >西南交通大学</a></li>
                   <li><a href="javascript:void(0)" >西南交通大学</a></li>
                   <li><a href="javascript:void(0)" >西南交通大学</a></li>
              </ul>
         </li>
         <li class="Menu_Bar"><a href="javascript:void(0)">西南交通大学</a></li>
      </ul>
   </div> 
  </div>
 </div>
 <div class="page_right_style">
 <div class="Sorted">
  <div class="Sorted_style">
	  <c:forEach items="${categoryList}" var="category">
		  <a href="settings/product/productlists.do?cid=${category.cid}">${category.cname}<i class="iconfont icon-fold"></i></a>
	  </c:forEach>
   </div>
   <!--产品搜索-->
   <div class="products_search">
    <input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value="" class="search_btn">
   </div>
   </div>
   <div class="p_list  clearfix">
   <ul>
       <c:forEach items="${pageProductBean.list}" var="pro">
           <li class="gl-item">
               <em class="icon_special tejia"></em>
               <div class="Borders">
                   <div class="img"><a href="settings/product/productinfo.do?pid=${pro.pid}"><img src="${pageContext.request.contextPath}/${pro.pimage}" style="width:220px;height:220px"></a></div>
                   <div class="Price">
                       <c:choose>
                           <c:when test="${pro.rent==''}">
                               <b>租用:不支持租用<br/>购买:¥${pro.price}</b><%--<span>[¥49.01/500g]</span>--%>
                           </c:when>
                           <c:otherwise>
                               <b>租用:¥${pro.rent}<br/>购买:¥${pro.price}</b><%--<span>[¥49.01/500g]</span>--%>
                           </c:otherwise>
                       </c:choose>

                   </div>
                   <div class="name"><a href="Product_Detailed.html">${pro.pname}</a></div>
                   <div class="p-operate">
                       <c:choose>
                           <c:when test="${empty seller and empty user}">
                               <a href="登录.jsp" class="p-o-btn Collect"><em></em>收藏</a>
                           </c:when>
                           <c:otherwise>
                               <c:choose>
                                   <c:when test="${empty seller}">
                                       <a href="settings/product/collect.do?pid=${pro.pid}&loginAct=${user.loginAct}&flag=0" class="p-o-btn Collect"><em></em>收藏</a>
                                   </c:when>
                                   <c:otherwise>
                                       <a href="settings/product/collect.do?pid=${pro.pid}&loginAct=${seller.loginAct}&flag=1" class="p-o-btn Collect"><em></em>收藏</a>
                                   </c:otherwise>
                               </c:choose>

                           </c:otherwise>
                       </c:choose>
                       <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
                   </div>
               </div>
           </li>
       </c:forEach>

   </ul>

   <div class="Paging">
    <div class="Pagination">
        <!-- 显示每一页-->

        <c:if test="${pageProductBean.currentPage==1}">
            <a href="javascript:void(0);" class="pn-prev disabled">&lt;上一页</a>
        </c:if>
        <c:if test="${pageProductBean.currentPage!=1}">
            <c:choose>
                <c:when test="${empty keyword}">
                    <a href="settings/product/productlists.do?cid=${productcid}&currentPage=${pageProductBean.currentPage-1}" class="pn-prev disabled">&lt;上一页</a>
                </c:when>
                <c:otherwise>
                    <a href="settings/product/productsearch.do?keyword=${keyword}&currentPage=${pageProductBean.currentPage-1}" class="pn-prev disabled">&lt;上一页</a>
                </c:otherwise>
            </c:choose>

        </c:if>

        <c:forEach begin="1" end="${pageProductBean.totalPage}" var="page">
            <c:if test="${page==pageProductBean.currentPage}">
                <a href="javascript:void(0)" class="on">${page}</a>
            </c:if>
            <c:if test="${page!=pageProductBean.currentPage}">
                <c:choose>
                    <c:when test="${empty keyword}">
                        <a href="settings/product/productlists.do?cid=${productcid}&currentPage=${page}">${page}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="settings/product/productsearch.do?keyword=${keyword}&currentPage=${page}">${page}</a>
                    </c:otherwise>
                </c:choose>

            </c:if>
        </c:forEach>

        <c:if test="${pageProductBean.currentPage==pageProductBean.totalPage}">
            <a href="javascript:void(0);">下一页&gt;</a>
        </c:if>
        <c:if test="${pageProductBean.currentPage!=pageProductBean.totalPage}">
            <c:choose>
                <c:when test="${empty keyword}">
                    <a href="settings/product/productlists.do?cid=${productcid}&currentPage=${pageProductBean.currentPage+1}">下一页&gt;</a>
                </c:when>
                <c:otherwise>
                    <a href="settings/product/productsearch.do?keyword=${keyword}&currentPage=${pageProductBean.currentPage+1}">下一页&gt;</a>
                </c:otherwise>
            </c:choose>

        </c:if>
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
 <!--右侧菜单栏购物车样式-->
<div class="fixedBox">
  <ul class="fixedBoxList">
      <li class="fixeBoxLi user"><a href="#"> <span class="fixeBoxSpan"></span> <strong>消息中心</strong></a> </li>
    <li class="fixeBoxLi cart_bd" style="display:block;" >
		<p class="good_cart">9</p>
			<span class="fixeBoxSpan"></span> <strong>购物车</strong>
			<div class="cartBox">
       		<div class="bjfff"></div><div class="message">购物车内暂无商品，赶紧选购吧</div>    </div></li>
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
			 <p>微信扫扫，关注我们</p>
			</div>		
			</div>
			</li>

    <li class="fixeBoxLi Home"> <a href="./"> <span class="fixeBoxSpan"></span> <strong>收藏夹</strong> </a> </li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
</div>
</body>
</html>
