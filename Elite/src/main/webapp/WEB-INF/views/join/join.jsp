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
<script
	src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>당근마켓 - 우리 동네 중고 직거래 마켓</title>

<script>
$(document).ready(function() {
	$("#btn_address").click(function(){
		
		new daum.Postcode({
		    oncomplete: function(data) {
		    	
				$('input[name=addr_sido]').val(data.sido);
				$('input[name=addr_sigungu]').val(data.sigungu);
				$('input[name=addr_bname]').val(data.bname);
				//alert(JSON.stringify(myObj));
				
		    	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                   
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
              
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
               
		    }
		 
			}).open();
		
	});
});
</script>

<script>
	$(document).ready(function() {
		//회원가입
		$("#btn_join").click(function() {

			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인란을 입력해주세요.");
				$("#cpass").focus();
				return false;
			} else if ($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			} else if ($("#phone").val() == "") {
				alert("핸드폰 번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			} else if($("#id_check").val() =='2'){
				alert("아이디 중복체크를 진행해주세요.");
				return false;
			}else if($("#email_check").val() =='2'){
				alert("이메일 중복체크를 진행해주세요.");
				return false;
			}
			 joinForm.submit();
			
		});
		
		//아이디 중복체크
		$("#btn_overlap1").on('click', function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}else{
				var id = $("#id").val();
				$.ajax({
					url: "id_check.carrot",
					type: "get",
					data: "id="+id,
					dataType: "text",
					success:function(data){
						  
						if(data == 1){
							  $("#check_result").text("이미 사용중인 아이디입니다.").css("color","red").css("padding-top","10px");
							  	$("#id").val("");
								$("#id").focus();
						}else{
							$("#check_result").text("사용가능한 아이디입니다.").css("color","blue").css("padding-top","10px");
							/* $("#pass").focus(); */
							$("#id_check").val('0');
						}
						
					}
					
				});
			}
		});
		//이메일 중복체크
		$("#btn_overlap_email").on('click', function(){
			if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}else{
				var email = $("#email").val();
				$.ajax({
					url:"email_check.carrot",
					type: "get",
					data: "email="+email,
					dataType: "text",
					success:function(data){
						/* if(data == '0') {
							
							$("#email_check").val('0');
							} else {
						
							}
					 	 */
						if(data == 1){
							$("#check_email_result").text("이미 사용중인 이메일입니다.").css("color","red").css("padding-top","10px");
							$("#email").val("");
							$("#eamil").focus();
						}else{
							$("#check_email_result").text("사용가능한 이메일입니다.").css("color","blue").css("padding-top","10px");
							$("#email_check").val('0');
						}
					}
						
				});
			
			}
			
		});
		
		$("#btn_overlap2").on('click',function(){
			
			if($("#nick").val()== ""){
				alert("닉네임을 입력해주세요.");
				$("#nick").focus();
				return false;
			}else{
				var nick = $("#nick").val();
				
				$.ajax({
					url:"nick_check.carrot",
					type:"get",
					data:"nick="+nick,
					success:function(data){
						
						 if(data == 1){
							$("#nick_result").text("이미 사용중인 닉네임입니다.").css("color","red").css("padding-top","10px");
							$("#nick").val("");
							$("#nick").focus();
						}else{
							$("#nick_result").text("사용가능한 닉네임입니다.").css("color","blue").css("padding-top","10px");
							$("#nick_check").val('0');
						} 
					}
					
				})
			}
			
		});
		
		 $(function(){
		        $("#password-success").hide();
		        $("#password-failed").hide();
		        
		        $("input#cpass").keyup(function(){
		            var pwd1=$("#pass").val();
		            var pwd2=$("#cpass").val();
		            if(pwd1 != "" || pwd2 != ""){
		                if(pwd1 == pwd2){
		                	
		                    $("#password-success").show();
		                    $("#password-failed").hide();
		                   
		                }else{
		                    $("#password-success").hide();
		                    $("#password-failed").show();
		                 
		              }    
		            }
		        });
		    }); 
			
		   $("#email").keyup(function(){
			      $(this).val($(this).val().replace(/[^0-9a-zA-Z._-@]/gi,""));
			      });	
		   $("#phone").keyup(function(){
			      $(this).val($(this).val().replace(/[^0-9-]/gi,""));
			      });
		   $("#id, #pass, #cpass").keyup(function(){
			      $(this).val($(this).val().replace(/[^0-9a-zA-Z]/gi,""));
			      });
		  $("#name").keyup(function(){
			      $(this).val($(this).val().replace(/[^(ㄱ-힣a-zA-Z)]/gi,""));
			      });
		  $("#birth_year,#birth_month,#birth_day").keyup(function(){
		      $(this).val($(this).val().replace(/[^0-9]/gi,""));
		      });
		   
		$(".btn_join_reset").on('click',function(){
			window.location.reload(true);
		});
	});//end of jQuery
</script>
</head>

