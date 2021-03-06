<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<table style="background: lime;">
	<tr style="background: red;">
		<td>
			<span>Q</span>
			<span>[${qnaDto.category}] ${qnaDto.subject}</span>
		</td>
	</tr>
	
	<tr>
		<td>작성자 : ${qnaDto.name}</td>
		<td>작성자 : ${qnaDto.created}</td>
	</tr>
	
	<tr>
		<td>${qnaDto.content}</td>
	</tr>
</table>

<c:if test="${not empty answerDto}">
	<table>
		<tr>
			<td>
				<span>A</span>
				<span>[RE] ${answerDto.subject}</span>
			</td>
		</tr>
		
		<tr>
			<td>담당자: ${answerDto.name}</td>
			<td>답변일자: ${answerDto.created}</td>
		</tr>
		
		<tr>
			<td>${answerDto.content}</td>
		</tr>
	</table>
</c:if>

<table>
	<tr>
		<td>
			이전글: 
			<c:if test="${not empty preReadDto}">
				<c:choose>
					<c:when test="${preReadDto.questionPrivate == 1}">
						<c:if test="${sessionScope.member.id == preReadDto.id || sessionScope.member.id == 'admin'}">
							<a href="javascript:articleBoard('${preReadDto.num}', '${pageNo}');">${preReadDto.subject}</a>
						</c:if>
						<c:if test="${sessionScope.member.id != preReadDto.id && sessionScope.member.id != 'admin'}">
							${preReadDto.subject}
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:articleBoard('${preReadDto.num}', '${pageNo}');">${preReadDto.subject}</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td>
			다음글: 
			<c:if test="${not empty nextReadDto}">
				<c:choose>
					<c:when test="${nextReadDto.questionPrivate == 1}">
						<c:if test="${sessionScope.member.id == nextReadDto.id || sessionScope.member.id == 'admin'}">
							<a href="javascript:articleBoard('${nextReadDto.num}', '${pageNo}');">${nextReadDto.subject}</a>
						</c:if>
						<c:if test="${sessionScope.member.id != nextReadDto.id && sessionScope.member.id != 'admin'}">
							${preReadDto.subject}
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="javascript:articleBoard('${nextReadDto.num}', '${pageNo}');">${nextReadDto.subject}</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
			<c:if test="${sessionScope.member.id == qnaDto.id}">
				<button type="button" onclick="updateForm('${qnaDto.num}', '${pageNo}');">질문수정</button>
			</c:if>
			<c:if test="${sessionScopt.member.id == questionDto.id || sessionScope.member.id == 'admin'}">
				<button type="button" onclick="deleteBoard('${qnaDto.num}', '${pageNo}', 'question');">질문삭제</button>
			</c:if>
			<c:if test="${sessionScope.member.id == 'admin' && empty answerDto}">
				<button type="button" onclick="replyForm('${qnaDto.num}', '${pageNo}');">답변</button>
			</c:if>
			<c:if test="${not empty answerDto and sessionScope.member.id == 'admin'}">
				<button type="button" onclick="updateForm('${answerDto.num}', '${pageNo}');">답변수정</button>
			</c:if>
			<c:if test="${not empty answerDto and sessionScope.member.id == 'admin'}">
				<button type="button" onclick="deleteBoard'${answerDto.num}', '${pageNo}', 'answer');">답변삭제</button>
			</c:if>
		</td>
		
		<td>
			<button type="button" onclick="listPage('${pageNo}')">리스트</button>
		</td>
	</tr>
</table>