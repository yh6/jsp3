<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=root%>/js/jquery-3.2.1.js"></script>
<title>회원가입</title>
</head>
<script>
$(document).ready(function(){
	$("#btnSign").click(function(){
				
	var hobby =	$("input[name=hobby]:checked").map(function(){
		return this.value
	});
	var param = {hobby:hobby.toArray()};
	
	var eles = $("input[name][type!=checkbox]");
	for(var i=0;i<eles.length;i++){
		var obj = eles[i];
		param[obj.name] = obj.value;
	}
	param = "param=" + JSON.stringify(param);
		$.ajax({
			url:"<%=root%>
	/user/signin_ok.jsp",
				type : "post",
				data : param,
				success : function(res) {
					try {
						var res = JSON.parse(res);
						alert(res);
						alert(res.name);
					} catch (e) {
						alert(e);
					}
				},
				error : function(xhr) {
					$("#errorCode").html(xhr.responseText);
				}
			})
		})
	});
</script>
<body>
	<div id="errorCode"></div>
	<form action="<%=root%>/user/signin_ok.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2" align="center">회원가입</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><label for="sleep">수면</label> <input type="checkbox"
					name="hobby" value="수면"> 음악<input type="checkbox"
					name="hobby" value="음악"> 영화<input type="checkbox"
					name="hobby" value="영화"> 게임<input type="checkbox"
					name="hobby" value="게임"> 요리<input type="checkbox"
					name="hobby" value="요리"> 여행<input type="checkbox"
					name="hobby" value="여행"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="폼전송">
					<input type="button" value="AJAX전송" id="btnSign"></td>
			</tr>
		</table>
		<input type="hidden" name="command" value="signin">
	</form>
</body>
</html>