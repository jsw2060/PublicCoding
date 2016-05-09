<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">

<!-- <link type="text/css" rel="stylesheet" href="../assets/css/userMain.css"> -->
<link type="text/css" rel="stylesheet" href="assets/css/studylist.css">
<title>Insert title here</title>
</head>
<body>
	<section>

		<div class="container">
		<header class="subheader">
						<div><h1 id="h-top-questions">�������� ���͵� </h1></div>
						<div style="padding-top: 7px;"><font color="#c8c8c8"><h4>�¶������δ� ������ �츮, �������� ���͵�� �����غ���.</h4></font></div>
						<%-- <div id="tabs">
							<a href="?order=1" data-nav-xhref=""
								
								data-value="interesting"
								<c:if test="${order==1}">class="youarehere"</c:if> > �ֽŵ��</a> <a href="?order=2"
								data-nav-xhref="" 
								data-value="featured" <c:if test="${order==2}">class="youarehere"</c:if>> 
								���� �����ڼ�
							</a>

						</div> --%>
					</header>
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="col-md-4" style="display: inline-block; float: left">
						<div class="well profile">
						<div id="studytitle">
							<h4>${vo.title }</h4>
							</div>
							<div class="col-sm-6 col-md-4 profilepic">

								<img src="${vo.poster}" alt="" width="120" height="180"
									class="img-rounded">


							</div>
							<div class="col-sm-6 col-md-7" style="margin-left: 20px">

								<table id="table_content" >

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
										<td id="span_inwon">�ּ��ο�: ${vo.maxpeople} (���� ${jnummap[vo.groupno]}��)</td>
									</tr>

									<tr>
										<td class="tdcenter">
											<form method="post" action="register_ok.do" id="res_frm">
												<input type="hidden" id="title_jsp" name="title"> <input
													type="hidden" id="meetno_jsp" name="meetno"> <input
													type="hidden" id="theater_jsp" name="theater"> <input
													type="hidden" id="day_jsp" name="day"> <input
													type="hidden" id="time_jsp" name="time"> <input
													type="hidden" id="loc_jsp" name="tno">

											</form>
										</td>
									</tr>
								</table>
							</div>
							<div>
								<div style="width: inherit;margin-left: 12px;">
									<table width="300">
										<tr>
											<td width="25%"><strong><font color="red"><i
														class="fa fa-heart" aria-hidden="true"></i></font>&nbsp;������:</strong></td>
											<td width="75%" id="span_joined">
												<div>
													
													<c:forEach var="d" items="${mjoinedmap[vo.groupno] }">
														<span><a href="userMain.do?mno=${d}"
															title="user���� ����"><img
																src="resources/userprofiles/${imgmapmap[vo.groupno][d]}" alt=""
																width="40" height="40" class="img-rounded"> </a> </span>
													</c:forEach>
													<input type="hidden" value="${ minp}">
												</div>
											</td>
										</tr>
									</table>
								</div>
								<button class="btn btn-success btn-block" onclick="window.location.href='studydetail.do?groupno=${vo.groupno }&min=${vo.maxpeople} '">
									<span class="fa fa-plus-circle"></span> �󼼺���
								</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>


	</section>

	<!-- <div>
		<table id="table_content" width="270" height=500>
			<tr>
				<th>��������</th>
			</tr>
			<tr>
				<td class="tdcenter" id="poster_div"></td>
			</tr>
			<tr>
				<td class="tdcenter" id="span_title"></td>
			</tr>
			<tr>
				<td id="span_tname">���:</td>
			</tr>
			<tr>
				<td id="span_date">��¥:</td>
			</tr>
			<tr>
				<td id="span_time">���͵� �ð�:</td>
			</tr>
			<tr>
				<td id="span_inwon">�ּ��ο�:</td>
			</tr>
			<tr>
				<td id="span_joined">������:</td>
			</tr>
			<tr>
				<td class="tdcenter">
					<form method="post" action="register_ok.do" id="res_frm">
						<input type="hidden" id="title_jsp" name="title"> <input
							type="hidden" id="meetno_jsp" name="meetno"> <input
							type="hidden" id="theater_jsp" name="theater"> <input
							type="hidden" id="day_jsp" name="day"> <input
							type="hidden" id="time_jsp" name="time"> <input
							type="hidden" id="loc_jsp" name="tno">

					</form> <img src="assets/img/res_d.png" border=0 id="resImg">
				</td>
			</tr>
		</table>
	</div>
 -->

</body>
</html>