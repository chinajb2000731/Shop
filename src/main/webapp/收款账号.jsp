<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="layer/layer.js" type="text/javascript"></script>
<script src="Plugins/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript">
        function productsearch() {
            var keyword=$("#keyword").val();
            location.href="settings/product/productsearch.do?keyword="+keyword;

        }
    </script>
<title>收款账号</title>
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
                  <a href="settings/product/selectusercenterorder.do?cid=${seller.loginAct}&flag=1" class="green">用户中心</a>&nbsp&nbsp
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
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="index.jsp">首页</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="javascript:void(0)">消息中心</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="settings/product/productlists.do?cid=1">商品分类</a></li>
          <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="user_order.jsp">我的购物车<b>(${totalcartnum})</b></a></li>
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
              <!--   <li><a href="#">信息</a></li> -->
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
     <li ><em></em><a href="店铺专区.jsp">店铺专区</a></li>
    <li><em></em><a href="settings/seller/selectcheckproduct.do?sid=${seller.sid}">商品专区</a></li>
    <li><em></em><a href="settings/seller/sellerorder.do?sid=${seller.sid}">订单专区</a></li>
    <li><em></em><a href="settings/seller/selectdeliveryaddress.do?sid=${seller.sid}">发货管理</a></li>
    <li class="on"><em></em><a href="javascript:void(0)">收款账户</a></li>
   </ul>
  </div>
</div>
<!--右侧内容样式-->
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>收款账户</div>
   <div class="content_style">
   <!--收款账号-->
    <div class="Account_style clearfix">
    <div class="Account_prompt">只支持支付宝,银联和微信账号，每个账号只能为一个。</div>
    <!-- <div class="add_Bank_card"><a href="#" class="add_btn">设置收款银行卡</a></div>-->
     <div class="Bank_card clearfix">
      <div class="Bank_card_style add_Account">
        <a href="javascript:void(0)" class="aadd_Bank_btn btn" id="Alipay">支付宝账户</a>
      </div> 
      <div class="Bank_card_style">
        <div class="Alipay_zh">
         <span class="logo"><img src="images/zfb.jpg" /></span>
         <span class="bank_name">账户：133454534332</span>
         <span class="time">开通时间：2016-04-19</span>
        </div>
      </div>  
       <div class="Bank_card_style default">
       <div class="card_box_name">
       <span class="bank_logo"><img src="images/NTo2Wh8TF.png" /></span>
       <span class="bank_name">建设银行</span>
       <span class="bank_num4">尾号45343</span>
       <span class="card_type_CC card_type_DC"></span>
       </div>
       <div class="bank_operating"><a href="javascript:void(0)" class="left account_info">查看</a><a href="#" class="right">删除</a></div>
       <div class="bank_default">默认收款账户</div>
      </div>
       <div class="Bank_card_style add_Account">
       <a href="javascript:void(0)" class="aadd_Bank_btn btn" id="UnionPay">银联账户</a>
      </div>
       <div class="Bank_card_style add_Account">
       <a href="javascript:void(0)" class="aadd_Bank_btn btn" id="WeChat">微信账户</a>
      </div>    
     </div>    
    </div>
   </div>
 </div>
</div>
<div class="Account_bankstyle" id="Account_bank" style="display:none">
 <div class="addAccount_style">
  <ul class="UnionPay_style">  
   <li><label class="label_name">银行</label><select name="" size="1">
     <option value="1">中国建设银行</option>
     <option value="2">中国银行</option>
     <option value="3">中国工商银行</option>
     <option value="4">中国农业银行</option>
     <option value="5">中国招商银行</option>
     <option value="6">中国中信银行</option>
   </select></li>
   <li><label class="label_name">账户</label><input name="" type="text"  class="text" style=" width:300px;"/></li>
   <li><label class="label_name">姓名</label><input name="" type="text"  class="text"/></li>
   <li><label class="label_name">开户时间</label><input name="" type="text"  class="text inline laydate-icon" id="start" width="200px;"/></li>
   <li><button class="btn Opened_btn" type="button">点击开通</button></li>
  </ul>
  <!--支付宝账户-->
  <div class="Alipay_style">
    <div><label class="label_name">支付宝账户</label><input name="" type="text"  class="text" style=" width:300px"/></div>
    <button class="btn Opened_btn" type="button">点击开通</button>
  </div>
  <!--微信账户-->
  <div class="WeChat_style">
  <div><label class="label_name">微信账户</label><input name="" type="text"  class="text" style=" width:300px"/></div>
  <button class="btn Opened_btn" type="button">点击开通</button>
  </div>
  </div> 
</div>
<!--账户信息-->
<div id="account_info" class="acc_info_style" style="display:none">
 <ul class="list_info">
  <li><label class="label_name">开户银行</label><span>中国建设银行</span></li>
  <li><label class="label_name">开户账户</label><span>6226 4564 6789 345</span></li>
  <li><label class="label_name">姓名</label><span>张孝全</span></li>
  <li><label class="label_name">开通时间</label><span>2016年4月19日</span></li>
  <li><label class="label_name">限额</label><span>50万(单笔交易量最高为50万)</span></li>
 </ul>
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
<script type="text/javascript">
 $('.aadd_Bank_btn').on('click', function(){
    layer.open({
    type: 1,
	title:'添加账户',
	area: ['500px',''],
	shadeClose: true,
	content: $('#Account_bank')
    });
});
 $('.account_info').on('click', function(){
    layer.open({
    type: 1,
	title:'账户信息',
	area: ['600px',''],
	shadeClose: true,
	content: $('#account_info')
    });
});
$(".aadd_Bank_btn").bind("click",function(){
                var cid = $(this).attr("id");
				var cname = $(this).attr("title");
                $(".addAccount_style").attr("id",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page").html(cname).ready();
				
				
      });
laydate({
    elem: '#start', //目标元素'
    event: 'focus' //响应事件。
});
</script>
</body>
</html>
