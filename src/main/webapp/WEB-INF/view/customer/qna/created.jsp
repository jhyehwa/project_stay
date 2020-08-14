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
					<select>
						<option></option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${sessionScope.member.name}</td>
			</tr>
			
			<tr>
				<td>공개여부</td>
				<td>
					<input type="radio" value="0">공개
					<input type="radio" value="1">비공개
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="12">${dto.content}</textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table>
		<tr>
			<td>
				<button type="button">${mode == 'update' ? '수정완료' : '등록하기'}</button>
				<button type="reset">다시입력</button>
				<button type="button">${mode == 'update' ? '수정취소' : '등록취소'}</button>
			</td>
		</tr>
	</table>
</form>