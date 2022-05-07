<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String popupMode = "on";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업관리 ver 0.1</title>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
	팝업 페이지 테스트<br/>
	<%
		out.println("현재 팝업창은 " + popupMode + " 상태입니다. <br/>");

	 %>

	<div style="width: 300px; height: 100px; background-color: #ff8; border: 1px solid red;">
		<h2 align="center">팝업 창입니다.</h2>
		<div align="right" style="width: auto; height = 50px; background-color: #eee;">
			<input type="checkbox" id="checkBox" value="1"/> 하루동안 열지 않음
			<input type="button" value="닫기" id="closeBtn" style="width: 100px; height: 30px" />
		</div>
	</div>

</body>
</html>