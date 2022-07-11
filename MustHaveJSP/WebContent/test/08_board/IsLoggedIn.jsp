<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(session.getAttribute("UserId") == null) {
%>
	<script type="text/javascript">
		alert("로그인을 해주세요");
		location.href="../login/loginPage.jsp";
	</script>
<%		
	} 
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>