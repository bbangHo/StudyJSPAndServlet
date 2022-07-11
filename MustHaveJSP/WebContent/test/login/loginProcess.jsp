<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="assistCh6.MemberDAO" %>
<%@ page import="assistCh6.MemberDTO" %>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(id, pw);
	
	System.out.println(dto.getId());
	System.out.println(dto.getPass());
	
	if(dto.getId() != null && dto.getPass() != null && dto.getId().equals(id) && dto.getPass().equals(pw)) {
		session.setAttribute("UserId", id);
		response.sendRedirect("../08_board/list.jsp");
	} else {
		request.setAttribute("errMsg", "아이디 또는 비밀번호가 다릅니다.");
		request.getRequestDispatcher("./loginPage.jsp").forward(request, response);
	}
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