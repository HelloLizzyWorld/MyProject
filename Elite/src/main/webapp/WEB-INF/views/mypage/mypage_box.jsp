<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 상단 박스</title>

<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/mypage.css">
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.btn_upload').click(function(e) {

			e.preventDefault();

			$('#mp_file').click();

		});
		$("input[type=file]").on('change', function() {
			if (window.FileReader) {
				var formData = new FormData();
				formData.append("file1", $(this)[0].files[0]);
				$.ajax({
					url : "mypage_profile_proc.carrot",
					type : "POST",
					data : formData,
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						$("#img_1").attr("src","http://localhost:9000/daangn/resources/upload/"+data);  
						}
				});
			}
		});

	});
</script>
<style>
#mp_file {
	display: none;
}
</style>
</head>
<body>
	<div class="one_box">
		<div class="two_box">
			<div id="mp_one_div">
			<c:choose>
				<c:when test="${vo2.mfile != null && vo2.mfile != ''}">
					<img src="http://localhost:9000/daangn/resources/upload/${ vo2.mfile}"
					id="img_1">
				</c:when>
				<c:otherwise>
					<img src="http://localhost:9000/daangn/resources/images/rabbit.svg"
					id="img_1">
				</c:otherwise>
			</c:choose>
			</div>
			
			<div class="mp_div_name">
				<span id="mp_span_name">${name } </span><span id="mp_span_nim">님</span><br>
				<span id="mp_span_add">${vo2.address }</span>
				<div class="mp_button">
					<a href="http://localhost:9000/daangn/product_write.carrot">
						<button class="btn btn-primary">물품등록</button>
					</a>
				</div>
			</div>
			<form method="POST" encType="multipart/form-data" id="profileForm">
				<input type="file" name="file1" id="mp_file">
				<input type="hidden" name="id" value="${id}">
				<button type="button" class="btn_upload">프로필</button>
			</form>
		</div>
		<div class="three_box">
			<table id="two_table">
				<tr>
					<td><img
						src="http://localhost:9000/daangn/resources/images/manner.jpg"
						id="img_2"></td>
				</tr>
			</table>
		</div>
		<div class="four_box">
				<c:choose>
					<c:when test="${vo2.scount!=null }">
						<a href="http://localhost:9000/daangn/mypage_sales.carrot"><span class="box_span_pro">판매내역</span><br>
						<span class="box_span_num">${vo2.scount }개 </span><span class="box_span_arr">></span></a>
					</c:when>
					<c:otherwise>
						<a href="http://localhost:9000/daangn/mypage_sales.carrot"><span class="box_span_pro">판매내역</span><br>
						<span class="box_span_num">0개 </span><span class="box_span_arr">></span></a>
					</c:otherwise>
			    </c:choose>
				
		</div>
		<div class="five_box">
			<c:choose>
				<c:when test="${vo2.bcount!=null}">
					<a href="http://localhost:9000/daangn/mypage_purchase.carrot"><span class="box_span_pro">구매내역</span><br> 
					<span class="box_span_num">${vo2.bcount }개</span> <span class="box_span_arr">></span></a>
				</c:when>
				<c:otherwise>
					<a href="http://localhost:9000/daangn/mypage_purchase.carrot"><span class="box_span_pro">구매내역</span><br>
					<span class="box_span_num">0개 </span><span class="box_span_arr">></span></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>