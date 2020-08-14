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
	
</div>

<div  style="width: 100%; margin: 50px auto; text-align: center;">
	<table>
		<tr style="width: 100%; height: 300px; padding: 0px auto;">
			<td>
			
			</td>
		</tr>
	</table>
</div>

<div>
	<button style="float: right;" 
		onclick="javascript:location.href='<%=cp%>/store/created'">상품 등록하기</button>
</div>



