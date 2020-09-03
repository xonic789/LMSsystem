<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.model.dto.StudentDto, java.util.ArrayList, java.text.SimpleDateFormat, java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	#etc{
		padding:0px;
		height: 50px;
		
	}
	input{
		margin-top: 10px;
	}
	
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/buttonjs.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#back').on('click',function(){
		window.history.back();
	});
	
	$('#enrollSubject').click(function(){
		$('.subject').val($('#subjectText').val());
	});

});

function checkInput(form) {
	  var valid = true;
	  $('input').each(function(){
		  if($(this).val()==''){
			$(this).focus();
	    	valid = false;
	    	return false;
		  }
	  });
	  if (!valid) alert("빈칸을 채워 주세요");
	  return valid;
	}

</script>
</head>

<body>
<%@ include file="../template/adminheader.jspf" %>
<%@ include file="../template/adminmenu.jspf" %>

	<%
		Object classIdx = request.getAttribute("classIdx");
		String classTitle = (String)request.getAttribute("classTitle");
		ArrayList<StudentDto> list = (ArrayList<StudentDto>)request.getAttribute("list");
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String now = format1.format(time);

		pageContext.setAttribute("now", now);
		pageContext.setAttribute("list", list);
	%>

<div id="content">
<!-- content start -->
	<h2>성적 수정 페이지 - ${classTitle }</h2>
	
	
	<input type="text" placeholder="과목명을 입력해주세요." id="subjectText" />
	<button type="button" class="buttn" id="enrollSubject" style="cursor: pointer;">적용</button>
	
	<form method="post" onsubmit="return checkInput(this);">
	<input type="hidden" name="classIdx" value="${classIdx }">
	<input type="hidden" name="classTitle" value="${classTitle }">
	<table class="table">
	
	 <tr class="title row">
	 	<th class="thd">학생이름</th>
	 	<th class="thd">과목명</th>
	 	<th class="thd">시험일</th>
	 	<th class="thd">점수</th>
	 </tr>
	 	<c:forEach items="${list }" var="bean">
	 	<input type="hidden" name="student${bean.studentIdx }" id="student${bean.studentIdx }" value="${bean.studentIdx }" />
		<tr class="row">
			<td class="tsub"><input type="text" value="${bean.name }" readonly/></td>
			<td class="tsub"><input type="text" name="subjectTitle${bean.studentIdx }" class="subject" /></td>
			<td class="tsub"><input type="date" name="testDate${bean.studentIdx }" min="2019-01-01" max="${now }" value="${now }"/></td>
			<td class="tsub"><input type="text" class="textScore"  name="score${bean.studentIdx }" /></td>
		</tr>
		</c:forEach>
	</table>
	
	 <div class="bt">
	 	<button type="button" class="buttn" id="back" style="cursor: pointer;">뒤로</button>
	 	<button type="submit" class="buttn" style="cursor: pointer;">입력</button>
	 </div>
	 </form>
<!-- content end -->
</div>

<%@ include file="../template/adminfooter.jspf" %>
</body>
</html>