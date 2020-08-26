<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<table>
	<tr>
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
				<button type="button" style="width: 70px; height: 25px;" onclick="searchList();">검색</button>
			</form>
		</td>
		<td>
			<button type="button" style="width: 70px; height: 25px; margin-left: 625px;" onclick="insertForm();">글올리기</button>
		</td>
	</tr>
</table>

<table style="margin-top: 10px; background: lime; text-align: center;">
	<tr style="background: yellow;">
		<th style="width: 70px;">번호</th>
		<th style="width: 150px;">유형</th>
		<th style="width: 350px;">제목</th>
		<th style="width: 150px;">작성자</th>
		<th style="width: 150px;">문의일자</th>
		<th style="width: 150px;">처리결과</th>
	</tr>
	
	<c:forEach var = "dto" items="${list}">
		<tr>
			<td>${dto.listNum}</td>
			<td>${dto.category}</td>
			<td>
				<c:choose>
					<c:when test="${dto.questionPrivate == 1}">
						<c:if test="${sessionScope.member.id == dto.id || sessionScope.member.id == 'admin'}">
							<a href="javascript:articleQna('${dto.num}', '${pageNo}';)">${dto.subject}</a>
						</c:if>
						<c:if test="${sessionScope.memberid != dto.id && sessionScope.member.id != 'admin'}">${dto.subject}</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:articleQna('${dto.num}', '${pageNo}');">${dto.subject}</a>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${dto.name}</td>
			<td>${dto.created}</td>
			<td>${dto.isAnswer == 1 ? "답변완료" : "답변대기"}</td>
		<tr>
	</c:forEach>
</table>

<table style="margin: 0 auto;">
	<tr>
		<td>${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</td>
	</tr>
</table>

<table style="background: white;">
	<tr>
		<td>
			<button type="button" style="width: 70px; height: 25px;" onclick="reloadQna();">새로고침</button>
		</td>
	</tr>
</table>