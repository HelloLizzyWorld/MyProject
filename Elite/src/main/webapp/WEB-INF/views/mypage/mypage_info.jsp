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
	href="http://localhost:9000/daangn/resources/css/join.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src ="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>

	$(document).ready(function() {

		$("#check").click(function() {
			if ($("#confirm_password").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#confirm_password").focus();
				return false;
			} else {
				var id = $("#id").html();
				var pass = $("#confirm_password").val();

				$.ajax({
					url : "pass_check.carrot",
					type : "post",
					data : "id=" + id + "&pass=" + pass,
					dataType : "text",
					success : function(data) {
							
						
						if (data == 1) {
							window.location.href = "http://localhost:9000/daangn/mypage_info.carrot?id="+id;
						} else {
							alert("비밀번호를 정확하게 입력해주세요.");
							$("#confirm_password").val("");
							$("#confirm_password").focus();
							
							
						}
					}

				});
			}
		});
	});
	
</script>
</head>
<body>
	<div id="mypage_content" >
	<!-- style="height: 1050px;" -->
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
					<a href="http://localhost:9000/daangn/mypage_info.carrot" class="tab active">개인정보</a> 
					<a href="http://localhost:9000/daangn/mypage_cart.carrot" class="tab">관심목록</a>
					<a href="http://localhost:9000/daangn/mypage_sales.carrot" class="tab">판매내역</a> 
					<a href="http://localhost:9000/daangn/mypage_purchase.carrot" class="tab">구매내역</a>
				</div>

				<!-- 비밀번호 재확인 -->
				
					<div class="page_section section_myinfo">
						<div class="conf_pw">
						
								<div class="tit">
									<img
										src="http://localhost:9000/daangn/resources/images/제목 없음.png">
								</div>
								<div class="field_pw">
									<div class="tit_id">아이디</div>
									<span id="id" class="txt_id">${sessionScope.svo.id}</span>
									<div class="tit_pw">비밀번호</div>
									<div>
										<input type="hidden" name="pass" value="confirmPassword">
										<input type="password" name="confirm_password"
											id="confirm_password" class="inp_pw">
									</div>
								</div>
								<div class="group_btn">
									<span class="inner_groupbtn">
										
										<button type="button" class="btn btn_positive" id="check">확인</button>
										
									</span>
								</div>
							
						</div>
					</div>
				</div>
				<!-- 비밀번호 재확인 -->

			</div>
			<!-- page tab div -->
		</div>
		<!-- end of mypage_menu -->
	

	
</body>
</html>