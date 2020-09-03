<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet"/>
    <link href="../css/atemplate.css" rel="stylesheet" type="text/css"/>
    <link href="../css/butan.css" rel="stylesheet" type="text/css"/>
    <style rel="stylesheet" type="text/css">
    	h2, div{
    		text-align: center;
    	}
    </style>
	<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="../js/menu.js"></script>
	<script type="text/javascript">
		function validate() {
		   var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	       // 이메일이 적합한지 검사할 정규식

	       var id = document.getElementById("userId");
	       var pw = document.getElementById("password");
	       var name = document.getElementById("name");
	       var contact = document.getElementById("contact");
	       var email = document.getElementById("email");
	       if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
	           return false;
	       }
	       if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
	           return false;
	       }
	       if(name.value=="") {
	           alert("이름을 입력해 주세요");
	           name.focus();
	           return false;
	       }
	       if(contact.value=="") {
	           alert("전화번호를 입력해 주세요");
	           name.focus();
	           return false;
	       }
	       if(email.value=="") {
	           alert("이메일을 입력해 주세요");
	           email.focus();
	           return false;
	       }

	       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
	           return false;
	       }
		}
	       function check(re, what, message) {
	           if(re.test(what.value)) {
	               return true;
	           }
	           alert(message);
	           what.value = "";
	           what.focus();
	           //return false;
	       }
	</script>
</head>
<body>
<%@ include file="../template/adminheader.jspf" %>
<%@ include file="../template/adminmenu.jspf" %>
	<div id="content">
		<!--content start  -->
		<div class="content">
		  	<h2>관리자 입력</h2>
			<form method="post" onsubmit="return validate();">
				<div>
					ID<input type ="text" id="userId" name="userId" value="">
				</div>
				<div>
					PW:<input type ="password" id="password" name="password" value="">
				</div>
				<div>
					이름:<input type ="text" id = "name" name="name" value="">
				</div>
				<div>
					전화번호:<input type ="text" id="contact" name="contact" value="">
				</div>
				<div>
					Email:<input type ="text" id="email" name="email" value="">
				</div>
				<div>
					<select id="department" name="department">
						<option value="행정부" selected="selected">행정부</option>
						<option value="강사">강사</option>
						<option value="영업부">영업부</option>
						<option value="취업부">취업부</option>				
					</select>
				</div>
				<div>
					<select id="level" name="level">
						<option value="2" selected="selected">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>  
				<button class="buttn" type="submit"><a class="an">입력</a></button>
				<button class="buttn"><a class="an" href="alist.bit">뒤로</a></button>
			</form>
		</div>	
		<!--content end  -->
	</div>
<%@ include file="../template/adminfooter.jspf" %>
</body>
</html>