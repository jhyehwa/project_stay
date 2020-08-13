<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.categoryImg {
	border-radius: 10px;
	width: 80px;
	height: 80px;
}

td{
	width: 300px; 
	height: 300px;
	padding: 5px 10px;
}

td img{
	width: 250px; 
	height: 250px;
}
</style>

<%-- 
<div>
	<img src="<%=cp%>/resource/images/furniture.jpg" width="100%" height="500px;">
</div>
--%>

<div style="width: 100%; margin: 50px auto; text-align: center;">
	<h3 style="margin: 10px auto;">스토어</h3>
	<c:forEach var="dto" items="${categoryList}">
		<span> 
			<a style="display: inline-block; margin-right: 10px;">
			<img
				src="<%=cp%>/resource/category/${dto.saveFileName}" class="categoryImg"><br>
				${dto.categoryName}
			</a>
		</span>
	</c:forEach>
</div>

<div  style="width: 100%; margin: 50px auto; text-align: center;">
	<table>
		<tr style="width: 100%; height: 300px; padding: 0px auto;">
			<td>
				<img src="<%=cp%>/resource/images/furniture.jpg">
				<p>화분</p>
				<p>\35000</p>
			</td>
			<td>
				<img src="<%=cp%>/resource/images/furniture.jpg">
				<p>화분</p>
				<p>\35000</p>
			</td>
			<td>
				<img src="<%=cp%>/resource/images/furniture.jpg">
				<p>화분</p>
				<p>\35000</p>
			</td>
			<td>
				<img src="<%=cp%>/resource/images/furniture.jpg">
				<p>화분</p>
				<p>\35000</p>
			</td>
		</tr>
	</table>
</div>

<div>
	<button style="float: right;">상품 등록하기</button>
</div>



