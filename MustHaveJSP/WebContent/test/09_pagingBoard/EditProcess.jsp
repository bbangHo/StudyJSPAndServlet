<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	request.setCharacterEncoding("utf-8"); 
	dto.setNum(request.getParameter("num"));
	dto.setTitle(request.getParameter("title"));
	System.out.println(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	dao.editBoard(dto);
	dao.close();
	
	response.sendRedirect("./list.jsp");
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