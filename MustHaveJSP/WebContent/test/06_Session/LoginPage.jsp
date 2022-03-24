<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
	h4 {
		font-size: 1.2em;
		color: red;
	}
</style>
</head>
<body>
	<h3>로그인 페이지</h3>
	<h4>
	<%=
	request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")
	%>
	</h4>
	
	<% 
	if(session.getAttribute("user_id") == null) {
	%>
	
	<script>
		function isEmpty(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력해주세요");
				return false;
			}

			if (!form.user_pwd.value) {
				alert("비밀번호를 입력해주세요");
				return false;
			}

			return true;
		}
		-->
	</script>
	
	<div>
		<form action="LoginProcess.jsp" method="post" name="loginForm" onsubmit="return isEmpty(this);">  
			아이디:<input type="text" id="user_id" name="user_id"/><br>
			비밀번호:<input type="password" id="user_pwd" name="user_pwd"/><br>
			<input type="submit" name="btn" value="로그인하기"/>
		</form>
	</div>
	<%
	} else {
	%>
		<% out.println(session.getAttribute("user_id")); %> 님 로그인 하셨습니다.<br>
		<a href="Logout.jsp">로그아웃</a>
	<%
	}
	%>
	
	
</body>
</html>