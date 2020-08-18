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
	
	function ajaxJSON(url, type, query, fn) {
		$.ajax({
			type: type,
			url: url,
			data: query,
			dataType: "json",
			success: function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				if(jqXHR.status == 403) {
					login();
					return false;
				}
				console.log(jqXHR.responseText);
			}
		});
	}
	
	function ajaxHTML(url, type, query, selector) {
		$.ajax({
			type : type,
			url : url,
			data : query,
			success : function(data) {
				if ($.trim(data) == "error") {
					listPage(1);
					return false;
				}
				$(selector).html(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status == 403) {
					login();
					return false;
				}
				console.log(jqXHR.responseText);
			}
		});
	}
	
	function ajaxFileJSON(url, type, query, fn) {
		$.ajax({
			type : type,
			url : url,
			processData : false // file 전송시 필수
			,
			contentType : false // file 전송시 필수
			,
			data : query,
			dataType : "json",
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status == 403) {
					login();
					return false;
				}
				console.log(jqXHR.responseText);
			}
		});
	}
	
	// 글쓰기폼
	function insertForm() {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/created";
		var query = "tmp=" + new Date().getTime();
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector);
	}

	// 글 등록, 수정
	function sendOk(mode, page) {
		/* var tab = $tab.attr("data-tab"); */
		var f = document.qnaForm;
		var str = f.subject.value;
		if (!str) {
			alert("제목을 입력해주세요.");
			f.subject.focus();
			return;
		}

		str = f.content.value;
		if (!str) {
			alert("내용을 입력해주세요.");
			f.content.focus();
			return;
		}

		var url = "<%=cp%>/customer/"+tab+"/"+mode;
		var query = new FormDate(f);
		
		var fn = function(data) {
			var state = data.state;
			if(state == "false") {
				alert("게시물을 추가하지 못했습니다.");
			}
			
			if(page == undefined || page == "") {
				page = "1";
			}
			
			if(mode == "created") {
				reloadQna();
			} else {
				listPage(page);
			}
		};
		ajaxFileJSON(url, "post", query, fn);
	}
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

