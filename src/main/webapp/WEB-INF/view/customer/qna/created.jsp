<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<form name="qnaForm" method="post" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<td>유형</td>
				<td>
					<select name="categoryNum" ${(mode == "update" && not empty dto.parent) || mode == "answer" ? "disabled = 'disabled'" : ""}>
						<c:forEach var = "vo" items="${listCategory}">
							<option value="${vo.categoryNum}" ${vo.categoryNum == dto.categoryNum ?" selected = 'selected'" : ""}>${vo.category}</option>
						</c:forEach>
						
						<c:if test="${(mode == 'update' && not empty dto.parent) || mode == 'answer'}">
							<input type="hidden" name="categoryNum" value="${dto.categoryNum}">
						</c:if>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="subject" value="${dto.subject}" ${(mode == "update" && not empty dto.parent) || mode == "answer" ? "readonly = 'readonly'" : ""}>
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${sessionScope.member.name}</td>
			</tr>
			
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" name="questionPrivate" value="0" ${empty dto || dto.questionPrivate == 0 ? "checked = 'checked'" : ""}>공개
					<input type="radio" name="questionPrivate" value="1" ${dto.questionPrivate == 1 ? "checked = 'checked'" : ""}>비공개
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="12">${dto.content}</textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table>
		<tr>
			<td>
				<button type="button" onclick="sendOk('${mode}', '${pageNo}');">${mode == 'update' ? '수정완료' : '등록하기'}</button>
				<button type="reset">다시입력</button>
				<button type="button" onclick="sendCancel('${pageNo}');">${mode == 'update' ? '수정취소' : '등록취소'}</button>
				<c:if test="${mode == 'update'}">
					<input type="hidden" name="num" value="${dto.num}">
					<input type="hidden" name="pageNo" value="${pageNo}">
				</c:if>
				<c:if test="${mode == 'answer'}">
					<input type="hidden" name="parent" value="${dto.num}">
					<input type="hidden" name="pageNo" value="${pageNo}">
				</c:if>
			</td>
		</tr>
	</table>
</form>