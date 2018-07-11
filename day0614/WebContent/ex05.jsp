<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {

		document.getElementById("btnRead").onclick = function() {

			var request = new XMLHttpRequest();

			request.onreadystatechange = function() {

				if (request.readyState == 4) {

					if (request.status == 200) {
						document.getElementById("id").value = request.responseText;
					}

				}
			}

			request.open("get", "getMember.jsp", true);
			request.send();

		};
	}
</script>
</head>
<body>
	회원 ID :
	<input type="text" id="id">
	<button id="btnRead">Ajax통신하여 id 읽어오기</button>
	<hr>
	현재 자신의 생각을 쓰시오
	<br>
	<textarea rows="10" cols="60"></textarea>
</body>
</html>