<body>
	<!-- header -->
	<%-- <c:import url="http://localhost:9000/daangn/header.carrot" /> --%>
	<div class="header"></div>
	<div class="page_aticle">
		<div class="head_join">

			<h2 class="tit">회원가입</h2><br>
			<div class="join_line"></div>
		</div>
		<div class="member_join">
			<div class="">
				<form id=form name=joinForm method=post action="join_proc.carrot">
					

					<div class="field_head">

						<p class="sub">
							<span class="star">*</span>필수입력사항
						</p>
					</div>
					<div class="boardWrite">
						<table class="tbl_comm">
							<tr>
								<td class="memberCols1">아이디
									<p class="star">*</P>
								</td>
								<td class="memberCols2">
								<input type="text" name="id" value="" maxlength="16" label="아이디" placeholder="예: danngn2" id="id">
							
									<button type="button" class="btn_overlap" id="btn_overlap1">중복확인</button>
									
							</td>		
							</tr>
							
							<tr>
								<td></td>
								<td id="check_result" style="display:inline-block;"></td>
							</tr>
							
							<tr>
								<td class="memberCols1">닉네임
									<p class="star">*</P>
								</td>
								<td class="memberCols2">
								<input type="text" name="nick" value="" maxlength="16" label="닉네임" placeholder="예: 당근당근" id="nick">
							
									<button type="button" class="btn_overlap" id="btn_overlap2">중복확인</button>
									
							</td>		
							</tr>
							<tr>
								<td></td>
								<td id="nick_result" style="display:inline-block;"></td>
							</tr>
							<tr>
								<td class="memberCols1">비밀번호
									<p class="star">*</P>
								</td>
								<td class="memberCols2"><input type=password name="pass"
									maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요."
									id="pass"></td>
							</tr>
							<tr>
								<td class="memberCols1" style="width: 150px;">비밀번호확인
									<p class="star">*</P>
								</td>
								<td class="memberCols2"><input type=password name="cpass"
									maxlength="16" class="confirm_pw"
									placeholder="비밀번호를 한번 더 입력해주세요." id="cpass">
									</td>
							</tr>
							<tr>
							<td></td>
							<td class="password-success" id="password-success" style="color:blue; padding-top:8px">비밀번호가 일치합니다.</td>
							<td class="password-failed" id="password-failed" style="color:red; padding-top:8px">비밀번호가 일치하지 않습니다.</td>
						</tr>
							<tr>
								<td class="memberCols1">이름
									<p class="star">*</P>
								</td>
								<td class="memberCols2"><input type="text" name="name"
									value="" placeholder="예: 엄당근" id="name"></td>
							</tr>
							<tr>
								<td class="memberCols1">이메일
									<p class="star">*</P>
								</td>
								<td class="memberCols2"><input type="text" name="email"
									id="email" value="" size=30 placeholder="예: daangnmarket@daangn.com">

									<button type="button" class="btn_overlap" id="btn_overlap_email" onclick>이메일중복확인</button></td>
							</tr>
							<tr>
								<td></td>
								<td id="check_email_result" style="display:inline-block;"></td>
							</tr>
							<tr class="mobile">
								<td class="memberCols1">휴대폰
									<p class="star">*</P>
								</td>
								<td class="memberCols2">
									<div class="phone_num">
										<input type="text" value=""  name="phone"
											placeholder="전화번호를 입력해주세요." class="inp" id="phone">
										
									</div>
								</td>
							</tr>
							<tr class="address">
								<td class="memberCols1">주소
									<p class="star">*</P>
								</td>
								<td class="admin_address_btn">
									<button type="button" class="btn_address" id="btn_address">
										<img
											src="http://localhost:9000/daangn/resources/images/Search-icon.png"
											style="width: 15px; height: 15px; padding-right: 5px;">주소검색
									</button>
								</td>
							</tr>


							<tr>
								<td></td>
								<td>
									<!-- <input type="text" id="sample6_postcode" placeholder="우편번호"> -->
									<!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> -->

									<input type="text" id="sample6_address" placeholder="주소" name="address1"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2"> 
									<input type="hidden" value="" name="addr_sido" id="sido">
									<input type="hidden" value="" name="addr_sigungu">
									<input type="hidden" value="" name="addr_bname">
									<!-- 	<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
								</td>
							</tr>

							<tr class="select_sex">
								<td class="memberCols1">성별</td>
								<td class="memberCols2">
									<div class="group_radio">
										<label class="label_radio"> <input type=radio
											name=gender label="성별" value="남자" checked> <span
											class="text_position">남자</span>
										</label> <label class="label_radio"> <input type=radio
											name=gender label="성별" value="여자"> <span
											class="text_position">여자</span>
										</label> <label class="label_radio"> <input type=radio
											name=gender label="성별" value="선택안함"> <span
											class="text_position">선택안함</span>
										</label> <input type="hidden" type=radio name=sex label="성별" value="">
									</div>
								</td>
							</tr>
							<tr class="birth">
								<td class="memberCols1">생년월일</td>
								<td class="memberCols2">
									<div class="birth_day">
										<input type="text" name=birth_year id="birth_year" value=""
											label="생년월일" size=4 maxlength=4 placeholder="YYYY"
											style="width: 60px; padding-left: 25px; padding-top: 3px;">
										<span class="bar"><span>/</span></span> 
										
										<input type="text" name=birth_month id="birth_month" value="" label="생년월일" size=2
											maxlength=2 placeholder="MM" style="width: 60px; padding-top: 3px;"> 
											<span class="bar"><span>/</span> </span> 
											<input type="text" name=birth_day id="birth_day" value="" label="생년월일" size=2 maxlength=2 placeholder="DD"
											style="width: 60px; padding-top: 3px;">
									</div>

								</td>

							</tr>
							<input type="hidden" name="emailCheck" value="2" id="email_check"/>
							<input type="hidden" name="idCheck" value="2" id="id_check"/>
							<input type="hidden" name="nickCheck" value="2" id="nick_check"/>
						</table>
						<div class="btn_join_div">
							<button type="submit" class="btn_join1" id="btn_join">회원가입</button>
							<button type="reset" class="btn_join1" id="btn_join_reset">다시쓰기</button>
							<button type="button" class="btn_join1">뒤로가기</button>
							
						</div>
					</div>
				</form>
			
			</div>
		</div>
	</div>
	<div class="footer"></div>
	<!-- footer -->
	<%-- <c:import url="http://localhost:9000/daangn/footer.carrot" /> --%>
</body>
</html>