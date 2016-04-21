<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->



<link rel="stylesheet" href="assets/css/content.css">

<!-- ������ -->
<link href="resources/se/css/smart_editor2.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>


</head>
<body>

	<!-- Main -->
	<div id="main" class="wrapper style1">
		<div class="container">
			<header class="major">
				<!-- 					<h2>HTML5���� div�� float�� �ָ� wrapper�� ������ ���մϴ�.</h2>
					<p>#�±�. #�±�. #�±�</p> -->
				<h2>${d.subject }</h2>
				<p>#�±�. #�±�. #�±�</p>
			</header>

			<!-- Content -->
			<div id=mainbar>
				<section id="question">
					<div id="question" class="noanswerd qnacontent">

							<table border=0>
								<tr>
									<td width=15% align="right">
										<ul class=vote>
											<li><a href="#"><i class="fa fa-angle-up"></i></a></li>
											<li>0</li>
											<li><a href="#"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${d.content}</p>

										<p id="written">
											asked by whom <img src="assets/vote-up.png">
										<p>
									</td>
								</tr>

							</table>
						</div>
				</section>

				<section id="answers">
					<h3 class="content-h">�亯</h3>
					<%-- 			<jsp:include page="inner_content.jsp" /> --%>
					
						<div id="answer<%-- ${�亯��ȣ}  --%>" class="qnacontent" >

							<table border=0>
								<tr>
									<td width=15% align="right">
										<ul class=vote>
											<li><a href="#"><i class="fa fa-angle-up"></i></a></li>
											<li>0</li>
											<li><a href="#"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${d.content}</p>

										<p id="written">
											asked by whom <img src="assets/vote-up.png">
										<p>
									</td>
								</tr>

							</table>
						</div>

						<div id="anawers" class="isanswerd"></div>
					

					<div class="content-h">
						<h3>����� �亯�� �����ּ���.</h3>
						<!-- ������ -->
						<textarea name="ir1" id="ir1"
							style="width: 800px; height: 300px; display: none;"></textarea>

						<div class="col-sm-offset-8 col-sm-8">
							<input type="button" id="sndbtn" class="btn btn-default"
								value="�亯�ޱ�"> <input type="button"
								class="btn btn-default" onclick="javascript:history.back()"
								value="���">
						</div>

						<script>
							$(function() {
								//������������
								var editor_object = [];
								nhn.husky.EZCreator
										.createInIFrame({
											oAppRef : editor_object,
											elPlaceHolder : "ir1",
											sSkinURI : "resources/se/SmartEditor2Skin.html",
											htParams : {
												// ���� ��� ���� (true:���/ false:������� ����)
												bUseToolbar : true,
												// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
												bUseVerticalResizer : true,
												// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
												bUseModeChanger : false,
											}
										});
								//���۹�ư Ŭ���̺�Ʈ
								$("#sndbtn")
										.click(
												function() {
													//id�� smarteditor�� textarea�� �����Ϳ��� ����
													editor_object.getById["ir1"]
															.exec(
																	"UPDATE_CONTENTS_FIELD",
																	[]);
													// �̺κп� ������ validation ����
													//�� submit
													$("#frm").submit();
												})
							})
						</script>

					</div>

				</section>
			</div>

			<div id="sidebar">
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
			</div>
		</div>
	</div>


	<!-- tags scripts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/dist/bootstrap-tagsinput.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/dist/bootstrap-tagsinput/bootstrap-tagsinput-angular.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/examples/assets/app.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/examples/assets/app_bs3.js"></script>

</body>
</html>