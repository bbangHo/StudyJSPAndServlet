<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.*" %>

 <%
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	request.setCharacterEncoding("utf-8"); 
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	dto.setId((String)session.getAttribute("UserId"));
	
	dao.writeView(dto);
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