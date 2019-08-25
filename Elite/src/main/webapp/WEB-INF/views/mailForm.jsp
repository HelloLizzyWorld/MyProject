<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://localhost:9000/daangn/resources/js/jquery-3.3.1.min.js"></script>
<style>
	div.admin{
		width: 1050px;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	form.mailForm{
		margin-left:70px;
	}
	form.mailForm div span.message_tit{
		margin-top:40px;
		margin-left:400px;
		font-size:26px;
		border-bottom : 6px solid #f76707;  
		padding-bottom:10px;
		display:inline-block;
		
	}
	li.email_tit{
		margin-top:50px;
		font-size:20px;
	}
	
	li input#email,li input#title{
		margin-top:5px;
		border:1px solid #cccccc;
		display:block;
		width:900px;
		height:38px;
		padding:6px;
	}
	
	li.title_tit{
	margin-top:20px;
	font-size:20px;
	
	}
	li.message_tit{
	margin-top:20px;
	font-size:20px;
	}
	
	li textarea#message{
		margin-top:5px;
		border:1px solid #cccccc;
		display:block;
		width:908px;
		height:200px;
		padding-top:10px;
		padding-left:6px;
		resize:none;
	}
 	li.btn_send input.btn{
 		border:none;
 		background-color:black;
 		color:white;
 		width:915px;
		height:48px;
		cursor:pointer;
		font-size:17px;
		padding:6px;
		
 		}
 		li.btn_send{
 		margin-top:30px;
 		margin-bottom:150px;
 		}
 		li.btn_send input.btn:hover{
 		background-color:#f76707;
 		}
 	
</style>
<title>메일 보내기</title>

</head>
<body>
<div class="admin">
	<form action="mailSending.carrot" method="post" class="mailForm">
		<div>
		<span class="message_tit">Message</span>
		</div>
		
		<ul>
			<li class="email_tit"><label>Email</label>
			  <input type="text" name="tomail" placeholder="이메일을 입력해주세요." class="form-control" id="email" value="${mail}" >
			  
			</li>
				
			<li class="title_tit"><label>Title</label>
			<input type="text" name="title"placeholder="제목을 입력해주세요." class="form-control" id="title">
			</li>
			
			<li class="message_tit"><label>Message</label>
			<textarea name="content" placeholder="내용을 입력해주세요." class="form-control" id="message" ></textarea>
			</li>
			<li class="btn_send">
			<a href="http://localhost:9000/daangn/admin_member.carrot"><input type="submit" value="send" class="btn btn-warning"></a>
			</li>
		</ul>
	
	</form>


</div>

</body>
</html> 