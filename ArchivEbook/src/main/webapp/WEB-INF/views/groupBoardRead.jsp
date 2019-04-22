<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<%-- <title>[ ${result.groupname} ]</title> --%>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	$('#groupUpdate').on('click', groupUpdateForm);
	$('#groupDelete').on('click', groupDelete);
});

function groupUpdateForm(){
	var num = $('#board').val();			
	location.href="groupUpdate?bnum_group="+num;	
}

function groupDelete(){
	var num = $('#board').val();				
	if(confirm('삭제하시겠습니까?')){			
		location.href="groupDelete?bnum_group="+num;
	}
}

function groupReplyDelete(num){
	if(confirm('삭제하시겠습니까?')){			
		location.href="groupReplyDelete?rnum_group="+num;
	}
}
</script>
</head>
<body>
	<h1>[ ${result.groupname} ]</h1>
	<input type="hidden" id="board" value="${result.bnum_group}">
	<table>
		<tr>
			<td class="title">제목</td>
			<td>${result.title}</td>
		</tr>
		<tr>
			<td class="title">작성일</td>
			<td>${result.inputdate}</td>
		</tr>
		<tr>
			<td class="title">내용</td>
			<td><pre>${result.content}</pre></td>
		</tr>
		<c:if test="${loginId == result.id}">
			<tr>
				<td colspan="2" class="center">
					<input type="button" value="수정" id="groupUpdate"> 
					<input type="button" value="삭제" id="groupDelete">
				</td>
			</tr>
		</c:if>
	</table>
	<br>
	<!-- 리플 작성 폼 시작 -->
	<c:if test="${sessionScope.loginId != null}">
		<form id="replyWrite" action="replyWrite" method="post">
			리플내용 <input type="hidden" name="bnum_group" id="bnum_group" value="${result.bnum_group}"> 
				 <input type="text" name="content" id="content" style="width: 500px;"> <input type="submit" value="확인">
		</form>
	</c:if>
		<table>
			<c:forEach var="reply" items="${replylist}">
				<tr>
					<th>번호 : ${reply.getRnum_group()}</th>
					<th>작성자 : ${reply.getId()}</th>
				</tr>
				<tr>
					<td colspan="3"><pre>${reply.getContent()}</pre></td>
					<%-- <c:if test="${loginId == reply.getId()"> --%>
					<td><input type="button" value="삭제" onClick="groupReplyDelete('${reply.rnum_group}')"></td>
					<%-- </c:if> --%>
				</tr>
			</c:forEach>
		</table>
	<!-- /리플 작성 폼 끝 -->	
</body>
</html>