<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="user/movie/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
$(function(){
	
		var time = $(this).text();
		
		//$('#span_inwon').text("�ּ��ο�: "+minp+"(����:"+jnum+")");
 		$('#span_inwon').text("�ּ��ο�: "+<c:out value="${minp}"/>); 
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
						$('#res_frm').submit();
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
<title>Insert title here</title>
</head>
<body>
	<div>������: ${jnum} ��
	<c:forEach var="d" items="${mjoined }">
		<span><a href="userMain.do?mno=${d}" title="user���� ����"><img src="resources/userprofiles/${imgmap[d]}"
								alt="" width="40" height="40" class="img-rounded"> </a> </span>
		</c:forEach>
	<input type="hidden" value="${ minp}">
	</div>
</body>
</html>

