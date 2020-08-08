<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<div class="header">
	<jsp:include page="/WEB-INF/view/layout/header.jsp" />
</div>
	
<div>
	<div>
		<!-- <div><img style="width: 100%;" src="../resource/images/introduce.jpg"></div> -->
		
		<div style="width: 1200px; margin: 0 auto;">
			<div style="font-size: 50px; font-weight: bold; margin-top: 50px;">누구나 예쁜 집에 살 수 있도록</div>
			<div style="margin-top: 30px; font-size: 20px;">우리는 원스톱 인테리어 플랫폼 ‘오늘의집’을 통해 집을 꾸미는 방식을 새롭게 정의합니다.</div>
			<div style="font-size: 20px;">이를 통해 누구나 쉽고 재미있게 자신의 공간을 만들어가는 문화가 널리 퍼지기를 꿈꿉니다.</div>
			
			<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
			<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
			<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
			<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
			<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
			
			<div style="margin-top: 50px;">
				<div style="width: 600px; float: left;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_one.jpg"></div>
				
				<div style="width: 600px; height: 700px; float: right;">
					<div style="margin-top: 120px; margin-left: 50px; font-size: 22px; font-weight: bold; color: #cccccc;">머무르다 홈페이지에 방문해 주셔서 감사합니다.</div>
					<div style="margin-top: 50px; margin-left: 50px; font-size: 17.5px; text-align: justify; margin-right: 50px;">머무르다는 1988년 설립되어 고객님들의 사랑을 받으며 국내 가구산업을 선도해온 종합가구 회사입니다.</div>
					<div style="margin-top: 50px; margin-left: 50px; font-size: 17.5px; text-align: justify; margin-right: 50px;">머무르다는 고객만족을 최우선으로 일류제품을 공급해 드리기 위해 차별화된 소재와 다양한 컬러로 머무르다만의 컨세브가구를 만들어 가는 회사입니다.또한 동서가구는 국내 제조 뿐만 아니라 다양한 제품을 수입, 수출하는 종합가구 브랜드로 시대에 맞는 새로운 종합물류 시스템을 구축함으로서 보다 저럼한 가격과 품질로 고객님들을 모시겠습니다.</div>
					<div style="margin-top: 50px; margin-left: 50px; font-size: 17.5px; text-align: justify; margin-right: 50px;">그리고 무엇보다 시대흐름에 맞춰 환경에 좋은 마감재와 자연소재를 사용 함으로서 고객님들께서 건강하고 안전한 생활을 영위할수 있도록 노력하는 회사가 되겠습니다.</div>
				</div>
				
				<div style="width: 600px; height: 700px; float: left;">
					<div style="margin-top: 120px; font-size: 22px; font-weight: bold; text-align: center;">머무르다 소개</div>
					<div style="margin-top: 50px; margin-left: 50px; font-size: 17.5px; text-align: justify; margin-right: 50px;">머무르다는 대부분의 시간을 집에서 보냅니다. 좋은 것인지 나쁜 것인지는 모르겠지만 어쨌든 정말 많은 시간을 집에서 보내지요. 게다가 2년마다 열심히 이사도 다닙니다. 좁고 제약이 많은 국내의 주거 상황에서 가구 선택이란 항상 고민이 되고, 조심스러운 일입니다. 저렴하지만 품질이 떨어져 금방 내버려야 하는 많은 가구들. 반복되는 선택들은 늘 아쉬웠고 가끔은 화도 났습니다.</div>
					<div style="margin-top: 50px; margin-left: 50px; font-size: 17.5px; text-align: justify; margin-right: 50px;">머무르다는 여기서 시작되었습니다. 나만의 공간에서 경험할 수 있는 현실 가능한 특별함. 카피 된 디자인이나 세일을 거듭하는 정체불명의 제품이 아닌, 나만의 보물상자에 담겨있는 듯한 가구들. 편안하고 아름다워야 할 여러분의 공간에 진짜로 필요한 마법. 매직볼트는 늘 그런 마법으로 가득 차 있길 바라며 이를 위해 다양하고 적극적인 시도를 하고 있습니다. 고객님의 가정에 평화와 행운이 깃들길 기도드리며, 아낌없는 성원과 격려 부탁드립니다. 감사합니다.</div>
				</div>
				
				<div style="width: 600px; float: right;"><img style="width: 600px; height: 700px;" src="../resource/images/introduce_two.jpg"></div>
				
				<div><img style="width: 1200px; height: 100px;" src="../resource/images/introduce_three.png"></div>
			</div>
			
			<div style="text-align: center;"><button type="button" style="height: 50px;">문의하기</button></div>
		</div>
	</div>
</div>