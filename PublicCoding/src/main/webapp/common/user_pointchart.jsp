<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<script type="text/javascript">
	$(function() {
		var regdate = <fmt:formatDate value="${vo.mdate}" pattern="yyyy-MM-dd" />;
		var chart = new Highcharts.Chart({
			chart : {

				renderTo : 'chart'
			},

			title : {
				text : '���� ȹ�� ��Ȳ',
				x : -20
			//center
			},
			subtitle : {
				text : '������~���� ',
				x : -20
			},
			xAxis : {
				categories: ['������',
				               <c:forEach var="vo" items="${datelist}">
				              ' <c:out value="${vo}"/>',
				               </c:forEach>]
			 /* ��¥  */ 
            /*    ' <c:out value="${vo.mdate}"/>',
               <c:forEach var="vo" items="${datelist}">
               '<c:out value="${vo}"/>',
               </c:forEach> */
			},
			yAxis : {
				title : {
					text : '����'
				},
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080'
				} ]
			},
			tooltip : {
				valueSuffix : '��'
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle',
				borderWidth : 0
			},
			series : [
					{
						name : '<c:out value="${vo.mid}"/>',
						 data: [0,
					               <c:forEach var="vo" items="${pointlist}">
					               /* '<c:out value="${vo}"/>'  */
			               <c:out value="${vo}"/>,
					               </c:forEach>
						        ]
					} ]
		});
	});
</script>
</head>
<body>
	<div id="chart" style="width: 600px; height: 400px; margin-left:30px; float:left;" ></div>
	 <h3 >&nbsp;&nbsp;���� ȹ�� ����</h3>
	<div id="point_table" style="overflow: auto; min-width: 400px; height: 400px; margin: 0;  margin-right:50px; padding-left:20px">
		<table>
			
			<c:forEach var ="vo" items="${scorelist}">
			<tr>
				<td width=30%><fmt:formatDate value="${vo.sdate}" pattern=" MM�� dd��" /></td>
				<td width=70%>${vo.message}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>