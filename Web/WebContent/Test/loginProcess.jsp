<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JDBC.JDBConnect" %>

<%
	String UserID = request.getParameter("UserID");
	String UserPW = request.getParameter("UserPW");
	
	JDBConnect jdbc = new JDBConnect(application);
	jdbc.stmt = jdbc.con.createStatement();
	jdbc.rs = jdbc.stmt.executeQuery("SELECT * FROM member WHERE ID=" + "'" + UserID + "'" );
	jdbc.rs.next();
	
	
	if(jdbc.rs.getString("id").equals(UserID)) {
		System.out.println("id is correct");
		response.sendRedirect("loginPage.jsp");
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