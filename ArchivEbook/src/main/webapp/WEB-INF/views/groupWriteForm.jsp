<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
</head>
<body>
	<form method="post" action="write">
	<input type="hidden" id="groupBoard" value="${board.groupnum}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"><br>
				<br></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="30" cols="50" name="content" id="content"></textarea><br>
				<br></td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>