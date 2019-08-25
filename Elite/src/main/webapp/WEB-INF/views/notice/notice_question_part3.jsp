<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/notice.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/am-pagination.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:9000/daangn/resources/js/notice.js"></script>
<script src="http://localhost:9000/daangn/resources/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize:7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/daangn/notice_question_part3.carrot?rpage="+e.page);

	    });		
		
		$(".btn_notice_answer").click(function(){
			/* $("#answer_content_img").attr("src","");*/
			var aid = $(this).attr("id").substr(17,4);
			/* alert("이거 눌림ㅋ = "+aid); */
			$.ajax({
				url: "notice_check_answer.carrot",
				type: "get",
				data: "aid="+aid,
				dataType: "json",
				success:function(data){
					/* var jsonObj = JSON.parse(data); */
					var fileList = data.afile;
					var fileName;
					if(fileList != undefined){
						fileName = fileList.split(',',4);
					}
     				
					$("#answer_type").text(data.atype);
					$("#answer_title").text(data.atitle);
					$("#answer_content").text(data.acontent);
					if(data.afile != null){
						for(var i=0; i<fileName.length; i++){
							/* $("#answer_content_img").attr("src","http://localhost:9000/daangn/resources/upload/"+fileName[i]).css("display","block"); */
							$("#answer_content_td").append("<img id='answer_content_img' style = 'max-width:500px; max-height:300px;' src='http://localhost:9000/daangn/resources/upload/"+fileName[i]+"'><br/>");
						}
					}
					
					$("#answer_check").text(data.reply);
				}
			});
		});
		$("#btn_back_answer").click(function(){
			$("#answer_content_img").css("display","none");
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="notice_question_div">
			<!-- 상단 제목 -->
		<h2 class="notice_question_title">고객센터</h2>
		<!-- 내용 시작 -->
		<div class="notice_question_menu">
			<!-- 수평 메뉴 -->
			<div class="question_page">
				<div class="clicks">
					<a href="http://localhost:9000/daangn/notice_question_part1.carrot" class="click">자주 묻는 질문</a> 
					<a href="http://localhost:9000/daangn/notice_question_part2.carrot" class="click support">1:1 문의</a>
					<a href="http://localhost:9000/daangn/notice_question_part3.carrot" class="click active">문의 내역</a>
				</div>
			</div>
			<div class="question_contents"> 
				<div class="contents" id="notice_answer_div">
					<table class="notice_answer_table">
						<!-- <tr class="notice_answer_tr">
							<th>제목</th>
							<th>날짜</th>
							<th></th>
						</tr> -->
						<c:forEach var="vo" items="${ list }">
							<tr class="notice_answer_tr">
								<td>${ vo.atitle }</td>
								<td>${ vo.adate }</td>
								<td>
								<c:choose>
									<c:when test="${ vo.reply != null }">
										<button type="button" id="btn_notice_answer${ vo.aid }" class="btn_notice_answer" >답변확인</button>
									</c:when>
									<c:otherwise>
										<button type="button" id="btn_notice_answer${ vo.aid }" class="btn_notice_answer wait">답변대기</button>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
						<tr class="notice_total_answer">
							<td>
								<div id="ampaginationsm"></div>
							</td>
						</tr> 					
					</table>
					
					<table class="notice_answer_table2">
						<tr>
							<td>유형</td>
							<td id="answer_type"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td id="answer_title"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td id="answer_content_td"><p id="answer_content"></p></td>
						</tr>
						<tr>
							<td>답변</td>
							<td id="answer_check"></td>
						</tr>
						<tr>
							<td>
								<button type="button" id="btn_back_answer" class="btn_back_answer">이전페이지</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>