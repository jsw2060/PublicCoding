<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="user/movie/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
$(function(){
		$('.rdate').click(function(){
			var year=$(this).attr("year");
			var month=$(this).attr("month");
			var day=$(this).text();
			$('#span_date').text("������"+year+"-"+month+"-"+day);
			$('#day_jsp').val(year+"-"+month+"-"+day);
			sendMessage("POST", "reserve_time.do", null, timeInfo);
			
		});
});

function timeInfo(){
	if(httpRequest.readyState=4){
		if(httpRequest.status==200){
			$('#timei').html(httpRequest.responseText);
		}
	}
}

</script>
<title>Insert title here</title>


</head>
<body>
	<center>
		<h3>${year }�⵵ ${month } ��</h3>
		<table id="table_content" width=315>
			<tr>
				<td><select name="year">
						<c:forEach var="i" begin="2016" end="2020">
							<option ${year==i?"selected":""  }>${i }</option>
						</c:forEach>
				</select>�⵵&nbsp; <select name="month">
						<c:forEach var="i" begin="1" end="12">
							<option ${month==i?"selected":""  }>${i }</option>
						</c:forEach>
				</select>��</td>
			</tr>
		</table>
		<table id="table_content" width=305>
			<tr>
				<c:forEach var="wstr" items="${weekList }">
					<th>${wstr }</th>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="1" end="${lastDay }">
				<c:if test="${i==1 }">
					<tr>
						<c:forEach var="j" begin="1" end="${week }">

							<td class="tdcenter">&nbsp;</td>
						</c:forEach>
				</c:if>
				<c:if test="${i>=day }">
					<td class="tdcenter" bgcolor="#ccccff">
					<a href="#" year="${year }" month="${month }"  class="rdate">${i }</a>
						
					</td>
				</c:if>
				<c:if test="${i<day }">
					<td class="tdcenter">${i }</td>
				</c:if>
				<c:set var="week" value="${week+1 }" />
				<c:if test="${week>6 }">
					<c:set var="week" value="0" />
					</tr>
					<tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</center>
</body>
</html>