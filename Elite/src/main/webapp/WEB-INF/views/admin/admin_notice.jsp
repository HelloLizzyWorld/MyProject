<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당근마켓 -관리자</title>

<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/admin.css">
<link rel="stylesheet" type="text/css" 
	href="http://localhost:9000/daangn/resources/css/am-pagination.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:9000/daangn/resources/js/am-pagination.js"></script>
<script>


function openForm() {
	  document.getElementById("myModal").style.display = "block";
	}

function closeForm() {
  document.getElementById("myModal").style.display = "none";
}

window.onclick = function(event) {
  if (event.target == document.getElementById("myModal")) {
	  document.getElementById("myModal").style.display = "none";
	  document.getElementById("ampaginationsm").style.display = "block";
  }
}





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
	           $(location).attr('href', "http://localhost:9000/daangn/admin_notice.carrot?rpage="+e.page);
	
	    });

	$("#btn_pop_wirte").click(function(){
	
		/* $("#ampaginationsm").attr("style","display:none"); */
		
		if($("#admin_pop_title").val()==""){
			alert("제목을 입력해주세요.");
			$("#admin_pop_title").focus();
			return false;
		}else if($("#admin_pop_content1").val()==""){
			alert("내용을 입력해주세요.");
			$("#admin_pop_content1").focus();
			return false;
		}
		admin_write_modal_Form.submit();
	});
	
	//체크박스 
	$("#all").on('click',function(){
		var all_check = $("#all").is(":checked");
		if(all_check){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	}); 
	//체크박스 삭제
	$("#admintDelete").on('click',function(){
		
		 var choice = confirm("정말로 삭제하시겠습니까?");
		
		if(choice){
			var chkList=new Array();
			
			$("input[type=checkbox]:checked").each(function(i){
				if($(this).val() !="all"){
					chkList[i] =$(this).val();
				}
			});
			
			$(location).attr("href","admin_notice_check_delete.carrot?chkList="+chkList);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		} 
	});
	
	$("#myBtn").click(function(){
		
		$("#ampaginationsm").attr("style","display:none");
	});
	$(".close").click(function(){
		$("#ampaginationsm").attr("style","display:block");
	});
	

});

</script>

</head>

<body>
	<%-- <c:import url="http://localhost:9000/daangn/header.carrot" /> --%>
	<div class="admin">
		<div class="admin_h2">
			<h2 id="admin_span_member">관리자 페이지</h2>
			<div class="admin_line_member"></div>
		</div>

		<br>
		<div>
		<span class="tit_sub">공지사항</span>
		
				 <button type="button" class="admin_write" id="myBtn" onclick="openForm()" >글쓰기</button>
				 <button type="button" class="admin_write" id="admintDelete">삭제하기</button>
				
			<div class="admin_write_pop" id="myModal">

				<div class="modal-content">
					<span class="close" onclick="closeForm()">&times;</span>
					<form action="admin_notice_write_proc.carrot"
						name="admin_write_modal_Form" method="post" class="admin_form_box" enctype="multipart/form-data">

						<h3>글쓰기</h3>
						<ul>
							<li><label for="title" class="admin_pop_tit">제목 </label> <input
								type="text" name="ntitle" class="admin_tit_input"
								id="admin_pop_title"></li>

							<li><label for="content" class="admin_pop_content"
								id="admin_pop_content">내용</label> 
								<textarea class="admin_pop_content_textarea" id="admin_pop_content1" name="ncontent"></textarea></li>

							<li><label>파일</label> <input type="file"
								class="admin_pop_file" name="file1" id="nfile"></li>

							<li class="admin_pop_btn">
								<button type="submit" class="btn_admin_write_pop"
									id="btn_pop_wirte">등록</button>
								<button type="button" id="btn_admin_cancel_pop" onclick="closeForm()" class="close">취소</button>
							</li>
						</ul>
					</form>
				</div>
			</div>

			<table class="admin_notice_table">
				<tr class="admin_notice_tr">
					<th><input type="checkbox" name="ntotal" id="all" value="all">
					</th>
					<th class="admin_notice_no">번호</th>
					<th >제목</th>
					<th >날짜</th>


				</tr>
				<c:forEach var="vo" items="${list}">
				<tr class="admin_notice_tr">
					<td><input type="checkbox" name="ntotal" id="part" value="${vo.nid}">
					</td>
					<td>${vo.rno }</td>
					<td><a href="http://localhost:9000/daangn/admin_notice_content.carrot?nid=${vo.nid}&rno=${vo.rno}&rpage=${rpage}" id="admin_notice_name">${vo.ntitle }</a></td>
					<td>${vo.ndate }</td>
					
				</tr>
				</c:forEach>
				

			</table>
			<div id="ampaginationsm"></div>
		</div>

		
		<div class="admin_notice_div">
			<a href="http://localhost:9000/daangn/admin.carrot"><button
					type="button" id="admin_notice_btn1">이전 페이지</button></a> <a
				href="http://localhost:9000/daangn/index.carrot"><button
					type="button" id="admin_notice_btn2">홈으로</button></a>
		</div>
	</div>
	<%-- <c:import url="http://localhost:9000/daangn/footer.carrot" /> --%>

</body>
</html>