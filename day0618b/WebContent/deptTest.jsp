<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		var inputArr = $("input");

		var loadDept = function() {
			$("#tb").empty();
			$.ajax({
				url : "ListDept",
				success : function(data) {
					var arr = eval("(" + data + ")");

					$.each(arr, function(i, d) {
						var tr = $("<tr></tr>");

						$.each(d, function(j, v) {
							var td = $("<td></td>").html(v);
							$(tr).append(td);
						});
						$("#tb").append(tr);

						$(tr).click(function() {

							var tds = $(this).find("td");
							$.each(inputArr, function(i, input) {
								$(inputArr[i]).val($(tds[i]).html());
							});

						});

					});
				}
			});
		}
		loadDept();

		$("#btnDelete").click(function() {

			var dno = $("#dno").val();

			$.ajax({
				url : "UpdateDept",
				data : {dno:dno,cmd:3},
				success : function(data) {
					var r = eval("(" + data + ")");
					if (r.result == "1") {
						loadDept();
					} else {
						alert("삭제에 실패하였습니다");
					}

				}
			});

		});

		$("#btnAdd").click(function() {

			var dno = $("#dno").val();
			var dname = $("#dname").val();
			var dloc = $("#dloc").val();

			$.ajax({
				url : "UpdateDept",
				data : {
					dno : dno,
					dname : dname,
					dloc : dloc,
					cmd : 1
				},
				success : function(data) {
					var r = eval("(" + data + ")");
					if (r.result == "1") {
						loadDept();
					} else {
						alert("추가에 실패하였습니다");
					}

				}
			});

		});

		$("#btnUpdate").click(function() {

			var dno = $("#dno").val();
			var dname = $("#dname").val();
			var dloc = $("#dloc").val();

			$.ajax({
				url : "UpdateDept",
				data : {
					dno : dno,
					dname : dname,
					dloc : dloc,
					cmd : 2
				},
				success : function(data) {
					var r = eval("(" + data + ")");
					if (r.result == "1") {
						loadDept();
					} else {
						alert("수정에 실패하였습니다");
					}

				}
			});

		});

	});
</script>
</head>
<body>
	부서번호 :
	<input type="text" name="dno" id="dno">
	<br> 부서이름 :
	<input type="text" name="dname" id="dname">
	<br> 부서위치 :
	<input type="text" name="dloc" id="dloc">
	<br>

	<button id="btnAdd">등록</button>
	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>
	<table>
		<thead>
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
		</thead>
		<tbody id="tb"></tbody>
	</table>
</body>
</html>