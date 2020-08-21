<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<table style="margin-top: 50px;">
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

<table>
	<tr>
		<td>${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</td>
	</tr>
</table>

<table>
	<tr>
		<td>
			<button type="button" onclick="reloadQna();">새로고침</button>
		</td>
		<td>
			<form name="searchForm" method="post">
				<select>
					<option>모두</option>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>작성일</option>
				</select>
				<input type="text">
				<button type="button" onclick="searchList();">검색</button>
			</form>
		</td>
		<td>
			<button type="button" onclick="insertForm();">글올리기</button>
		</td>
	</tr>
</table>