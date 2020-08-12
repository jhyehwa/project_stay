<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">

<script type="text/javascript">
	function memberOk() {
		var f = document.memberForm;
		
		f.action = "<%=cp%>/member/${mode}";		
		f.submit();
	}
	

</script>

<div class="container">
	<div class="body-container" style="width: 100%; height: 500px;">
		<div style="font-weight: bold; font-size: 25px; text-align: center;">
			<h3>${mode == "member" ? "회원가입" : "회원정보수정"}</h3>
		</div>
	
		<div>
			<form name="memberForm" method="post" enctype="multipart/form-data">
				<div style="background: yellow; text-align: center; margin-top: 20px;">
					<div style="width: 150px; height: 150px; font-size: 50px; margin: 0 auto; background: lime; border-radius: 150px;">
						<img id="person" style="width: 50px; height: 50px;" src="../resource/images/person.png"><img src="">
					</div>
				</div>
				
				<table style="margin: 0 auto; margin-top: 20px; background: red;">						
					<tr>
						<td colspan="2"><input type="file" name="upload" id="select_img" style="height: 30px; margin-bottom: 5px;"></td>
					</tr>
					
					<tr>
						<td style="font-size: 20px;">아이디&nbsp;&nbsp;&nbsp; </td>
						<td><input type="text" name="id" value="${dto.id}" style="height: 30px; margin-bottom: 5px;"></td>
					</tr>
					<tr>
						<td style="font-size: 20px;">비밀번호</td>
						<td><input type="password" name="pwd" style="height: 30px; margin-bottom: 5px;"></td>
					</tr>
					<tr>
						<td style="font-size: 20px;">이름</td>
						<td><input type="text" name="name" value="${dto.name}" style="height: 30px;"></td>
					</tr>
					<tr>
						<td style="font-size: 20px;">전화번호</td>
						<td><input type="text" name="tel" value="${dto.tel}" style="height: 30px;"></td>
					</tr>
					<tr>
						<td style="font-size: 20px;">생년월일</td>
						<td><input type="date" name="birth" value="${dto.birth}" style="height: 30px;"></td>
					</tr>
					<tr>
						<td style="font-size: 20px;">주소</td>
						<td><input type="text" name="address" value="${dto.address}" style="height: 30px;"></td>
					</tr>
				</table>
				
				<table style="margin: 0 auto; margin-top: 20px;">
					<tr>
						<td>
							<button type="button" name="sendButton" onclick="memberOk();" style="color: white; background: #E87A54; border: none; height: 30px; width: 80px;">${mode == "member" ? "회원가입" : "정보수정"}</button>
							<button type="reset" style="background: #E87A54; border: none; height: 30px; color: white; width: 80px;">다시입력</button>
							<button type="button" onclick="javascript:location.href='<%=cp%>/';" style="color: white; background: #E87A54; border: none; height: 30px; width: 80px;">${mode == "member" ? "가입취소" : "수정취소"}</button>
						</td>
					</tr>
					<tr>
						<td>${message}</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>