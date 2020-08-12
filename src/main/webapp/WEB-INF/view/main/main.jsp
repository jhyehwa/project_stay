<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() {
			rollingStart();
		}, 3000);//다음 이미지로 롤링 애니메이션 할 시간차

		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({
				left : -$bannerWidth + "px"
			}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html()	+ "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	});
</script>
	

<style type="text/css">
.banner {
	position: relative;
	width: 1200px;
	height: 500px;
	top: 50px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
	border-radius: 10px;
	z-index: -1;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 1200px;
	height: 500px;
	margin: 0;
	padding: 0;
}
</style>



<div class="container">
	<div class="body-container" style="width: 700px; margin-top: 10px;">
		<div class="banner">
				<ul>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner0.jpg"></li>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner1.jpg"></li>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner2.jpg"></li>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner3.jpg"></li>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner4.jpg"></li>
					<li><img style="width: 1200px; height: 500px;" src="<%=cp%>/resource/images/introduce_Banner5.jpg"></li>
				</ul>
		</div>
	</div>
	
	<div id="shopping">
		<table>
			<tr>
				<td rowspan="2">
					<div id="container-left">가구</div>
				</td>
				<td>
					<div id="container-up">상품</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="container-down">패브릭</div>
				</td>
			</tr>
		</table>
	
	</div>
	
	<div  id="rank">
		<span>인기상품</span>
	</div>
</div>
