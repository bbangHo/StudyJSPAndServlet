<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h1>로그인 페이지</h1>

	<%
	String loginId = "";
	String checkBox = "";
	Cookie[] tmp = request.getCookies();
	if (tmp != null) {
		for (Cookie c : tmp) {
			if ((c.getName()).equals("test"))
		loginId = c.getName();
		}
	}
	
	if(!loginId.equals(""))
		checkBox = "on";
	%>
	<form method="post" action="./loginProcess.jsp">
		ID <input type="text" id ="userId" name="userId" value="<%=loginId %>"/>
		<input type="checkbox" id="chkBox" name="chkBox" checked="<%=checkBox %>"/>아이디 저장 <br>
		PW <input type="text" id="userPw" name="userPw"></input><br>
		<input type="submit" id="btn_login" name="btn_login" value="로그인"/></input>
	</form>
</body>
</html>