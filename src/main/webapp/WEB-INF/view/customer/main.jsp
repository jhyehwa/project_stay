<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	$(function(){
		$("ul.tabs li").click(function(){
			tab = $(this).attr("data-tab");
			
			$("ul.tabs li").each(function(){
				$(this).removeClass("active");
			});
			
			$("#tab-" + tab).addClass("active");
			
			reloadQna(1);
		});
	});
</script>

<div class="body-container" style="width: 800px;">
	<div class="body-title">
		<h3>고객센터</h3>
	</div>

	<div>
		<div style="clear: both;">
			<ul class="tabs">
				<li id="tab-notice" data-tab="notice">공지사항</li>
				<li id="tab-inquiry" data-tab="inquiry">1:1문의</li>
				<li id="tab-qna" data-tab="qna">질문답변</li>
			</ul>
		</div>
		<div id="tab-content" style="clear: both; padding: 20px 10px 0px;"></div>
	</div>
</div>

<form name="customerSearchForm" action="" method="post">
	<input type="hidden" name="condition" value="all">
	<input type="hidden" name="keyword" value="">
</form>

