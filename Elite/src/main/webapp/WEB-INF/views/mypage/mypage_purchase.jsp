<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/mypage.css">
<script
	src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<title>마이페이지 판매 테스트</title>
<script>
	function openForm() {
		document.getElementById("myModal").style.display = "block";
	}

	function closeForm() {
		document.getElementById("myModal").style.display = "none";
	}
</script>
<script>
	$(document).ready(
			function() {

				
				
				$("#myModal").hide();
			
				$('#item_status').on('change', function() {
					alert($('#item_status').val());
				});

				/* 거래 후기 남기기 - pid, ptitle */
				$(".review_btn").click(function() {
					var pid = $(this).attr("id").substr(4, 4);
					alert(pid);
					$.ajax({
						url : "mypage_review.carrot",
						type : "post",
						data : "pid=" + pid,
						dataType : "json",
						success : function(data) {
							
							if (data != null) {
								$(".ptitle").text(data.ptitle);
								$(".id").text(data.id + "님과 거래가 어떠셨나요?");
								$(".id").text(data.id + "에게 감사 인사를 남겨보세요.");
								$("#src_name2").attr("src","http://localhost:9000/daangn/resources/upload/"+data.pfile);
							}else{
								alert("잉??");
							}
						}
					});
				});

				$("#img_best_c").hide();
				$("#img_good_c").hide();
				$("#img_bad_c").hide();
				$("#btn_best_good_click").hide();
				$("#btn_bad_click").hide();
				
				
				
				/* 최고예요! */
				$("#img_best").click(function() {
					$("#btn_bad_click").hide();
					$("#btn_best_good_click").show();
					$("#img_best_c").show();
					$("#img_best").hide();
					$("#img_good_c").hide();
					$("#img_bad_c").hide();
					$("#img_good").show();
					$("#img_bad").show();
				});

				/* 좋아요! */
				$("#img_good").click(function() {
					$("#btn_bad_click").hide();
					$("#btn_best_good_click").show();
					$("#img_good_c").show();
					$("#img_good").hide();
					$("#img_best_c").hide();
					$("#img_bad_c").hide();
					$("#img_best").show();
					$("#img_bad").show();
				});

				/* 별로예요! */
				$("#img_bad").click(function() {
					$("#btn_bad_click").show();
					$("#btn_best_good_click").hide();
					$("#img_bad_c").show();
					$("#img_bad").hide();
					$("#img_best_c").hide();
					$("#img_good_c").hide();
					$("#img_best").show();
					$("#img_good").show();
				});

				/*$(".review_img").click(function() {
					var state = $(this).attr('value');
					$.ajax({
						url : "review.carrot",
						type : "post",
						data : "state=" + state,
						dataType : "text",
						success : function(data) {
							alert(data);
						}
					});
					
				});
				
				$("#btn_review_check").click(function () {
					var obj = $("[name=comment]");
					var chkArray = new Array();
					
					$("input:checkbox[name=comment]:checked").each(function () {
						var dd =chkArray.push(this.value);
					});
					$("#hiddenValue").val(chkArray);
					alert($("#hiddenValue").val());*/

				/*var myArray1 = new Array();
				myArray1.push(dd);
				alert(myArray1.toString());
				});*/

				$(".review_img").click(function() {
					var state = $(this).attr('value');
					$(".btn_review_check").attr("id", state);
					
					
				});

				$("#goodtext,#badtext").change(function() {
					var oo = $(this).val();
					$("#test").val(oo);

				});

				$(".btn_review_check").click(
						function() {
							var state = $(".btn_review_check").attr("id");
							var obj = $("[name=comment]");
							var chkArray = new Array();

							$("input:checkbox[name=comment]:checked").each(
									function() {
										chkArray.push(this.value);
									});

							var detail = $("#test").val();
							var pid = $("#pid_rr").val();
							

							$.ajax({
								url : "review.carrot",
								type : "post",
								data : "state=" + state + "&chkArray="
										+ chkArray + "&detail=" + detail
										+ "&pid=" + pid,
								dataType : "text",
								success : function(data) {
									if (data != 0) {
										window.location.href = "http://localhost:9000/daangn/review_waiting.carrot?pid="+pid;
									}
								}
							});
						});
						
				
				$("#search-cnt").change(function () {
					var op = $(this).val();
					window.location.href = op;
				});
				
				
			});
