<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errMsg = (String)request.getAttribute("errMsg");    
	if(errMsg == null)
		errMsg = "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	
	<form action="./loginProcess.jsp">
		<div> <%= errMsg %> </div>
		id <input type="text" name="id"><br>
		pw <input type="password" name="pw">
		<input type="submit" value="로그인">
	</form>	
	
	<script type="text/javascript">
		
	</script>	
		
	
</body>
</html>