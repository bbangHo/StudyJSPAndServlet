<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Test</h1>
	<p>write!</p>
	<div id="container">
		<from action=""> 
		<input type="text" id="writeText" autofocus />
		<input type="button" id="textBtn" value="입력" onclick='textBtnClick(); ' autofocus /> </from>
	</div>
	<ul id="itemList" onclick='delThisLine();'></ul>
	
	
	<script>
		function textBtnClick() {
			var node_li = document.createElement("li"); //li node
			//var text = document.getElementById("writeText").value; //text node
			var text = document.querySelector("#writeText");
			var tmp = document.createTextNode(text.value);

			node_li.appendChild(tmp);
			//document.getElementById("itemList").appendChild(node_li);
			document.querySelector("#itemList").appendChild(node_li);

			writeText.value = "";
		}

		function delThisLine() {
			var parent = document.getElementById("itemList");
			var lnth = document.querySelectorAll("li");
			
			for(var i = 0; i < lnth.length; i++) {
				parent.removeChild(parent.childNodes[0]);
		}

		}
	</script>
</body>
</html>