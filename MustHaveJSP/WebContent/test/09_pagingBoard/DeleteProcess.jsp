<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
	BoardDAO dao = new BoardDAO(application);
	String num = request.getParameter("num");
	dao.deleteBoard(num);		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>