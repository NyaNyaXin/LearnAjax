<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 
1.获取当前页面的所有的a节点，并为每一个a节点都添加onclick响应函数，同时取消其默认行为
2.准备发送Ajax请求：url(a节点的href属性值);args(时间戳)
3.响应为一个Json对象，包括bookName,totalBookNumber,totalMoney
4.把对应的属性添加到对应的位置
 -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.7.2.js"></script>
 <script type="text/javascript">
 	
	$(function () {
		var isHasCart = "${sessionScope.sc==null}";
		//alert(isHasCart);
		if(isHasCart=="true"){
			$("#carstatus").hide();
		}else{
			$("#carstatus").show();
			$("#bookName").text("${sessionScope.sc.bookName}");
			$("#totalBookNumber").text("${sessionScope.sc.totalBookNumber}");
			$("#totalMoney").text("${sessionScope.sc.totalMoney}");
		}
		$("a").click(function () {
			$("#carstatus").show();
			var url = this.href;
			var args = {"time":new Date()};
			$.getJSON(url,args,function(data){
				$("#bookName").text(data.bookName);
				$("#totalBookNumber").text(data.totalBookNumber);
				$("#totalMoney").text(data.totalMoney);
			});
			return false;
		});
	})
 </script>
<body>
	<div id="carstatus">
	            您已将&nbsp;
		<span id="bookName"></span>&nbsp;加入到购物车中，购物车中的书有&nbsp;
		<span id="totalBookNumber"></span>&nbsp;本，总价格&nbsp;
		<span id="totalMoney"></span>&nbsp;钱。
	</div>
	<br />  
	Java：&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/addToCart?id=Java&price=100">加入购物车</a>
	<br /> 
	Oracle：&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/addToCart?id=Oracle&price=200">加入购物车</a>
	<br /> 
	Struts2：&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/addToCart?id=Struts2&price=100">加入购物车</a>
	<br />
</body>
</html>