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
<title>PUBLIC CODING</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/content.css">

<!-- ������ -->
<link href="resources/se/css/smart_editor2.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script>
	$(function() {
		//������������
		var editor_object = [];
		nhn.husky.EZCreator.createInIFrame({
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
		$("#sndbtn").click(function() {
			//id�� smarteditor�� textarea�� �����Ϳ��� ����
			editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			// �̺κп� ������ validation ����
			//�� submit
			$("#frm").submit();
		})
	})
</script>

</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<header id="header">
			<h1 id="logo">
				<a href="common/main.jsp">p2</a>
			</h1>
			<nav id="nav">
				<ul>

					<li><a href="#">���Ǹ��</a>
						<ul>
							<li><a href="left-sidebar.html">Left Sidebar</a></li>
							<li><a href="right-sidebar.html">Right Sidebar</a></li>
							<li><a href="no-sidebar.html">No Sidebar</a></li>
							<li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul></li>
						</ul></li>

					<li><a href="#">�Խ���</a>
						<ul>
							<li><a href="left-sidebar.html">Left Sidebar</a></li>
							<li><a href="right-sidebar.html">Right Sidebar</a></li>
							<li><a href="no-sidebar.html">No Sidebar</a></li>
							<li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul></li>
						</ul></li>


					<li>
						<!-- <a href="member/signin.jsp"> --> <input
						onclick="popup_signin()" type="button" value="�α���"> <!-- �α���<!-- </a> -->
					</li>
					<!-- <li><a href="elements.html">Elements</a></li> -->
					<!-- <li><a href="member/signup.jsp" class="button special">Sign Up</a></li> -->
					<li id="pop1"><input onclick="popup_signup()" type="button"
						class="button special" value="ȸ������"></li>
				</ul>

			</nav>
		</header>


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
						<jsp:include page="inner_content.jsp" />
					</section>

					<section id="answers">
						<h3 class="content-h">�亯</h3>
						<jsp:include page="inner_content.jsp" />

						<div class="content-h">
							<h3>����� �亯�� �����ּ���.</h3>
							<!-- ������ -->
							<textarea name="ir1" id="ir1"
								style="width: 800px; height: 300px; display: none;"></textarea>

							<div class="col-sm-offset-8 col-sm-8">
								<input type="button" id="sndbtn" class="btn btn-default"
									value="�亯�ޱ�">
							</div>
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
		<!-- 	Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>

		</footer>
	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>

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