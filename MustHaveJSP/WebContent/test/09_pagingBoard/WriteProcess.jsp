<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.*" %>

 <%
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	request.setCharacterEncoding("utf-8"); 
	//dto.setTitle(request.getParameter("title"));
	//dto.setContent(request.getParameter("content"));
	//dto.setId((String)session.getAttribute("UserId"));
	
	int r = 0;
	for(int i=0; i<100; i++){
		dto.setTitle("제목-" + i);
		dto.setContent("제목-" + i);
		dto.setId("musthave");
		dao.writeView(dto);
	}
 	
	//dao.writeView(dto);
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