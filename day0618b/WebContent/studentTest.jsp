<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		var inputArr = $("input");

		var loadStudent = function() {

			$.ajax({
				url : "listStudent.do",
				success : function(data) {
					$("#tb").empty();
					var arr = eval("(" + data + ")");

					$.each(arr, function(i, s) {
						var tot = eval(s.kor) + eval(s.eng) + eval(s.math);
						var avg = tot / 3;
						var tr = $("<tr></tr>");
						$.each(s, function(j, v) {
							$("<td></td").html(v).appendTo($(tr));

						});
						$("<td></td>").html(tot).appendTo($(tr));
						$("<td></td>").html(avg).appendTo($(tr));
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

		loadStudent();

		$("#btnDelete").click(function() {

			var no = $("#no").val();
			$.ajax({
				url : "UpdateStudent",
				data : {no:no,cmd:3},
				success : function(data) {
					var r = eval("(" + data + ")");

					if (r.result == "1") {
						loadStudent();
					} else {
						alert("삭제에 실패하였습니다");
					}

				}

			});
		});

		$("#btnAdd").click(function() {
			var no = $("#no").val();
			var name = $("#name").val();
			var kor = $("#kor").val();
			var eng = $("#eng").val();
			var math = $("#math").val();

			$.ajax({
				url : "UpdateStudent",
				data : {
					no : no,
					name : name,
					kor : kor,
					eng : eng,
					math : math,
					cmd : 1
				},
				success : function(data) {
					var r = eval("(" + data + ")");

					if (r.result == "1") {
						loadStudent();
					} else {
						alert("추가에 실패하였습니다");
					}
				}
			});

		});

		$("#btnUpdate").click(function() {
			var no = $("#no").val();
			var name = $("#name").val();
			var kor = $("#kor").val();
			var eng = $("#eng").val();
			var math = $("#math").val();

			$.ajax({

				url : "UpdateStudent",
				data : {
					no : no,
					name : name,
					kor : kor,
					eng : eng,
					math : math,
					cmd : 2
				},
				success : function(data) {
					var r = eval("(" + data + ")");

					if (r.result == "1") {
						loadStudent();
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
	<form action="" method="post">
		번호 : <input type="text" name="no" id="no"><br> 이름 : <input
			type="text" name="name" id="name"><br> 국어 : <input
			type="text" name="kor" id="kor"><br> 영어 : <input
			type="text" name="eng" id="eng"><br> 수학 : <input
			type="text" name="math" id="math"><br>
	</form>
	<button id="btnAdd">등록</button>
	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>


	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>총점</th>
					<th>평균</th>
				</tr>
			</thead>
			<tbody id="tb"></tbody>
		</table>
	</div>
</body>
</html>