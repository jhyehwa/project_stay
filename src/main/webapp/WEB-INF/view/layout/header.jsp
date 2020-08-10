<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="header-top">
	<div class="header-left">
		<p>
			<a href="<%=cp%>/">
				<span style="font-size: xx-large; padding-left: 50%;">&nbsp;Furniture</span>
			</a> 
		</p>
	</div>
	
	<div class="header-right">
		<div>
			<a href="<%=cp%>/introduce/introduce">소개</a>
			<a href="#">브랜드 소식</a>
			<a href="#">상점</a>
			<c:if test="${empty sessionScope.member}">
				<a href="<%=cp%>/member/login">로그인</a>
			</c:if>
			
			<c:if test="${not empty sessionScope.member}">
				<a href="#">장바구니</a>
				<span><a href="<%=cp%>/member/pwd" style="color: purple;">${sessionScope.member.name}님</a></span>
                    |&nbsp;
                    <a href="<%=cp%>/member/logout">로그아웃</a>
					<c:if test="${sessionScope.member.id == 'admin'}">
                    	&nbsp;|&nbsp;
                    	<a href="<%=cp%>/admin">관리자</a>
                    </c:if>
				
			</c:if>
		</div>
	</div>
</div>
