
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/mypage_sales.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/daangn/resources/css/am-pagination.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:9000/daangn/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/daangn/resources/js/mypage_sales.js"></script>
<title>마이페이지 판매 테스트</title>

<script>
$(document).ready(function() {
	// 페이징
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize:3,	    		// max page size
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
		   $(location).attr('href', "http://localhost:9000/daangn/mypage_sales.carrot?rpage="+e.page);

    });
});
</script>

</head>
<body>
	<div id="mypage_content">

		<!-- 메인로고 -->
		<div id="top_div">
			<div id="title_div"></div>
		</div>

		<!-- 마이페이지 상단 박스 -->
		<jsp:include page="mypage_box.jsp"></jsp:include>

		<div class="mypage_menu" style="height: 1200px;">
			<div class="page-tabs">
				<!-- 수평 메뉴 -->
				<div class="tabs">
					<a
						href="http://localhost:9000/daangn/mypage_info_pass_check.carrot"
						class="tab">개인정보</a> <a
						href="http://localhost:9000/daangn/mypage_cart.carrot"
						class="tab support">관심목록</a> <a
						href="http://localhost:9000/daangn/mypage_sales.carrot"
						class="tab active">판매내역</a> <a
						href="http://localhost:9000/daangn/mypage_purchase.carrot"
						class="tab">구매내역</a>
				</div>

				<div class="mypage_sales" style="width: 1050px;">
					<!-- <div class="search_box">
						<select id="search-cnt" class="form-control select_width"
							name="account">
							<option value="10">5개씩</option>
							<option value="20">10개씩</option>
						</select> <select id="search-status" class="form-control select_width"
							name="account">
							<option value="all">전체</option>
							<option value="selling">판매중</option>
							<option value="reserved">예약중</option>
							<option value="soldout">판매완료</option>
						</select>

						<button class="btn-white btn btn-xs search-name-btn"
							onclick="searchName()">검색</button>
						<input id="search-name-input" type="text"
							class="form-control input-name" maxlength="40">
					</div> -->

					<!-- 판매 완료 후 리뷰 작성을 위한 form -->
					<form id="sales_review" name="sales_review" action="sales_review.carrot" method="post">
						<input type="hidden" name="id" value="">
						<input type="hidden" name="rstate" value="">
						<input type="hidden" name="rcomment" value="">
						<input type="hidden" name="rdetail" value="">
						<input type="hidden" name="pid" value="">
					</form>
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!-- modal 판매중 & 예약중 1-->
					<div class="modal_area" id="myModal_1">
						<div class="modal-content-sale" id="modal_content_1">
							<img
								src="http://localhost:9000/daangn/resources/images/change_success.png"
								class="state_img">
							<div class="modal_btn_area">
								<button type="submit" class="modal_btn" onclick="closeModal('1')">확인</button>
							</div>
						</div>
					</div>
					<!-- modal 판매중 & 예약중 1 end-->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!-- modal 판매완료2 -->
					<div class="modal_area" id="myModal_2">
						<div class="modal-content-sale" id="modal_content_2">
							<div class="sale-change">
								<img src="http://localhost:9000/daangn/resources/images/sale_complete_checkmark.png" class="img_modal"> 
								<span class="change_span1">거래가 완료되었습니다.</span><br> 
								<span>구매자를 선택해주세요. </span>
							</div>

							<div class="sale-content">
								<!-- append area -->
							</div>
							
							<div class="buyer_list">
								<div class="buyer_list_append">
									<!-- append area -->
								</div>
								<div class="modal_btn_area">
									<button type="submit" class="modal_btn" onclick="sales_complete()">선택</button>
								</div>
							</div>
						</div>
					</div>
					<!-- modal 판매완료2 end -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!-- modal 판매완료3 -->
					<div class="modal_area" id="myModal_3">
						<div class="modal-content-sale" id="modal_content_3">

							<div class="sale-content">
								<!-- append area -->
							</div>

							<div class="buyer_review_choice">
								<div class="buyer_review_choice_append"></div>
								<img class="review_choice_img" id="bad" alt="별로예요"
									src="http://localhost:9000/daangn/resources/images/bad_before.jpg">
								<img class="review_choice_img" id="good" alt="좋아요"
									src="http://localhost:9000/daangn/resources/images/good_before.jpg">
								<img class="review_choice_img" id="best" alt="최고예요"
									src="http://localhost:9000/daangn/resources/images/best_before.jpg">
							</div>

							<!-- best & good -->
							<div class="buyer_best_choice" style="display: none;">
								<div class="review_line"></div>
								<div class="best_choice">
									<span class="best_choice_span">거래하며 좋았던 점을 선택해 주세요:)</span>
									
									<section class="rcommentList"> 
										<input id="com1" name="rcomment" class="rcomment" type="checkbox"value="제가 있는 곳까지 와서 거래했어요.">
										<label for="com1">제가 있는 곳까지 와서 거래했어요.</label> 
										<input id="com2" name="rcomment" class="rcomment" type="checkbox" value="친절하고 매너가 좋아요.">
										<label for="com2">친절하고 매너가 좋아요.</label> 
										<input id="com3" name="rcomment" class="rcomment" type="checkbox" value="시간 약속을 잘 지켜요.">
										<label for="com3">시간 약속을 잘 지켜요.</label> 
										<input id="com4" name="rcomment" class="rcomment" type="checkbox" value="응답이 빨라요.">
										<label for="com4">응답이 빨라요.</label> 
									</section>
								</div>
								<div class="review_line"></div>
								<div class="buyer_thank_you">
									<div class="buyer_thank_you_append">
										<!-- append area -->
									</div>
									<span class="thank_you_span2">작성한 내용은 상대방 프로필에 공개됩니다.(선택사항)</span>
									<textarea placeholder="여기에 감사 인사를 작성하세요" class="rdetail" name="rdetail"></textarea>
								</div>
								<div class="modal_btn_area">
									<button type="submit" class="modal_btn" id="finish_btn"
										onclick="finish()">거래 후기 작성 완료</button>
								</div>
							</div>

							<!-- bad -->
							<div class="buyer_bad_choice" style="display: none;">
