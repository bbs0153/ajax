<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnOk").onclick = function() {
			var request = new XMLHttpRequest();
			request.open("GET", "hello.jsp", false);
			request.send();
			
			document.getElementById("msg").innerHTML = request.responseText;
		}
	}
</script>
</head>
<body>
	<button id="btnOk">Ajax통신</button>
	<hr>
	<h2>Ajax 통신 재미있어요!!!!</h2>
	<h3 id="msg"></h3>
</body>
</html>