<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h1>[ 게시글 수정 ]</h1>
	<form method="post" action="groupUpdate">
		<input type="hidden" value="${updateBoard.bnum_group}" name="bnum_group">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title" value="${updateBoard.title}"><br>
				<br></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="30" cols="50" name="content" id="content">${updateBoard.content}</textarea><br>
				<br></td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>