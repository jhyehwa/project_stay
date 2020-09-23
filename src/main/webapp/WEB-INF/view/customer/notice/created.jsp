<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<form name="boardForm" method="post" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<td>제목</td>
				<td>
					<input type="checkbox" name="notice" value="1" ${dto.notice == 1 ? "checked='checked'" : ""}>
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${sessionScope.member.name}</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="12">${dto.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td>첨부</td>
				<td>
					<input type="file" name="upload">
				</td>
			</tr>
		</tbody>
		
		<c:if test="${mode == 'update'}">
			<c:forEach var="vo" items="${listFile}">
				<tr>
					<td>첨부된파일</td>
					<td>
						<a href="javascript:deleteFile('${vo.fileNum}');"></a>
						${vo.originalFileName}
					</td>
				</tr>
			</c:forEach>
		</c:if>
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
			</td>
		</tr>
	</table>
</form>