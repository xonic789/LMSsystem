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
	</script>
</head>
<body>
<%@ include file="../template/adminheader.jspf" %>
<%@ include file="../template/adminmenu.jspf" %>
	<div id="content">
		<!--content start  -->
		<div class="content">
		  	<h2>관리자 계정 수정</h2>
	
			
			<c:set var="bean" value="${bean}" />
			<form method="post">
				<div>
					<input type ="text" id="name" name="name" value="${bean.name}">
				</div>
				<div>
					<input type ="text" id="id" name="id" value="${bean.userId}" readonly="readonly">
				</div>
				<div>
					<input type ="text" id="password" name="password" value="${bean.password}">
				</div>
				<div>
					<input type ="text" id="contact" name=contact value="${bean.contact}">
				</div>
				<div>
					<input type ="text" id="email" name="email" value="${bean.email}">
				</div>
				<div>
					<select name="department">
						<option value="행정부" <c:if test="${bean.department eq '행정부'}">selected</c:if>>행정부</option>
						<option value="강사"<c:if test="${bean.department eq '강사'}">selected</c:if>>강사</option>
						<option value="영업부"<c:if test="${bean.department eq '영업부'}">selected</c:if>>영업부</option>
						<option value="취업부"<c:if test="${bean.department eq '취업부'}">selected</c:if>>취업부</option>				
					</select>

				</div>
				<div>
					<select name="level">
						<option value="2" <c:if test="${bean.level eq '2'}">selected</c:if>>2</option>
						<option value="3" <c:if test="${bean.level eq '3'}">selected</c:if>>3</option>
						<option value="4" <c:if test="${bean.level eq '4'}">selected</c:if>>4</option>
					</select>
				</div>  
				<button class="buttn" type="submit"><a class="an">수정</a></button>
				<button class="buttn" type="reset">삭제</button>
			</form>
		</div>	
		<!--content end  -->
	</div>
<%@ include file="../template/adminfooter.jspf" %>
</body>
</html>