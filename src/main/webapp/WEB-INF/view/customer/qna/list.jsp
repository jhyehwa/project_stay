<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<table>
	<tr>
		<th>번호</th>
		<th>유형</th>
		<th>제목</th>
		<th>작성자</th>
		<th>문의일자</th>
		<th>처리결과</th>
	</tr>
	
	<c:forEach var = "dto" items="${list}">
		<tr>
			<td>${dto.listNum}</td>
			<td>${dto.category}</td>
			<td>${dto.name}</td>
			<td>${dto.created}</td>
			<td>${dto.isAnswer == 1 ? "답변완료" : "답변대기"}</td>
		<tr>
	</c:forEach>
</table>