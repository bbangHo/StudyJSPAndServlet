<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="javax.lang.model.element.ModuleElement.DirectiveVisitor"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exercise JDBC</title>
</head>
<body>
	<h1>JDBC 연습</h1>
	<%
	//드라이브 연결
	Class.forName("oracle.jdbc.OracleDriver");
	
	//DB 연결
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "musthave", "1234");
	
	//쿼리 객체 생성
	Statement stmt = conn.createStatement();
	
	//SQL문 실행
	int tmp = stmt.executeUpdate("insert into member values('ex1234', 'testId1234', '1234', 'sysdate')");

	//
	ResultSet rs = stmt.executeQuery("select from * member");
	
	rs.close();
	conn.close();
	stmt.close();
	%>
</body>
</html>