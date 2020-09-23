<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<table>
	<tr>
		<td>${dataCount}개(${pageNo}/${total_page} 페이지)</td>
	</tr>
</table>

<table>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>첨부</td>
		<td>조회수</td>
	</tr>
	
	<c:forEach var="dto" items="${noticeList}">
		<tr>
			<td><span>공지</span></td>
			<td><a href="javascript:articleBoard('${dto.num}', '${pageNo}');">${dto.subject}</a></td>
			<td>${dto.name}</td>
			<td>${dto.created}</td>
			<td>
				<c:if test="${dto.fileCount > 0}">
					<a href="<%=cp%>/customer/notice/zipdownload?num=${dto.num}"></a>
				</c:if>
			</td>
			<td>${dto.hitCount}</td>
		</tr>
	</c:forEach>
	
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.listNum}</td>
			<td>
				<a href="javascript:articleBoard('${dto.num}', '${pageNo}');">${dto.subject}</a>
				<c:if test="${dto.gap < 1}">
					<img src="<%=cp%>/resource/images/new.gif">
				</c:if>
			</td>
			<td>${dto.name}</td>
			<td>${dto.created}</td>
			<td>
				<c:if test="${dto.fileCount > 0}">
					<a href="<%=cp%>/customer/notice/zipdownload?num=${dto.num}"></a>
				</c:if>
			</td>
			<td>${dto.hitCount}</td>
		</tr>
	</c:forEach>
</table>