<!-- 								<div class="do_not_trade">
									<div class="do_not_trade_div">이 분과 다시는 거래하고 싶지 않아요</div>
								</div> -->

								<div class="review_line"></div>

								<div class="bad_choice">
									<span class="bad_choice_span">거래하며 불편했던 점을 선택해주세요.</span> <span
										class="bad_span2">부정 후기는 상대방에게 알림이 가지 않아요.<br>누가평가했는지
										알 수 없으니 안심하세요.
									</span>


									<section class="rcommentList"> 
										<input id="com5" name="rcomment" class="rcomment" type="checkbox"value="거래 시간과 장소를 정한 후 연락이 안돼요.">
										<label for="com5">거래 시간과 장소를 정한 후<br> 연락이 안돼요.</label> 
										<input id="com6" name="rcomment" class="rcomment" type="checkbox" value="약속 장소에 나타나지 않았어요.">
										<label for="com6">약속 장소에 나타나지 않았어요.</label> 
										<input id="com7" name="rcomment" class="rcomment" type="checkbox" value="거래 시간과 장소를 정한 후 거래 직전 취소했어요.">
										<label for="com7">거래 시간과 장소를 정한 후<br> 거래 직전 취소했어요.</label> 
										<input id="com8" name="rcomment" class="rcomment" type="checkbox" value="단순 변심으로 환불을 요구해요.">
										<label for="com8">단순 변심으로 환불을 요구해요.</label> 
										<input id="com9" name="rcomment" class="rcomment" type="checkbox" value="상품 가치없는 물건을 팔아요.">
										<label for="com9">상품 가치없는 물건을 팔아요.</label> 
										<input id="com10" name="rcomment" class="rcomment" type="checkbox" value="차에서 내리지도 않고 창문만 열고 거래하려고 해요.">
										<label for="com10">차에서 내리지도 않고<br> 창문만 열고 거래하려고 해요.</label> 
										<input id="com11" name="rcomment" class="rcomment" type="checkbox" value="시간약속을 안 지켜요.">
										<label for="com11">시간약속을 안 지켜요.</label> 
										<input id="com12" name="rcomment" class="rcomment" type="checkbox" value="상품 설명에 중요한 정보가 누락됐어요.">
										<label for="com12">상품 설명에 중요한 정보가 누락됐어요.</label> 
										<input id="com13" name="rcomment" class="rcomment" type="checkbox" value="구매 가격보다 비싼 가격으로 판매해요.">
										<label for="com13">구매 가격보다 비싼 가격으로 판매해요.</label> 
										<input id="com14" name="rcomment" class="rcomment" type="checkbox" value="무리하게 가격을 깎아요.">
										<label for="com14">무리하게 가격을 깎아요.</label> 
										<input id="com15" name="rcomment" class="rcomment" type="checkbox" value="불친절해요.">
										<label for="com15">불친절해요.</label> 
										<input id="com16" name="rcomment" class="rcomment" type="checkbox" value="예약만 해놓고 거래 시간을 명확하게 알려주지 않아요.">
										<label for="com16">예약만 해놓고 거래 시간을<br> 명확하게 알려주지 않아요.</label> 
										<input id="com17" name="rcomment" class="rcomment" type="checkbox" value="상품 상태가 설명과 달라요.">
										<label for="com17">상품 상태가 설명과 달라요.</label> 
										<input id="com18" name="rcomment" class="rcomment" type="checkbox" value="너무 늦은 시간이나 새벽에 연락해요.">
										<label for="com18">너무 늦은 시간이나 새벽에 연락해요.</label> 
										<input id="com19" name="rcomment" class="rcomment" type="checkbox" value="무조건 택배거래만 하려고 해요.">
										<label for="com19">무조건 택배거래만 하려고 해요.</label> 
									</section>
									

								</div>

								<div class="review_line"></div>

								<div class="buyer_notification">
									<span class="notification_span1">상대방에 대해 신고하고 싶은 <br>내용이 있다면 당근마켓팀에 알려주세요.</span> 
									<span class="notification_span2">신고 내용은 상대방에게 공개되지 않습니다.(선택사항)</span>
									<textarea placeholder="여기에 신고사항을 작성하세요" class="rdetail" name="rdetail"></textarea>
								</div>
								<div class="modal_btn_area">
									<button type="submit" class="modal_btn" id="finish_btn"
										onclick="finish()">거래 후기 작성 완료</button>
								</div>
							</div>

						</div>
					</div>
					<!-- modal 판매완료3 end-->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!-- modal 판매완료4 -->
					<div class="modal_area" id="myModal_4">
						<div class="modal-content-sale" id="modal_content_4">
							<div class="sale-content">
								<!-- append area -->
							</div>

							<div class="review_result">
								<!-- append area -->
							</div>
							<div class="modal_btn_area">
								<button type="submit" class="modal_btn" onclick="closeModal('2')">닫기</button>
							</div>
						</div>
					</div>
					<!-- modal 판매완료4 end -->
					<!-- modal end-->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->


					<div class="wrapper-content">
						<div class="div_area"></div>

						<div class="div_area">
							<div class="ibox">
								<div class="ibox-content">
									<table class="table">
										<thead>
											<tr>
												<th class="text-center">사진</th>
												<th class="text-center">물품명</th>
												<th class="text-center">가격</th>
												<th class="text-center">찜/채팅</th>
												<th class="text-center">최근수정일</th>
												<th class="text-center">상태</th>
												<th class="text-center">기능</th>
											</tr>
										</thead>
										
										<c:choose>
										<c:when test="${not empty list}">
										
										<tbody>
											<c:forEach var="vo" items="${list}">
												<tr>
													<td class="text-center">
														<a href="http://localhost:9000/daangn/board_content.carrot?pid=${vo.pid}">

															<c:choose>
															<c:when test="${not empty vo.fileArray}">
																<c:forEach var="file" items="${vo.fileArray}" begin = "0" end = "0">
																	<img src="http://localhost:9000/daangn/resources/upload/${file.pfile}" width="152" height="152"/>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<img src="https://seoul-p-studio.bunjang.net/product/101832538_1_1557381938_w152.jpg" width="152" height="152" />
															</c:otherwise>
															</c:choose>
															
														</a>
													</td>

													<td class="text-center title">
														<a href="http://localhost:9000/daangn/board_content.carrot?pid=${vo.pid}" class="title_link">${vo.ptitle}</a>
													</td>

													<td class="text-center">
														<c:choose>
															<c:when test="${vo.ptype ne '판매'}">
																${vo.ptype}
															</c:when>
															<c:otherwise>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.pprice}" />원
															</c:otherwise>
														</c:choose>
													</td>

													<td class="text-center">${vo.cart}/${vo.msg}</td>
													<td class="text-center">${vo.pdate}</td>
													<td class="text-center">
													<select id="pstate_${vo.pid}" class="pstate form-control" name="pstate" value="${vo.pstate}">
														<option value="판매중"
															<c:if test="${vo.pstate == '판매중'}">selected</c:if>>판매중</option>
														<option value="예약중"
															<c:if test="${vo.pstate == '예약중'}">selected</c:if>>예약중</option>
														<option value="판매완료"
															<c:if test="${vo.pstate == '판매완료'}">selected</c:if>>판매완료</option>
													</select></td>

													<td class="text-center">
														<ul class='func_group' id='${vo.pid}'>
															<li class='func_group_item'><a
																class="btn-white btn btn-xs" style="color: #286090;"
																id="btn1_${vo.pid}">UP</a></li>
															<li class='func_group_item'><a
																class="btn-white btn btn-xs" style="color: #309c44;"
																id="btn2_${vo.pid}">수정</a></li>
															<li class='func_group_item'><a
																class="btn-white btn btn-xs" style="color: #ff0000;"
																id="btn3_${vo.pid}">삭제</a></li>
														</ul>
													</td>
												</tr>
											</c:forEach>
										</tbody>

										</c:when>

										<c:otherwise>
												<tbody>
													<tr>
														<td class="text-center" colspan="7" style="height:152px;">판매 내역이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
										
									</table>
								</div>
							</div>
						</div>
						
						
					</div>
						<div id="ampaginationsm" style="text-align:center;"></div>
				</div>
			</div>
			<!-- page tab div -->
		</div>
		<!-- end of mypage_menu -->
	</div>
	<!-- end of mypage_content -->
</body>
</html>