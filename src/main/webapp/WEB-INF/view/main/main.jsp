<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="container">
	<div class="body-container" style="width: 700px; margin-top: 20px;">
		<img src="<%=cp%>/resource/images/main.jpg" id="mainImg">
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
