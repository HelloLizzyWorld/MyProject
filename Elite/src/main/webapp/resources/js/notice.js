$(document).ready(function(){
			
	/* 상단바 선택 및 페이지 변경 */
	$('.clicks a').click(function(){

				var sqn = $(this).index();
				if ($(this).index() == 0) {
					$(this).addClass(' active').siblings().removeClass(' active');
					$(this).siblings().removeClass(' support');
				} else {
					$(this).addClass(' active').siblings().removeClass(' active');
					$(this).prev().addClass(' support').siblings().removeClass(' support');
				}

				$('.contents').each(function() {
					if (sqn == $(this).index()) {
						$(this).show();
					} else {
						$(this).hide();
					}
				})
			})
	
	/* 자주묻는 질문, 답변 */
	$("#question1").click(function(){
		$("#answer1").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer1").click(function(){
		$("#answer1").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question2").click(function(){
		$("#answer2").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer2").click(function(){
		$("#answer2").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question3").click(function(){
		$("#answer3").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer3").click(function(){
		$("#answer3").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question4").click(function(){
		$("#answer4").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer4").click(function(){
		$("#answer4").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question5").click(function(){
		$("#answer5").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer5").click(function(){
		$("#answer5").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question6").click(function(){
		$("#answer6").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer6").click(function(){
		$("#answer6").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question7").click(function(){
		$("#answer7").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer7").click(function(){
		$("#answer7").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#question8").click(function(){
		$("#answer8").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	$("#answer8").click(function(){
		$("#answer8").toggle();
		$("#question1").toggle();
		$("#question2").toggle();
		$("#question3").toggle();
		$("#question4").toggle();
		$("#question5").toggle();
		$("#question6").toggle();
		$("#question7").toggle();
		$("#question8").toggle();
	});
	
	
	/* 문의내용 확인 */
	$(".btn_notice_answer").click(function(){
		$(".notice_answer_table").hide();
		$(".notice_answer_table2").show();
	});
	$(".btn_back_answer").click(function(){
		$(".notice_answer_table2").hide();
		$(".notice_answer_table").show();
	});
});