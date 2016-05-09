<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="onoffmix/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<title>Insert title here</title>
</head>
<body>
	<center>
		<table id="table_content">
			<tr>
				<th>���͵� �̸�</th>
				<th>���</th>
				<th>�Ͻ�</th>
				<th>�ð�</th>
				<th>�ο�</th>
				<th>����Ȯ��</th>

			</tr>

			<C:forEach var="vo" items="${onoff }">
				<tr class="dataTr" id="m${vo.rno }" onclick="window.location.href='studydetail.do?groupno=${vo.groupno }&page=1'">
					<td class="tdcenter">${vo.title }</td>
					<td class="tdcenter">${vo.tname}(${vo.loc})</td>
					<td class="tdcenter">${vo.meetdate }</td>
					<td class="tdcenter">${vo.meettime }</td>
					<td class="tdcenter">${vo.maxpeople }</td>
					<td class="tdcenter">${vo.res_check==0?"���":"Ȯ��" }</td>
				</tr>
				
			</C:forEach>
		</table>
	</center>
</body>
</html>















