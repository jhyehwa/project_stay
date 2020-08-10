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
	width: 50px;
	height: 50px;
}
</style>

<%-- 
<div>
	<img src="<%=cp%>/resource/images/furniture.jpg" width="100%" height="500px;">
</div>
--%>

<div style="width: 100%; margin: 10px auto; text-align: center;">
	<h3>스토어</h3>
	<c:forEach var="dto" items="${categoryList}">
		<span> 
			<a>
			<img
				src="<%=cp%>/resource/category/funiture.png" class="categoryImg"><br>
				${dto.categoryName}
			</a>
		</span>
	</c:forEach>
</div>
