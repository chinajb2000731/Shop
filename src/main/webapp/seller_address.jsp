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
    <script type="text/javascript">
        function productsearch() {
            var keyword=$("#keyword").val();
            location.href="settings/product/productsearch.do?keyword="+keyword;

        }

        function saveaddress()
        {
            var consignee=$.trim($("#consignee").val());
            var area=$.trim($("#area").val());
            var streetaddress=$.trim($("#streetaddress").val());
            var postcode=$.trim($("#postcode").val());
            var phone=$.trim($("#phone").val());
            var remarks=$.trim($("#remarks").val());
            if(consignee==''||area==''||streetaddress==''||postcode==''||phone=='')
            {

                alert("带*的为必填项，请填写完毕");
                return false;
            }
            location.href="settings/seller/adddeliveryaddress.do?sid=${seller.sid}&area="+area+"&streetaddress="+streetaddress+"&postcode="+postcode+"&phone="+phone+"&remarks="+remarks+"&consginee="+consignee;
        }
        function updatedelivery(id,sid,consignee,area,streetaddress,postcode,phone,remarks) {

             $("#id").val(id);
             $("#sid").val(sid);
             $("#consignee2").val(consignee);
             $("#area2").val(area);
             $("#streetaddress2").val(streetaddress);
             $("#postcode2").val(postcode);
             $("#phone2").val(phone);
             $("#remarks2").val(remarks);

        }
    </script>
<title>发货管理</title>
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
    width: 700px;
    height: 400px;
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
                <li><a href="javascript:void(0)">信息</a></li>
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
   <div class="s_cart"><a href="user_order.jsp">我的购物车</a>
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
<!--发货管理样式-->
<div class="Inside_pages clearfix">
<div class="left_style">
  <!--列表-->
  <div class="menu_style">
   <ul class="menu_list">
    <li ><em></em><a href="店铺专区.jsp">店铺专区</a></li>
    <li><em></em><a href="settings/seller/selectcheckproduct.do?sid=${seller.sid}">商品专区</a></li>
    <li><em></em><a href="settings/seller/sellerorder.do?sid=${seller.sid}">订单专区</a></li>
    <li class="on"><em></em><a href="javascript:void(0)">发货管理</a></li>
    <li><em></em><a href="收款账号.jsp">收款账户</a></li>

   </ul>
  </div>
</div>
<div class="right_style">
  <!--内容详细-->
   <div class="title_style"><em></em>发货管理</div>
   <div class="content_style">
     <!--发货管理-->
     <div class="Delivery_style">
       <div class="hd">
        <ul>
         <li>发货地址</li>
         <li>运费模板</li>
        </ul>
       </div>
       <div class="bd">
        <ul>
          <div class="add_address_style">

           <div class="Note"><b>添加新地址：</b>电话号码、手机号码选择一项，公司和备注为选填项，其他为必填项。</div>
            <table cellpadding="0" cellspacing="0" width="100%" class="add_content">
               <!-- <form action=""> -->
             <tr>
              <td class="label">联&nbsp;&nbsp;系&nbsp;人：<i>*</i></td>
              <td><input id="consignee" name="" type="text"  class="addtext"/></td> </tr>
             <tr> <td class="label">所在地区：<i>*</i></td><td><input id="area" name="" type="text"  class="addtext"  style="width:300px"/></td></tr>
             <tr><td class="label">街道地址：<i>*</i></td><td><input id="streetaddress" name="" type="text"  class="addtext"  style="width:300px"/></td></tr>
             <tr><td class="label">邮政编码：<i>*</i></td><td><input id="postcode" name="" type="text"  class="addtext"/></td></tr>
             <tr><td class="label">手机号码：<i>*</i></td><td><input id="phone" name="" type="text"  class="addtext"/></td></tr>
             <tr><td class="label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td><td><textarea id="remarks" name="" cols="" rows=""></textarea></td></tr>
             <tr>
              <td colspan="2" class="center"> 
              <input  name="" type="button" value="保存设置" style="font-size: 15px" onclick="saveaddress()" />
            </td><!--save_addressbtn  -->
          </tr>
                <%--</form>--%>
            </table>
              <c:choose>
                  <c:when test="${sellerdeliverycount>=20}">
                      <div class="user_Remark">您以超过20个地址上限,将无法在保存地址,请删除后再保存地址</div>
                  </c:when>
                  <c:otherwise>
                      <div class="user_Remark">用来保存自己的发货，退货地址，用户最多只能添加20个地址。</div>
                  </c:otherwise>
              </c:choose>

             <table class="display_address">
             <thead>
              <tr class="label_name">
               <td class="label_0" width="60px">发货地址</td>
               <td class="label_2" width="60px">联系人</td>
               <td class="label_3" width="180px">所在地区</td>
               <td class="label_4" width="180px">街道地址</td>
               <td class="label_5" width="60px">邮政编码</td>
               <td class="label_6" width="100px">联系电话</td>
               <td class="label_8" width="100px">备注</td>
               <td class="label_9" width="100px">操作</td>
               </tr>
             </thead>
              
             <tbody>
              <c:forEach items="${sellerDeliveryList}" var="sdl">
              <tr>
                <td>
                  <label>
                    <input name="" type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0" />默认</label>
                  </td>
                  <td>${sdl.consignee}</td>
                  <td>${sdl.area}</td>
                  <td>${sdl.streetaddress}</td>
                  <td>${sdl.postcode}</td>
                  <td>${sdl.phone}</td>
                  <td>${sdl.remarks}</td>
                  <td><a href="#my-modal-box" onclick="updatedelivery('${sdl.id}','${seller.sid}','${sdl.consignee}','${sdl.area}','${sdl.streetaddress}','${sdl.postcode}','${sdl.phone}','${sdl.remarks}')">编辑</a><a href="settings/seller/deletedeliveryaddress.do?sid=${seller.sid}&id=${sdl.id}">删除</a>
                  </td>
                </tr>
              </c:forEach>
             </tbody>
             </table>
          </div>
        </ul>
         <!--运费模板-->
        <div class="Freight_template">
         <div class="add_yunfei">
           <div class="mb_prompt">你还没有创建任何模板，请点击下运费面创建模板。</div>
           <div class="yunfei_list">
             <table cellpadding="0" cellspacing="0" class="Case_list confirm_yunfei">
             <thead>
             <tr class="label_name "><td width="100px">运送方式</td><td width="500px">运送到</td><td width="100px">首件（个）</td><td width="100px">运费（元）</td><td width="100px">续件（个）</td><td width="100px">运费（元）</td></tr></thead>
             <tbody>
             <tr><td>顺丰快递</td><td>江苏，上海，浙江</td><td>1</td><td>0</td><td>1</td><td>0</td></tr>
            <tr><td>顺丰快递</td><td>四川，安徽，江西，广东，广西，山西，陕西，云南，湖南，湖北，河北，内蒙古，新疆</td><td>1</td><td>20</td><td>1</td><td>10</td></tr>
            </tbody>
             </table>           
           </div>
           <a  href="javascript:void (0)" class="AddTemplate_btn" id="test">新增运费模板</a><!--局部刷新显新增运费模板示文本-->
         <script type="text/javascript">
         //弹出一个iframe层
