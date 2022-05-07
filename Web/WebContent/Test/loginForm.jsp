<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Login Page Construct</title>
<script type="text/javascript">
	function isNullCheck(form){
		if (!form.UserID.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.UserPW.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
	}
</script>
<body>
	<h2>start</h2>
	<form action="loginProcess.jsp" method="post"
		onsubmit="return isNullCheck(this);">
		<div align="center" style="width: 300px; height: 150px; border: 1px solid black;">
			아이디 : <input type="text" name="UserID" style="width: 130px; height: 30px"/><br><br>
			패스워드 : <input type="password" name="UserPW" style="width: 130px; height: 30px" /> <br><br>
			<input type="submit" value="로그인" style="width: 150px; height: 30px;" />
		</div>
	</from>
</body>
</html>