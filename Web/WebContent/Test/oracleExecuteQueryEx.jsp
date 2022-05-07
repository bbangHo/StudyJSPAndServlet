<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//1. 드라이버 로드

try{
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 2. DB 연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "musthave", "1234");
	
		// 3. 쿼리문 작성
		String sql = "select id, pass, name, regidate from member";
		
		// 4. 쿼리 객체 생성
		Statement stmt = conn.createStatement();
		
		// 5. 쿼리 실행
		ResultSet rs = stmt.executeQuery(sql);
	
		while(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pass");
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%10s	%10s %10s %10s", id, pw, name, regidate) + "</br>");
		}
		
		conn.close();
		stmt.close();
		rs.close();
		
} catch (SQLException e) {
	out.println("사유: " + e.getMessage());
}
		
%>

</body>
</html>