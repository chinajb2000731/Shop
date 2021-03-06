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
</script>
<body>
<head>
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection"><a href="#" class="green">请登录</a> <a href="#" class="green">免费注册</a></div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">首页</a></li> 
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="#">我的小充</a> </li>
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">消息中心</a></li>
       <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">商品分类</a></li>
        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">我的购物车<b>(23)</b></a></li>	
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
                <li class="current"><a href="#">产品</a></li>
                <li><a href="#">信息</a></li>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="searchName" class="search_box" onkeydown="keyDownSearch()" type="text">
           <input name="" type="submit" value="搜 索"  class="Search_btn"/>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
</div>
 <!--购物车样式-->
 <div class="hd_Shopping_list" id="Shopping_list">
   <div class="s_cart"><a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i></div>
   <div class="dorpdown-layer">
    <div class="spacer"></div>
	 <!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
	 <ul class="p_s_list">	   
		<li>
		    <div class="img"><img src="images/tianma.png"></div>
		    <div class="content"><p class="name"><a href="#">产品名称</a></p><p>颜色分类:紫花8255尺码:XL</p></div>
			<div class="Operations">
			<p class="Price">￥55.00</p>
			<p><a href="#">删除</a></p></div>
		  </li>
		</ul>		
	 <div class="Shopping_style">
	 <div class="p-total">共<b>1</b>件商品　共计<strong>￥ 515.00</strong></div>
	  <a href="Shop_cart.html" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
	 </div>	 
   </div>
 </div>
</div>
<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
			<li><a href="Home.html">首页</a></li>
            <li class="hour"><span class="bg_muen"></span><a href="#">半小时生活圈</a></li>
			<li><a href="#">你身边的超市</a></li>
			<li><a href="#">预售专区</a><em class="hot_icon"></em></li>
			<li><a href="products_list.html">商城</a></li>
			
			<li><a href="#">好评商户</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="Brands.html">联系我们</a></li>
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
         <li class="Menu_Bar"><a href="#">服务</a>
              <ul>
                  <li><a href="#">西南交通大学</a></li>
                  <li><a href="#">西南交通大学</a></li>
                  <li><a href="#">西南交通大学</a></li>
                  <li><a href="#">西南交通大学</a></li>
              </ul>
         </li>
         <li class="Menu_Bar"><a href="#">案例</a></li>
         <li class="Menu_Bar"><a href="#">文章</a></a>
              <ul>
                   <li class="active"><a href="#">西南交通大学</a></li>
                   <li><a href="#">西南交通大学</a>
                        <ul>
                            <li><a href="#">西南交通大学</a></li>
                            <li><a href="#">西南交通大学</a></li>
                            <li><a href="#">西南交通大学</a></li>
                            <li><a href="#">西南交通大学</a></li>
                        </ul>
                   </li>
                   <li><a href="#" target="_blank">西南交通大学</a></li>
                   <li><a href="#" target="_blank">西南交通大学</a></li>
                   <li><a href="#" target="_blank">西南交通大学</a></li>
              </ul>
         </li>
         <li class="Menu_Bar"><a href="#" target="_blank">西南交通大学</a></li>
      </ul>
   </div> 
  </div>
 </div>
 <div class="page_right_style">
 <div class="Sorted">
  <div class="Sorted_style">
   <a href="#" class="on">综合<i class="iconfont icon-fold"></i></a>
   <a href="#">信用<i class="iconfont icon-fold"></i></a>
   <a href="#">价格<i class="iconfont icon-fold"></i></a>
   <a href="#">销量<i class="iconfont icon-fold"></i></a>
   </div>
   <!--产品搜索-->
   <div class="products_search">
    <input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value="" class="search_btn">
   </div>
   <!--页数-->
   <div class="s_Paging">
   <span> 1/12</span>
   <a href="#" class="on">&lt;</a>
   <a href="#">&gt;</a>
   </div>
   </div>
   <div class="p_list  clearfix">
   <ul>
    <li class="gl-item">
    <em class="icon_special tejia"></em>
	<div class="Borders">
	 <div class="img"><a href="Product_Detailed.html"><img src="products/p_11.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥87</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="Product_Detailed.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
    <em class="icon_special tejia"></em>
	<div class="Borders">
	 <div class="img"><a href="Product_Detailed.html"><img src="products/P_2.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥87</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="Product_Detailed.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
    <em class="icon_special tejia"></em>
	<div class="Borders">
	 <div class="img"><a href="Product_Detailed.html"><img src="products/P_3.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="Product_Detailed.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="Product_Detailed.html"><img src="products/P_4.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="Product_Detailed.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
    <em class="icon_special xinping"></em>
	<div class="Borders">
	 <div class="img"><a href="Product_Detailed.html"><img src="products/P_5.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="Product_Detailed.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_6.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_7.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_15.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_9.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_8.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_11.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_16.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_16.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_17.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	<div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
	<li class="gl-item">
	<div class="Borders">
	 <div class="img"><a href="#"><img src="products/P_15.jpg" style="width:220px;height:220px"></a></div>
	 <div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
	 <div class="name"><a href="#">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
	 <div class="Shop_name"><a href="#">三只松鼠旗舰店</a></div>
	 <div class="p-operate">
	  <a href="#" class="p-o-btn Collect"><em></em>收藏</a>
	  <a href="#" class="p-o-btn shop_cart"><em></em>联系我们</a>
	 </div>
	 </div>
	</li>
   </ul>
   <div class="Paging">
    <div class="Pagination">
    <a href="#">首页</a>
     <a href="#" class="pn-prev disabled">&lt;上一页</a>
	 <a href="#" class="on">1</a>
	 <a href="#">2</a>
	 <a href="#">3</a>
	 <a href="#">4</a>
	 <a href="#">下一页&gt;</a>
	 <a href="#">尾页</a>	
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
    <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
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
			 <p>微信扫一扫，关注我们</p>
			</div>		
			</div>
			</li>

    <li class="fixeBoxLi Home"> <a href="./"> <span class="fixeBoxSpan"></span> <strong>收藏夹</strong> </a> </li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
</body>
</html>