$('#test').on('click', function(){
    layer.open({
        type: 2,
        title: '新增运费模板',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['900px' , '650px'],
        content:'发货管理-运费模版.jsp'
    });
});
         </script>
         </div>
         <div class="Case_style">
          <div class="case_title"><h2 class="left">参考范例：</h2><span>（以下模板仅供参考）</span></div>
          <h4>你可以按照宝贝的数量设置模板，一般适用于比较轻的宝贝。</h4>
          <table class="Case_list" cellpadding="0" cellspacing="0" width="100%">
           <thead>
           <tr class="title_name"><td colspan="6">小物件模板副本</td></tr>
           <tr class="label_name "><td width="100px">运送方式</td><td width="500px">运送到</td><td width="100px">首件（个）</td><td width="100px">运费（元）</td><td width="100px">续件（个）</td><td width="100px">运费（元）</td></tr>
           </thead>
           <tbody>
            <tr><td>顺丰快递</td><td>江苏，上海，浙江</td><td>1</td><td>0</td><td>1</td><td>0</td></tr>
            <tr><td>顺丰快递</td><td>四川，安徽，江西，广东，广西，山西，陕西，云南，湖南，湖北，河北，内蒙古，新疆</td><td>1</td><td>20</td><td>1</td><td>10</td></tr>
           </tbody>
          </table>
         </div>
        </div>
        <ul>         
          </form>       
        </ul>
       </div>
     </div>
     <script type="text/javascript">jQuery(".Delivery_style").slide({trigger:"click"});</script>
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
<div id="my-modal-box" class="modalbox">

        <!-- 3. 模态框内容的跟节点，它通常是一个非透明的容器，用于展示具体内容 -->
        <div class="modalbox-dialog">

            <!-- 4. 模态框的关闭按钮，通常用于关闭模态框 -->
            <a href="#close" title="关闭" class="modalbox-close-btn">X</a>

          <!--    5. 你的自定义内容，纯文字、表单、提示信息等 -->
           <!--  <h2>ModalBox Tutorial</h2>
            <p>这是一个使用 HTML5 和 CSS3 构建的模态框</p>
            <p>你可以将它加入到 Web APP 中的许多交互中，如：登录/注册、操作反馈、提示信息等。</p> -->

             <table cellpadding="0" cellspacing="0" width="100%" class="add_content">
                 <form method="post" action="settings/seller/updatedeliveryaddress.do">
             <tr>
              <td class="label">联&nbsp;&nbsp;系&nbsp;人：<i>*</i></td>
              <td><input id="consignee2" name="consignee" type="text"  class="addtext"/></td>
             </tr>
             <tr> <td class="label">所在地区：<i>*</i></td><td><input id="area2" name="area" type="text"  class="addtext"  style="width:300px"/></td></tr>
             <tr><td class="label">街道地址：<i>*</i></td><td><input id="streetaddress2" name="streetaddress" type="text"  class="addtext"  style="width:300px"/></td></tr>
             <tr><td class="label">邮政编码：<i>*</i></td><td><input id="postcode2" name="postcode" type="text"  class="addtext"/></td></tr>
             <tr><td class="label">手机号码：<i>*</i></td><td><input id="phone2" name="phone" type="text"  class="addtext"/></td></tr>
             <tr><td class="label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td><td><textarea id="remarks2" name="remarks" cols="" rows="" style="border:0.5px solid;height: 250px;width: 400px;resize: none;"></textarea></td></tr>
                 <input id="id" name="id" type="hidden" value=""/>
                 <input id="sid" name="sid" type="hidden" value=""/>
             <tr>
              <td colspan="2" class="center"> 
              <input  name="" type="submit" value="保存设置" style="font-size: 15px" />
            </td><!--save_addressbtn  -->
            </tr>
                 </form>
            </table>

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
