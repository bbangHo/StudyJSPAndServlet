<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>asdassadasd</title>
</head>
<body>
	
	
	<div>
		<form action="LoginProcess.jsp" method="post" name="loginForm" onsubmit="return isEmpty();">  
			아이디:<input type="text" name="user_id"/><br>
			비밀번호:<input type="password" name="user_pwd"/><br>
			<input type="submit" name="btn" value="로그인하기"/>
		</form>
	</div>
	
	<script>
		function isEmpty() {	<!-- 빈칸 체크 -->
		alert(document.getElementById("uesr_id").value);
			if(document.getElementById("uesr_id").value == null){
				alert("다시 입력해주세요");
				return false;
			}
			
			if(document.getElementById("uesr_pwd").value == null){
				alert("다시 입력해주세요");
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>