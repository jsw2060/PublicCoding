<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
$(function(){
	
		var mno="<c:out value="${sessionScope.mno}"/>";
		
	$('#resImg').click(function(){
		var src = $('#resImg').attr("class");
		if(src=="btn btn-block disabled"){
			return;
		}
		if(mno==""){
			alert("�α��� �� �̿����ּ���.");
			return;
		}
		else{
			//alert("���Ž���")
			$('#isfirst_jsp').val(<c:out value="${jnum}"/>);
			if (confirm("��û�Ͻðڽ��ϱ�?") == true){    //Ȯ��
				
				$('#res_frm').submit();
			}else{   //���
			    return;
			}			
			
		}
		
	});
});

function inwondInfo(){
	if(httpRequest.readyState=4){
		if(httpRequest.status==200){
			$('#res_inwon').html(httpRequest.responseText);
		}
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="onoffmix/table.css">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table id="table_content" width="900" height=500>
			<tr>
				<th colspan="3">��������</th>
			</tr>
			<tr>
				<td class="tdcenter" id="span_title" colspan="3"><h3>${vo.title }</h3></td>
			</tr>
			<tr>
				<td class="tdcenter" id="poster_div" rowspan="7"><img
					src="${vo.poster}" alt="" width="200" height="300"
					class="img-rounded"></td>
			</tr>
			<tr>
				<td rowspan="4">
					<p>���͵𼳸��Դϴ�~~</p>
				</td>
			</tr>
			<!-- <tr>
				<td rowspan="7">
				<div id="map" style="width: 200px; height: 200px;"></div>
				</td>
			</tr> -->
			<tr>
				<td id="span_tname">���: ${vo.tname} (${vo.loc})</td>
			</tr>
			<tr>
				<td id="span_date">��¥: ${vo.meetdate}</td>
			</tr>
			<tr>
				<td id="span_time">���͵� �ð�: ${vo.meettime}</td>
			</tr>
			<tr>
				<td id="span_inwon" rowspan="2">�ּ��ο�: ${vo.maxpeople} (���� ${jnum}��)</td>
			</tr>
			<tr>
				<td >
					<div id="map" style="width: 200px; height: 200px;"></div>
				</td>
			</tr>
			<tr>
				<td id="span_joined">������:
					<div>

						<c:forEach var="d" items="${mjoined }">
							<span><a href="userMain.do?mno=${d}" title="user���� ����"><img
									src="resources/userprofiles/${imgmap[d]}" alt="" width="40"
									height="40" class="img-rounded"> </a> </span>
						</c:forEach>
						<input type="hidden" value="${ minp}">
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="tdcenter" colspan="2">
					<form method="post" action="register_ok.do" id="res_frm">
						 <input type="hidden" id="meetno_jsp" name="meetno" value="${ vo.meetno}"><input
							type="hidden" id="day_jsp" name="day" value="${ vo.meetdate}"> <input
							type="hidden" id="time_jsp" name="time" value="${ vo.meettime}"> <input
							type="hidden" id="loc_jsp" name="tno" value="${ vo.tno}"> <input
							type="hidden" id="isfirst_jsp" name="jnum" value="${ jnum}">
					</form> <!-- <img src="assets/img/res_d.png" border=0 id="resImg"> -->
					<button class="btn btn-success btn-block " id="resImg">
						<!-- btn btn-success btn-block -->
						<span class="fa fa-plus-circle"></span> �����ϱ�
					</button>
					
				</td>
				<td><button class="btn btn-default btn-block " id="back" onclick="javascript:history.back()">
						<!-- btn btn-success btn-block -->
						<span class="fa fa-minus-circle"></span> ���ư���
					</button></td>
			</tr>
		</table>

	</center>

	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=99c036c2f0f9f7cf0da349dbdfb62c19"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(<c:out value="${x}"/>,
					<c:out value="${y}"/>),
			level : 4
		};

		var map = new daum.maps.Map(container, options);
	</script>

</body>
</html>