<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<title>支付宝网站支付接口</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/layui.all.js"></script>
    <link id="layuicss-laydatecss" rel="stylesheet" href="<%=basePath%>js/css/modules/laydate/laydate.css" media="all">
    <link id="layuicss-skinlayercss" rel="stylesheet" href="<%=basePath%>js/css/modules/layer/default/layer.css" media="all">
    <link id="layuicss-skincodecss" rel="stylesheet" href="<%=basePath%>js/css/modules/code.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>js/css/layui.css">

    <link rel="stylesheet" href="<%=basePath%>css/public.css">
    <script src="<%=basePath%>js/common.js"></script>
    <script src="<%=basePath%>js/order/distpicker.data.js"></script>
    <script src="<%=basePath%>js/order/distpicker.js"></script>
    <link href="<%=basePath%>css/order/payment.css" rel="Stylesheet" />
</head>
    <style>
        *{
            margin:0;
            padding:0;
        }
        ul,ol{
            list-style:none;
        }
        body{
            font-family: "Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
        }
        .hidden{
            display:none;
        }
        .new-btn-login-sp{
            padding: 1px;
            display: inline-block;
            width: 75%;
        }
        .new-btn-login {
            background-color: #02aaf1;
            color: #FFFFFF;
            font-weight: bold;
            border: none;
            width: 100%;
            height: 30px;
            border-radius: 5px;
            font-size: 16px;
        }
        #main{
            width:100%;
            margin:0 auto;
            font-size:14px;
        }
        .red-star{
            color:#f00;
            width:10px;
            display:inline-block;
        }
        .null-star{
            color:#fff;
        }
        .content{
            margin-top:5px;
        }
        .content dt{
            width:100px;
            display:inline-block;
            float: left;
            margin-left: 20px;
            color: #666;
            font-size: 13px;
            margin-top: 8px;
        }
        .content dd{
            margin-left:120px;
            margin-bottom:5px;
        }
        .content dd input {
            width: 85%;
            height: 28px;
            border: 0;
            -webkit-border-radius: 0;
            -webkit-appearance: none;
        }
        #foot{
            margin-top:10px;
            position: absolute;
            bottom: 15px;
            width: 100%;
        }
        .foot-ul{
            width: 100%;
        }
        .foot-ul li {
            width: 100%;
            text-align:center;
            color: #666;
        }
        .note-help {
            color: #999999;
            font-size: 12px;
            line-height: 130%;
            margin-top: 5px;
            width: 100%;
            display: block;
        }
        #btn-dd{
            margin: 20px;
            text-align: center;
        }
        .foot-ul{
            width: 100%;
        }
        .one_line{
            display: block;
            height: 1px;
            border: 0;
            border-top: 1px solid #eeeeee;
            width: 100%;
            margin-left: 20px;
        }
    </style>
<body>
<!-- 页面顶部-->
<div id="header">
    <div class="header-wrap">
        <%--<a href="/goods/index" class="logo fl">
            <img src="" alt="">
            <h1></h1>
        </a>--%>
        <ul class="nav fl">
            <li><a href="/goods/index">首页</a></li>
        </ul>
        <div class="nav-right fr">
            <c:if test="${!empty cur_user}">
                <a href="/user/index" class="log-btn">
                    <img src="<%=basePath%>images/user/${cur_user.imgUrl}" class="user-header-image">${cur_user.username}</a>
                <a href="/user/logout" class="log-btn">退出</a>
            </c:if>
            <c:if test="${empty cur_user}">
                <a href="/user/toRegister" class="log-btn">注册</a>
                <a href="/user/toLogin" class="log-btn">登录</a>
            </c:if>
        </div>
    </div>
</div>
<div id="navlist" class="clearfix">
    <ul>
        <li class="navlist_gray_left"></li>
        <li class="navlist_gray">确认订单信息</li>
        <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas>
        </li>
        <li class="navlist_blue">支付订单<b></b></li>
        <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas>
        </li>
        <li class="navlist_gray">支付完成<b></b></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>
<div id="main">
        <form name=alipayment action='<%=basePath%>order/payresult' method=post target="_blank">
            <div class="pay_info" id="body" style="clear:left">
                <dl class="content">
                    <dt>商户订单号：</dt>
                    <dd>
                        <input id="pid" name="payId" value="${payId}" readonly />
                    </dd>
                    <hr class="one_line">
                    <dt>订单名称：</dt>
                    <dd>
                        <input id="aid" type="hidden" name="aid" value="${aid}">
                        <input id="gid" type="hidden" name="gid" value="${good.id}">
                        <input id="WIDsubject" name="goodName" value="${good.name}" readonly />
                    </dd>
                    <hr class="one_line">
                    <dt>付款金额：</dt>
                    <dd>
                        <input id="payment" name="goodPrice" value="${good.price}" readonly />
                        <span>收款方：${seller.username}</span>
                    </dd>
                    <hr class="one_line">
                    <dt></dt>
                    <dd id="btn-dd">
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                        <span class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。</span>
                    </dd>
                </dl>
            </div>
		</form>
        <div id="foot">
			<ul class="foot-ul">
				<li>
                    支付宝版权所有 2015-2018 ALIPAY.COM
				</li>
			</ul>
		</div>
    <div id="footer">
        <div class="go-to-top" style="left: 1515px; display: none;">
            <a href="#" title="回顶部" class="icon"></a>
        </div>
        <div class="footer-bottom-wrap">
            <div class="footer-bottom">
                <p class="tips">本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除</p>
                <p class="right">
                    <span>Copyright © 2017-2018,   All Rights Reserved   </span>　
                </p>
            </div>
        </div>
    </div>
	</div>
</body>
<script language="javascript">
	// function  payment() {
    //     var gid = $('#gid').val();
    //     var aid = $('#aid').val();
    //     var pid = $('#pid').val();
    //
    //     location="/order/payresult?gid="+gid+"&aid="+aid+"&payid="+payid;
    // }
</script>
</html>