</script>
<style>
.sbtb {
	width: 350px;
	height: 30px;
	text-align: center;
	margin-bottom: 5px;
	font-size: 15px;
	border: 1px solid #c6cdd2;
	background: white;
	color: #7e8f9a;
}

.review_btn {
	color: #f76707;
	font-weight: bold;
}

label {
	border: solid 1px #7e8f9a;
	color: #7e8f9a;
	border-radius: 3px;
	padding: 3px 0px 3px 0px;
}

input:checked+label {
	border: 1px solid #f76707;
}

#b, #c, #e, #g, #i, #k, #a, #d, #f, #h, #j, #l {
	visibility: hidden;
}

.characters {
	display: grid;
}
</style>
</head>
<body>

	<div id="mypage_content">
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
						class="tab">개인정보</a> <a
						href="http://localhost:9000/daangn/mypage_cart.carrot" class="tab">관심목록</a>
					<a href="http://localhost:9000/daangn/mypage_sales.carrot"
						class="tab support">판매내역</a> <a
						href="http://localhost:9000/daangn/mypage_purchase.carrot"
						class="tab active">구매내역</a>
				</div>

				<div class="mypage_sales">
					<div class="search_box">
						<select id="search-cnt" class="form-control select_width"
							name="account" style="width: 150px;">
							<option value="http://localhost:9000/daangn/mypage_purchase.carrot" selected>구매후기 대기중</option>
							<option value="http://localhost:9000/daangn/review_finish.carrot">구매후기 완료</option>
						</select>
					</div>

					<div class="wrapper-content">
						<div class="div_area"></div>

						<div class="div_area">
							<div class="ibox">
								<div class="ibox-content">
									<table class="table">
										<!-- <thead>
								<tr>
									<th class="text-center">사진</th>
									<th class="text-center">물품명</th>
									<th class="text-center">가격</th>
									<th class="text-center">찜/댓글</th>
									<th class="text-center">구입일</th>
									<th class="text-center"></th>
								</tr>
							</thead> -->
										<tbody>
										<c:choose>
										<c:when test="${not empty list}">
											<c:forEach var="vo" items="${list}">
												<tr>
													<td class="text-center"><a
														href="/sale/product/edit?pid=101832538"> <img
															src="http://localhost:9000/daangn/resources/upload/${vo.pfile}"
															width="152" height="152" />
													</a></td>
													<td class="text-center title"
														style="max-width: 400px; font-weight: bold;"><a
														style="max-width: 400px"
														href="/sale/product/edit?pid=101832538" class="title_link">${vo.ptitle}</a>
													</td>
													
													
													<td class="text-center" id="dd">
													
													<fmt:formatNumber value="${vo.pprice}" pattern="###,###,###"/>
													</td>
													
													<!-- <td class="text-center"><img
														src="http://localhost:9000/daangn/resources/images/하트.png"
														style="width: 30px; height: 30px;">0<img
														src="http://localhost:9000/daangn/resources/images/댓글.png"
														style="width: 30px; height: 30px;">0</td> -->
													<td class="text-center">${vo.bdate}</td>
													<td class="text-center">
														<ul class='func_group'>
															<li class='func_group_item'><button type="button"
																	class="review_btn" id="btn_${vo.pid}"
																	onclick="openForm()">거래 후기 남기기</button> <input
																type="hidden" id="pid_rr" value="${vo.pid}"></li>


														</ul>
													</td>
												</tr>
											</c:forEach>
											</c:when>
											<c:otherwise>
											<tr>
											<tr style="font-weight: bold; text-align: center;">
											<td style="padding-top: 100px;">
											구매 내역이 없습니다.
											</td>
											</tr>
											</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<!-- * Review Modal * -->
									<div class="modal-content" id="myModal"
										style="border:1px solid gray; margin-top: -400px;">
										<div class="modal-header" style="padding-bottom: 10px;">
											<button type="button" class="close" data-dismiss="modal"
												onclick="closeForm()" style="margin-right: 500px;">&times;</button>
											<h2 class="modal-title">거래 후기 남기기</h2>
										</div>
										<div class="modal-body">
											<div
												style="text-align: left; background: #f2f2f2; height: 70px; border: 1px solid #d9d9d9;">
												<ul
													style="display: inline-block; margin-left: 30px; padding-top: 10px;">
													<li><img
														id="src_name2" src=""
														style="width: 50px; height: 50px;"></li>
												</ul>
												<div style="display: inline-block;">
													<ul
														style="text-align: left; display: inline-block; margin-left: 10px;">
														<li
															style="font-size: 13px; color: gray; position: relative; top: -10px;">거래한
															상품</li>
														<li style="top: -7px; position: relative;" class="ptitle"></li>
													</ul>
												</div>
											</div>
											<div style="padding: 20px 0px 20px 0px;">
												<ul>
													<li style="font-weight: bold;" class="id"></li>
												</ul>
											</div>
											<form name="reviewForm" action="review.carrot" method="post">
												<ul style="color: gray; font-weight: bold;">
													<li>
														<!-- 별로예요 -->
														<button type="button" class="review_img"
															value="badcolor.png">
															<img
																src="http://localhost:9000/daangn/resources/images/badcolor.png"
																style="width: 70px; margin-right: 50px;" id="img_bad_c">
															<img
																src="http://localhost:9000/daangn/resources/images/bad.png"
																style="width: 70px; margin-right: 50px;" id="img_bad">
														</button> <!-- 별로예요 --> <!-- 좋아요 -->
														<button type="button" class="review_img"
															value="goodcolor.png">
															<img
																src="http://localhost:9000/daangn/resources/images/goodcolor.png"
																style="width: 70px; margin-right: 50px;" id="img_good_c">
															<img
																src="http://localhost:9000/daangn/resources/images/good.png"
																style="width: 70px; margin-right: 50px;" id="img_good">
														</button> <!-- 좋아요 --> <!-- 최고예요 -->
														<button type="button" class="review_img"
															value="bestcolor.png">
															<img
																src="http://localhost:9000/daangn/resources/images/bestcolor.png"
																style="width: 70px;" id="img_best_c"> <img
																src="http://localhost:9000/daangn/resources/images/best.png"
																style="width: 70px;" id="img_best">
														</button> <!-- 최고예요 -->

													</li>
													<li style="display: inline-block; margin-right: 60px;">별로예요</li>
													<li style="display: inline-block; margin-right: 60px; padding-left: 3px;">좋아요!</li>
													<li style="display: inline-block;">최고예요!</li>
												</ul>
												<!-- best,good -->
												<div id="btn_best_good_click">
													<div
														style="border-top: 1px solid gray; border-bottom: 1px solid gray; font-weight: bold; margin-top: 20px; padding-bottom: 15px; margin-bottom: 15px;">
														<ul style="padding: 15px 0px 15px 0px;">
															<li>거래하며 좋았던 점을 선택해 주세요:)</li>
														</ul>
														<ul>
															<li><section class="characters"> <input
																	id="b" name="comment" class="comment" type="checkbox"
																	value="무료로 나눠주셨어요.">
																<label for="b">무료로 나눠주셨어요.</label> <input id="c"
																	name="comment" class="comment" type="checkbox"
																	value="상품상태가 설명한 것과 같아요.">
																<label for="c">상품상태가 설명한 것과 같아요.</label> <input id="e"
																	name="comment" class="comment" type="checkbox"
																	value="좋은 상품을 저렴하게 판매해요.">
																<label for="e">좋은 상품을 저렴하게 판매해요.</label> <input id="g"
																	name="comment" class="comment" type="checkbox"
																	value="시간 약속을 잘 지켜요">
																<label for="g">시간 약속을 잘 지켜요.</label> <input id="i"
																	name="comment" class="comment" type="checkbox"
																	value="친절하고 매너가 좋아요.">
																<label for="i">친절하고 매너가 좋아요.</label> <input id="k"
																	name="comment" class="comment" type="checkbox"
																	value="응답이 빨라요.">
																<label for="k">응답이 빨라요.</label> </section></li>
														</ul>
													</div>
													<ul style="font-weight: bold; margin-bottom: 15px;">
														<li class="id"></li>
													</ul>
													<ul>
														<li><input type="text" id="goodtext" class="detail"
															style="width: 400px; height: 100px;" value=""></li>
													</ul>
													<button type="button" id="" class="btn_review_check"
														style="border: 1px solid #c6cdd2; width: 404px; height: 35px; margin-top: 15px; background: #c6cdd2; color: white; font-weight: bold;">거래
														후기 작성 완료</button>
												</div>
												<!-- /best,good -->

												<!-- bad -->
												<div id="btn_bad_click">
													<div
														style="border-top: 1px solid gray; border-bottom: 1px solid gray; font-weight: bold; margin-top: 20px; padding-bottom: 15px; margin-bottom: 15px;">
														<ul style="padding: 15px 0px 15px 0px;">
															<li>거래하며 불편했던 점을 선택해 주세요.</li>
														</ul>
														<ul>

															<li><section class="characters"> <input
																	id="a" name="comment" class="comment" type="checkbox"
																	value="거래 시간과 장소를 정한 후 연락이 안돼요.">
																<label for="a">거래 시간과 장소를 정한 후 연락이 안돼요.</label> <input
																	id="d" name="comment" class="comment" type="checkbox"
																	value="약속 장소에 나타나지 않았어요.">
																<label for="d">약속 장소에 나타나지 않았어요.</label> <input id="f"
																	name="comment" class="comment" type="checkbox"
																	value="무조건 택배거래만 하려고 해요.">
																<label for="f">무조건 택배거래만 하려고 해요.</label> <input id="h"
																	name="comment" class="comment" type="checkbox"
																	value="너무 늦은 시간이나 새벽에 연락해요.">
																<label for="h">너무 늦은 시간이나 새벽에 연락해요.</label> <input
																	id="j" name="comment" class="comment" type="checkbox"
																	value="질문해도 답이 없어요.">
																<label for="j">질문해도 답이 없어요.</label> <input id="l"
																	name="comment" class="comment" type="checkbox"
																	value="응답이 느려요.">
																<label for="l">응답이 느려요.</label> </section></li>
														</ul>
													</div>
													<ul style="font-weight: bold; margin-bottom: 15px;">
														<li>신고하고 싶은 내용이 있다면 당근마켓팀에 알려주세요.</li>
													</ul>
													<ul>
														<li><input type="text" id="badtext" class="detail"
															style="width: 400px; height: 100px;" value=""></li>
													</ul>
													<button type="button" id="" class="btn_review_check"
														style="border: 1px solid #c6cdd2; width: 404px; height: 35px; margin-top: 15px; background: #c6cdd2; color: white; font-weight: bold;">거래
														후기 작성 완료</button>
												</div>
												<!-- /bad -->
												<input type="hidden" id="test" value="">
											</form>
										</div>

									</div>

									<div class="modal-footer"></div>



								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- page tab div -->
	</div>
	<!-- end of mypage_menu -->
	</div>
	<!-- end of mypage_content -->
	<div style="height:500px;">&nbsp;</div>

</body>
</html>