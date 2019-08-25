<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당근마켓 - 우리 동네 중고 직거래 마켓</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/mypage.css">
<link rel="stylesheet" type="text/css" 
	href="http://localhost:9000/daangn/resources/css/am-pagination.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:9000/daangn/resources/js/am-pagination.js"></script>
<style>
#toggle-heart {
	position: absolute;
	left: -100vw;
	width: 10px;
}

[for='toggle-heart'] {
	color: #aab8c2;
}

#toggle-heart:checked+label {
	color: #e2264d;
}

label {
	font-size: 30px;
}

.mypage_cart_tr {
	border: 1px solid black;
}

.my_like {
	width: 40px;
	height: 40px;
}

#ampaginationsm{
text-align:center;
padding-top:30px;
}
footer{
margin-top:300px;
}
</style>
<script>
	$(document).ready(function(){
		var pager = jQuery("#ampaginationsm").pagination({
		
			maxSize:5, 
			totals:'${dbCount}',
			page:'${rpage}',
			pageSize:'${pageSize}',
			
			 lastText: '&raquo;&raquo;', 		
			 firstText: '&laquo;&laquo;',		
			 prevText: '&laquo;',		
			 nextText: '&raquo;',
			    
			btnSize:'sm'
		});
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			jQuery('.showlabelsm').text('The selected page no: '+e.page);
			$(location).attr('href', "http://localhost:9000/daangn/mypage_cart.carrot?rpage="+e.page);
		})
		
	});
</script>

</head>
<body>
	<div id="mypage_content" style="height: 1050px;">

		<!-- 메인로고 -->
		<div id="top_div">
			<div id="title_div"></div>
		</div>

		<!-- 마이페이지 상단 박스 -->
		<jsp:include page="mypage_box.jsp"></jsp:include>


		<div class="mypage_menu">
			<div class="page-tabs">
				<!-- 수평 메뉴 -->
				<div class="tabs">
					<a
						href="http://localhost:9000/daangn/mypage_info_pass_check.carrot"
						class="tab support">개인정보</a> <a
						href="http://localhost:9000/daangn/mypage_cart.carrot"
						class="tab active">관심목록</a> <a
						href="http://localhost:9000/daangn/mypage_sales.carrot"
						class="tab">판매내역</a> <a
						href="http://localhost:9000/daangn/mypage_purchase.carrot"
						class="tab">구매내역</a>
				</div>

				<!-- 관심목록 -->
				<c:choose>
					<c:when test="${not empty list}">
						<table class="mypage_cart_table">

							<tr class="mypage_cart_tr">
								<th>사진</th>
								<th>제목</th>
								<th>가격</th>
								<th>찜</th>
								<th>상태</th>
							</tr>
							<c:forEach var="vo" items="${list}">
								<tr class="mypage_cart_tr_select">
									<td><img
										src="http://localhost:9000/daangn/resources/upload/${vo.pfile }"
										class="mypage_cart_img" /></td>
									<td><a href="#" class="mypage_cart_link">${vo.ptitle}</a></td>
									<td>${vo.pprice }</td>
									<td><a href="mypage_delete.carrot?cid=${vo.cid }"> <img
											src="http://localhost:9000/daangn/resources/images/heart2.png"
											class="my_like"></a></td>
									<td class="text-center"><select class="form-control"
										name="account">
											<option value="판매중"
												<c:if test="${vo.pstate == '판매중'}">selected</c:if>>판매중</option>
											<option value="예약중"
												<c:if test="${vo.pstate == '예약중'}">selected</c:if>>예약중</option>
											<option value="판매완료"
												<c:if test="${vo.pstate == '판매완료'}">selected</c:if>>판매완료</option>
									</select></td>
								</tr>
						</c:forEach>
						</table>
				 	</c:when>
					<c:otherwise>
						<table class="mypage_cart_table">
						<tr class="mypage_cart_tr">
								<th>사진</th>
								<th>제목</th>
								<th>가격</th>
								<th>찜</th>
								<th>상태</th>
							</tr>
						<tr class="mypage_cart_tr_select">
						<td colspan="5">
						관심목록이 비어있습니다
						</td>
						</tr>
						</table>
					</c:otherwise>
				</c:choose> 
				
			   <div id="ampaginationsm"></div>
			</div>
			<!-- page tab div -->
		</div>
		<!-- end of mypage_menu -->
	</div>
	<!-- end of mypage_content -->
</body>
</html>