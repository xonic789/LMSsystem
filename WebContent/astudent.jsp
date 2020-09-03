<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.model.dto.StudentDto, com.bit.model.dto.ClassDto, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/butan.css"/>
<link rel="stylesheet" type="text/css" href="../css/atemplate.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet"/>
<style rel="stylesheet" type="text/css">
	
	#content{
		margin-top:100px;
		text-align: center;
		width: 1000px;
	}
	#search2{
		width: 250px;
	}
	input{
		margin-top:10px;
	}
	.pages{
		text-decoration: none;
		color: gray;
	}
	
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/buttonjs.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#back').on('click',function(){
		window.history.back();
	});
	
	$('#searchbtn').click(function(){
		var search1 = ($('#search1').val());
		var search2 = ($('#search2').val());
	
		location.href="http://localhost:8080/LMSsystem/admin/astudent.bit?search1=" + search1 + 
		 "&search2=" + search2;
		
	});
	
	$('#search2').keydown(function(event){
	     if(event.keyCode == 13){
	       $('#searchbtn').click();
	     }
	});
	
});

function removeCheck() {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	     document.removefrm.submit();
	 }else{   //취소
	     return false;
	 }
}
</script>
</head>

<body>
<%@ include file="../template/adminheader.jspf" %>
<%@ include file="../template/adminmenu.jspf" %>

<div id="content">
<!-- content start -->
	<h2>학생 관리 페이지</h2>
	<select id="search1">
		<option value="">반 선택</option>
	<c:forEach items="${classList}" var="classList">
		<option value="${classList.classIdx }" 
		<c:if test="${search1 eq classList.classIdx }"> selected</c:if>>
		${classList.classTitle }</option>
	</c:forEach>
	</select>
	
	<input type="text" placeholder="교육과정명 or 과목명을 검색하세요." id="search2" <c:if test="${search2 ne null }"> value="${search2 }"</c:if>/>
	<button type="button" class="buttn" id="searchbtn" style="cursor: pointer;">검색</button>
	
	<form method="post">
	<table class="table">
	 <tr class="title row">
		<th class="thd" style="width:50px;">선택</th>
	 	<th class="thd">수강 과정명</th>
	 	<th class="thd" style="width: 100px;">이름</th>
	 	<th class="thd">연락처</th>
	 </tr>
	 	<c:forEach items="${studentList }" var="bean">
		<tr class="row">
		<c:url value="astudentdetail.bit" var="detail">
			<c:param name="studentIdx" value="${bean.studentIdx }"/>
		</c:url>
			<td class="tsub"><input type="radio" name="selectedStudent" value="${bean.studentIdx }" /></td>
			<td class="tsub"><a href="${detail }" class="an">${bean.classTitle }</a></td>
			<td class="tsub"><a href="${detail }" class="an">${bean.name }</a></td>
			<td class="tsub"><a href="${detail }" class="an">${bean.contact }</a></td>
		</tr>
		</c:forEach>
	</table>
	
	 <div class="bt">
	 	<button type="button" class="buttn" id="back" style="cursor: pointer;">뒤로</button>
	 	<button type="submit" class="buttn" onclick="removeCheck()">삭제</button>
	 </div>
	 </form>
	
	 <div style="text-align:center;">
	 <c:if test="${startPage ne 1 }"><a href=astudent.bit?search1=${search1 }&search2=${search2 }&nowPage=${nowPage-1}" class="pages">[이전]</a></c:if>
	  <c:forEach var="i" begin="0" end="4" step="1">
	 <a href="astudent.bit?search1=${search1 }&search2=${search2 }&nowPage=${startPage+i}" class="pages" 
	 		<c:if test="${startPage+i eq nowPage }"> style="text-decoration: underline;"</c:if>>${startPage+i}</a>
	 </c:forEach>
	 <c:if test="${(lastPage - startPage) > 5 }"><a href="astudent.bit?search1=${search1 }&search2=${search2 }&nowPage=${nowPage+1} class="pages">[다음]</a></c:if>
	 </div>
<!-- content end -->
</div>

<%@ include file="../template/adminfooter.jspf" %>
</body>
</html>