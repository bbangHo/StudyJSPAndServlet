<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success login page</title>
</head>
<body>
	<h1>로그인 처리 페이지</h1>
	<%
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String check = request.getParameter("chkBox");

	if (id.equals("test") && pw.equals("1234")) {
		if(check != null && check.equals("on")){
			Cookie cookie = new Cookie(id, pw);
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(300);
			response.addCookie(cookie);
		} else {
			(new Cookie(id, pw)).setMaxAge(0);
		}
	%>
	<script>alert("로그인 성공");</script>
	<%
	} else {
	%>
	<script>alert("로그인 실패");
		history.back();
	</script>
	<% }
	%>

</body>
</html>