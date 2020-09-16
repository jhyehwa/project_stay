<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
	$(function(){
		$("#tab-notice").addClass("active");
		listPage(1);
		
		$("ul.tabs li").click(function(){
			tab = $(this).attr("data-tab");
			
			$("ul.tabs li").each(function(){
				$(this).removeClass("active");
			});
			
			$("#tab-" + tab).addClass("active");
			
			reloadQna();
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
			processData : false,
			contentType : false,
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
	
	// 글 리스트 및 페이징 처리
	function listPage(page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/list";
		var query = "pageNo=" + page;
		var search = $('form[name=customerSearchForm]').serialize();
		
		query = query + "&" + search;
		
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector);
	}
	
	// 새로고침
	function reloadQna() {
		var f = document.customerSearchForm;
		f.condition.value = "all";
		f.keyword.value = "";
		
		listPage(1);
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

	// 글 등록, 수정, 답변등록
	function sendOk(mode, page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
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
		var query = new FormData(f);
		
		var fn = function(data) {
			var state = data.state;
			if(state == "false") {
				alert("게시물을 추가하지 못했습니다.");
			}
			
			if(page == undefined || page == "") {
				page = "1";
			}
			
			if(mode == "created" || mode == "reply") {
				reloadQna();
			} else {
				listPage(page);
			}
		};
		
		ajaxFileJSON(url, "post", query, fn);
	}
	
	// 글 보기
	function articleBoard(num, page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/article";
		var query = "num=" + num;
		var search = $('form[name=customerSearchForm]').serialize();
		
		query = query + "&pageNo=" + page + "&" + search;
		
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector);
	}
	
	// 글 수정
	function updateForm(num, page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/update";
		var query;
		
		if(tab == "board") {
			query = "boardNum=" + num;
		} else {
			query = "num=" + num;
		}
		
		query = query + "&pageNo=" + page;
		
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector);
	}
	
	// 글 삭제
	function deleteBoard(num, page, mode) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/delete";
		
		var query = "num=" + num;
		if (tab == "qna") {
			query += "&mode=" + mode;
		}
		
		if (! confirm("위 게시물을 삭제하시겠습니까?")) {
			return;
		}
		
		var fn = function(data) {
			listPage(page);
		};
		
		ajaxJSON(url, "post", query, fn);
	}
	
	// 글 답변
	function replyForm(num, page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		
		var url = "<%=cp%>/customer/"+tab+"/answer";
		var query = "num=" + num + "&pageNo=" + page;
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector);
	}
</script>

<div class="body-container" style="width: 100%; background: aqua; margin-top: 50px;">
	<div class="body-title" style="background: fuchsia; font-size: 23px;">
		<span>고객센터</span>
	</div>

	<div style="background: orange; width: 80%; margin: 0 auto;">
		<div style="background: blue;">
			<ul class="tabs" style="list-style: none; text-align: center; margin-top: 20px;">
				<li id="tab-notice" data-tab="notice" style="float: left; width: 100px; height: 40px; font-size: 18px; background: lime;">공지사항</li>
				<li id="tab-inquiry" data-tab="inquiry" style="float: left; width: 100px; height: 40px; font-size: 18px; background: purple;">1:1문의</li>
				<li id="tab-qna" data-tab="qna" style="float: left; width: 100px; height: 40px; font-size: 18px; background: red;">질문답변</li>
			</ul>
		</div>
		<div id="tab-content" style="clear: both; padding: 20px 10px 0px;"></div>
	</div>
</div>

<form name="customerSearchForm" action="" method="post">
	<input type="hidden" name="condition" value="all">
	<input type="hidden" name="keyword" value="">
</form>