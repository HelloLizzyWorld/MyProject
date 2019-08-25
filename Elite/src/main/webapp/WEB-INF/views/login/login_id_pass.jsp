<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/index.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/join.css">
<link rel="stylesheet" type="text/css"
	href="http://localhost:9000/daangn/resources/css/mypage.css">
<script
	src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(
		function() {
			$('.login_box').each(function() {
				if ($(this).index() == 1) {
					$(this).show();
				} else {
					$(this).hide();
				}
			});
			
			$('.tabs a').click(
					function() {

						var sqn = $(this).index() + 1;

						if ($(this).index() == 0) {
							$(this).addClass(' active').siblings()
									.removeClass(' active');
							$(this).siblings().removeClass(' support');
						} else {
							$(this).addClass(' active').siblings()
									.removeClass(' active');
							$(this).prev().addClass(' support').siblings()
									.removeClass(' support');
						}

						$('.login_box').each(function() {
							if (sqn == $(this).index()) {
								$(this).show();
							} else {
								$(this).hide();

							}
						})
					})
		
		
		
		$("#bth_login_id").click(function() {
			var id = $("id").val();
			var name = $("name").val();
			alert(id+"_"+name);
			
			window.location.href = "http://localhost:9000/daangn/find_id.carrot?id="+id;
			
		/*	$.ajax({
				url : "find_id.carrot",
				type : "post",
				data : "id=" + id + "&name=" + name,
				dataType : "text",
				success : function(data) {
					if (data == 1) {
						window.location.href = "http://localhost:9000/daangn/find_id.carrot?id="+id;
					} else {
						alert("비밀번호를 정확하게 입력해주세요.");
						$("#confirm_password").val("");
						$("#confirm_password").focus();
						
						
					}
				}

			});*/
		});
					
					
					
		
		});/* document */
		
		
		
		
		
		
		
		
		
</script>
<title>당근마켓 - 우리 동네 중고 직거래 마켓</title>
<style>
.login_p {
	height: 80px;
}

.login_logo {
	border: 1px solid #404040;
	background: #404040;
	height: 50px;
}

.login_img {
	width: 40px;
	padding-left: 18px;
	padding-top: 5px;
}

.input_css {
	height: 50px;
	margin-top: -10px;
	margin-left: -2px;
	border-radius: 5px;
}

.id_pass_join_menu {
	margin-top: 10px;
	padding-left: 250px;
}

.id_pass_menu {
	font-size: 14px;
}

.join_menu {
	padding-left: 200px;
	font-size: 14px;
}

#login_f {
	margin-left: 110px;
	padding-top: 70px;
}

#bth_login {
	width: 420px;
	margin-top: 60px;
	margin-left: 112px;
	font-size: 24px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- header -->
	<%-- <c:import url="http://localhost:9000/daangn/header.carrot" /> --%>
	<div class="header"></div>

	<div class="page_aticle">

		<div class="head_join">
			<h2 class="tit" style="padding-left: 190px;">ID / 비밀번호 찾기</h2>
			<div class="join_line"></div>
		</div>

		<div class="login_p"></div>
	
		<!-- 수평 메뉴 -->
		<div class="mypage_menu" style="width: 700px; margin: auto;">
			<div class="page-tabs" style="border: none;">
				<div class="tabs">
					<a href="#" class="tab active">ID찾기</a>
					<a href="#" class="tab">비밀번호찾기</a>
					
				</div>
		
		<div class="login_box">
		<div class="member_join">
			<div class="boardWrite" style="height: 500px;">
				<table class="tbl_comm" id="login_f">
					<tr>
						
						<td class="memberCols2"><input type="text" name="name"
							class="input_css" id="name" maxlength="16" fld_esssential
							option=regId label="아이디" placeholder="이름"
							style="height: 50px; width: 400px;">
					</tr>
					<tr>
						
						<td class="memberCols2"><input type="text" name="id"
							class="input_css" id="id" maxlength="16" required
							fld_esssential option=regPass label="비밀번호" placeholder="아이디"
							style="height: 50px; width: 400px;">
							<p class="txt_guide">
								<span class="txt txt_case1">10자 이상 입력</span> <span
									class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
								<span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
							</p></td>
					</tr>
				</table>
				
				<div class="btn_join_div">
				<a href="http://localhost:9000/daangn/find_id.carrot">
					<button type="button" class="btn_join1" id="bth_login_id"
							style="width: 420px;">확인</button>
							</a>
					<br>
				</div>
			</div>
		</div>
	</div>
	<div class="login_box">
				<div class="member_join">
			<div class="boardWrite" style="height: 500px;">
				<table class="tbl_comm" id="login_f">
					<tr>
						
						<td class="memberCols2"><input type="text" name="mid"
							class="input_css" id="mid" maxlength="16" fld_esssential
							option=regId label="아이디" placeholder="아이디"
							style="height: 50px; width: 400px;">
					</tr>
					<tr>
						
						<td class="memberCols2"><input type="text" name="mid"
							class="input_css" id="mid" maxlength="16" fld_esssential
							option=regId label="아이디" placeholder="이름"
							style="height: 50px; width: 400px;">
					</tr>
					<tr>
						
						<td class="memberCols2"><input type=password name=password
							class="input_css" id="pass" maxlength="16" required
							fld_esssential option=regPass label="비밀번호" placeholder="이메일"
							style="height: 50px; width: 400px;">
							<p class="txt_guide">
								<span class="txt txt_case1">10자 이상 입력</span> <span
									class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
								<span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
							</p></td>
					</tr>
				</table>
				
				<div class="btn_join_div">
					
					<button type="button" class="btn_join1" id="bth_login_pass"
								style="width: 420px;">확인</button>
					
					<br>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="footer"></div>
	<!-- footer -->
	<%-- <c:import url="http://localhost:9000/daangn/footer.carrot" /> --%>
</body>
</html>