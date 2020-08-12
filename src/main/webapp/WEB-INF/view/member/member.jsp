<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
	// 회원가입 유효성 검사
	function memberOk() {
		var f = document.memberForm;
		
		f.action = "<%=cp%>/member/${mode}";		
		f.submit();
	}
	
	// 아이디 중복체크
	function idCheck() {
	var str = $("#id").val();
	str = str.trim();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#id").focus();
		return;
	}
	
	var url="<%=cp%>/member/idCheck";
		var q = "id=" + str;

		$.ajax({
			type : "post",
			url : url,
			data : q,
			dataType : "json",
			success : function(data) {
				var p = data.passed;
				if (p == "true") {
					var s = "<span style='color:blue;font-weight:bold;'>" + str + "</span> 아이디는 사용 가능합니다.";
					$("#id").parent().next(".help-block").html(s);
				} else {
					var s = "<span style='color:red;font-weight:bold;'>" + str + "</span> 아이디는 사용할 수 없습니다.";
					$("#id").parent().next(".help-block").html(s);
					$("#id").val("");
					$("#id").focus();
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}
	
	$(document).ready(function() {
		$('input[type=file]').on('change', function() {
			if (window.FileReader) {
				var filename = this.value;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('#getfile').text(filename);
		});
	});
</script>

<div class="body-container" style="width: 100%; height: 500px; background: fuchsia;">
	<div style="font-weight: bold; font-size: 25px; text-align: center; border-bottom: 1px solid black; padding-bottom: 15px;">
		<h3>${mode == "member" ? "회원가입" : "회원정보수정"}</h3>
	</div>
	
	<div style="background: gray; width: 1000px; margin: 0 auto;">
		<form name="memberForm" method="post" enctype="multipart/form-data">
			<div style="background: yellow; text-align: center; margin-top: 20px; float: left; width: 250px; height: 250px; margin-left: 20px;">
				<div id="image_preview" style="width: 200px; height: 200px; font-size: 50px; margin: 0 auto; background: lime;">
					<img id="preview" style="width: 180px; height: 180px; margin-top: 10px; margin-bottom: 10px;" src="../resource/images/person.png">
				</div>
				<input type="file" name="upload" id="getfile" accept="image/*" style="margin-bottom: 5px; background: blue; margin-top: 10px;">
			</div>
			
			<table style="margin: 0 auto; padding-top: 20px; background: red; width: 600px; height: 300px;">						
				<tr>
					<td style="font-size: 20px;">아이디&nbsp;&nbsp;&nbsp; </td>
					<td><p><input type="text" name="id" id="id" value="${dto.id}" onchange="idCheck();" style="height: 30px; margin-bottom: 5px;" ${mode == "update" ? "readonly = 'readonly'" : ""} maxlength="15"></p>
					<p class="help-block">???</p></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">비밀번호</td>
					<td><input type="password" name="pwd" style="height: 30px; margin-bottom: 5px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">비밀번호 확인</td>
					<td><input type="password" name="pwdCheck" style="height: 30px; margin-bottom: 5px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">이름</td>
					<td><input type="text" name="name" value="${dto.name}" style="height: 30px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">생년월일</td>
					<td><input type="date" name="birth" value="${dto.birth}" style="height: 30px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">전화번호</td>
					<td><input type="text" name="tel" value="${dto.tel}" style="height: 30px;"></td>
				</tr>
				<tr>
					<td style="font-size: 20px;">우편번호</td>
					<td>
						<input type="text" name="zipAddress" id="zipAddress" value="${dto.zipAddress}" readonly="readonly">
						<button type="button" onclick="daumPostcode();">우편번호</button>
					</td>
				</tr>
				<tr>
					<td style="font-size: 20px;">주소</td>
					<td>
						<input type="text" name="address1" id="address1" value="${dto.address1}" style="height: 30px;">
						<input type="text" name="address2" id="address2" value="${dto.address2}" style="height: 30px;">
					</td>
				</tr>
				
				<c:if test="${mode == 'member'}">
					<tr>
						<td style="font-size: 20px;">약관동의</td>
						<td style="font-size: 15px;"><input type="checkbox" name="agree" checked="checked" onchange="form.sendButton.disabled = !checked"><a href="#">이용약관</a>에 동의합니다.</td>
					</tr>
				</c:if>
			</table>
			
			<script type="text/javascript">
				var file = document.querySelector('#getfile');

				file.onchange = function () {
				    var fileList = file.files ;

				    // 읽기
				    var reader = new FileReader();
				    reader.readAsDataURL(fileList [0]);

				    //로드 한 후
				    reader.onload = function  () {
				        document.querySelector('#preview').src = reader.result ;
				    };
				};
			</script>
			
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
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('zipAddress').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('address1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('address2').focus();
				}
			}).open();
		}
	</script>
</div>