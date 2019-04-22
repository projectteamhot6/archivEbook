<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
/* 	$(document).ready(function() {
		$('#makeGroup').on('click', makeGroup);
	});

	function makeGroup() {
		var groupname = $('#groupname').val();
		var groupintroduce = $('#groupintroduce').val();
		$.ajax({
			url : 'makeGroup',
			type : 'POST',
			data : {
				groupname : groupname,
				groupintroduce : groupintroduce,
			},
			success : function() {
				win = window.close();
			},
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
	} */
</script>
</head>
<body>
	<h2>MAKEGROUPS</h2>
	<form method="post" action="makeGroup">
		<table>
			<tr>
				<td>그룹 이름</td>
				<td><input type="text" name="groupname" id="groupname"><br>
					<br></td>
			</tr>
			<tr>
				<td>그룹 소개</td>
				<td><textarea name="groupintroduce" id="groupintroduce"></textarea><br>
					<br></td>
			</tr>
			<tr>
				<td colspan="2" class="center">
				<input type="submit" id="makeGroup" value="생성">
				<!-- <input type="button" id="makeGroup" value="생성"> --></td>
			</tr>
		</table>
	</form>
</body>
</html>