<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="assistCh6.*" %>	<!--  MemberDAT&DTO import -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Process</title>
</head>
<body>

	<%
	// LoginPage에서 넘겨받은 id와 pw를 Get
	String user_id = request.getParameter("user_id");
	String user_pwd = request.getParameter("user_pwd");		
	
	// MemberDAO에 필요한 매개변수를 web.xml에서 Get
	String driver = getServletContext().getInitParameter("OracleDriver");  // == applocation.getInitParameter("OracleDriver");
	String url = getServletContext().getInitParameter("OracleURL");
	String id = getServletContext().getInitParameter("OracleId");
	String pw = getServletContext().getInitParameter("OraclePwd");
	
	// DB연결과 동시에 dto Get
	MemberDAO dao = new MemberDAO(driver, url, id, pw);
	
	// LoginPage에서 넘겨받은 id와 pw가 DB에 있는지, 있다면 가져와서 dto에 저장
	MemberDTO dto = dao.getMemberDTO(user_id, user_pwd);
	
	if(dto.getId() != null) {	// null이 아니면 DB에 값이 있다는 뜻 
		session.setAttribute("user_id", dto.getId());
		response.sendRedirect("LoginPage.jsp");
	} else { 
		request.setAttribute("LoginErrMsg", "아이디 또는 비밀번호가 틀립니다");
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	}
	
	%>
	
</body>
</html>