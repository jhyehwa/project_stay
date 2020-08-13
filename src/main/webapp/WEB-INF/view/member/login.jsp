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
	function sendLogin() {
		var f = document.loginForm;
		
		f.action = "<%=cp%>/member/login";
		f.submit();
	}
</script>

<div class="container">
	<div class="body-container" style="width: 100%; height: 500px;">
		<div style="font-weight: bold; font-size: 25px; text-align: center; border-bottom: 1px solid black; margin-top: 50px; padding-bottom: 15px;">
			<span>로그인</span>
		</div>
		
		<div style="float: left; margin-top: 10px;">
			<div><img style="width: 600px; height: 600px;" src="../resource/images/login.jpg"></div>
		</div>
		
		<form name="loginForm" method="post">
			<table style="margin: 0 auto; margin-top: 150px; width: 400px;">
				<tr>
					<td style="width: 30%; height: 50px; text-align: center;">
						<label style="font-size: 20px;">아이디</label>
					</td>
					<td>
						<input type="text" name="id" style="height: 30px; margin-bottom: 5px; border: none; border-bottom: 1px solid black; width: 250px;">
					</td>
				</tr>
				<tr>
					<td style="height: 50px; text-align: center;">
						<label style="font-size: 20px;">비밀번호</label>
					</td>
					<td>
						<input type="text" name="pwd" style="height: 30px; margin-bottom: 5px; border: none; border-bottom: 1px solid black; width: 250px;">
					</td>
				</tr>
				<tr>
					<td style="padding-top: 20px; text-align: center;" colspan="2">
						<button type="button" onclick="sendLogin();" style="background: antiquewhite; border: none; height: 40px; width: 70%; border-radius: 30px; font-size: 18px;">로그인</button>
					</td>
				</tr>
			</table>
			
			<table style="width: 300px; margin: 0 auto; border-spacing: 0; border-collapse: none;">
				<tr>
					<td>
						<button type="button" onclick="javascript:location.href='<%=cp%>/member/member';" style="background: none; border: none; height: 40px; width: 100px; font-size: 15px; margin-top: 10px;">회원가입</button>
					</td>
					<td>
						<button type="button" onclick="sendLogin();" style="background: none; border: none; height: 40px; width: 100px; font-size: 15px; margin-top: 10px;">아이디 찾기</button>
					</td>
					<td>
						<button type="button" onclick="sendLogin();" style="background: none; border: none; height: 40px; width: 100px; font-size: 15px; margin-top: 10px;">비밀번호 찾기</button>
					</td>
				</tr>
			</table>
			
			<div style="width: 600px; float: left; margin-left: 50px;">
				<div style="font-size: 17px; text-align: center; color: red;">${message}</div>
			</div>
		</form>
	</div>
</div>