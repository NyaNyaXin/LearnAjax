<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 
1.导入JQuery库
2.获取name="username"的节点：username
3.为username添加change响应函数
3.1获取username的value属性值，去除前后空格且不为空。准备发送Ajax请求
3.2发送Ajax请求，检验username是否可用
3.3在服务点直接返回一个HTML的片段：<font color="red">该用户名已被使用</font>
3.4在客户端浏览器把其直接添加到#message的html中。
 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function () {
		$(":input[name='username']").change(function () {
			var val = $(this).val();
			val = $.trim(val);
			if(val!=""){
				var url = "${pageContext.request.contextPath}/validateUserNameServlet";
				var args = {"username":val,"time":new Date()};

				$.post(url,args,function(data){
					$("#message").html(data);
				});
			}
		});
	})
</script>
</head>
<body>
	<form action="" method="post">
		Username:<input type="text" name="username" />
		<br/>
		<div id="message"></div>
		<br/>
		<input type="submit" value="Submit" />
	</form>
</body>
</html>