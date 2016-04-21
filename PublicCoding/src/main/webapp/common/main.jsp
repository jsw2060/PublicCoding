<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Public Coding</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<link type="text/css" rel="stylesheet" href="assets/css/test.css">
<link type="text/css" rel="stylesheet" href="assets/css/uu.css">
<link type="text/css" rel="stylesheet" href="assets/css/main.css">
<!-- <link type="text/css" rel="stylesheet" href="assets/css/main2.css"> -->
</head>
<body class="landing">


	<div id="page-wrapper">

		<header id="header">
			<h1 >
				<a href="main.do">
						PUBLIC CODING
				</a>
			</h1>
			<!-- �޴��� -->
			<nav id="nav">
			
				<ul>
					<c:if test="${sessionScope.id==null }">
					<li>
						<!-- <a href="member/signin.jsp"> --> <input
						onclick="popup_signin()" type="button" value="�α���"> <!-- �α���<!-- </a> -->
					</li>
					<!-- <li><a href="elements.html">Elements</a></li> -->
					<!-- <li><a href="member/signup.jsp" class="button special">Sign Up</a></li> -->
					<li id="pop1"><input onclick="popup_signup()" type="button"
						class="button special" value="ȸ������"></li>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
						<%-- <li><input type="button" value="${sessionScope.id}"></li> --%>
						<div class="btn-group open">
							<a class="btn btn-default" href="#"><i
								class="fa fa-user fa-fw"></i> ${sessionScope.id}</a> <a
								class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
								href="#"> <span class="fa fa-caret-down"
								title="Toggle dropdown menu"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-pencil fa-fw"
										aria-hidden="true"></i> Edit</a></li>
								<li><a href="#"><i class="fa fa-trash-o fa-fw"
										aria-hidden="true"></i> Delete</a></li>
								<li><a href="#"><i class="fa fa-ban fa-fw"
										aria-hidden="true"></i> Ban</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-unlock"
										aria-hidden="true"></i> Make admin</a></li>
							</ul>
						</div>
					</c:if>
				</ul>
			</nav>
		
		
		
		
		</header>

		<!-- ����������(������1) -->
		
	<!-- 	<section id="banner">
			<div class="content">				
				<span class="image">
					<img src="resources/images/main1.jpg" alt="" />
				</span>
			</div>
		
			<div class="content">
				<span class="image">
					<img src="resources/images/main2.jpg" alt="" /> 
				</span>
			</div>
				
		</section> -->
		



		<!-- src="//player.vimeo.com/external/118607115.hd.mp4?s=53f507d4e1144f6af7b8188e680c8dcb" -->
		<section class="hero viewport-height" id="hero">
			<div id="video" class="full-height">
				<div class="video-wrapper">
					<video autoplay width="100%" height="auto" preload="auto" loop>
						<source src="resources/images/main.mp4" type="video/mp4">
					</video>
				</div>
			</div>
			<div class="options" id="department-options">
				<div class="option">
					<a href="videolist.do" class="wrap">
						<h2>
							FREE <br>& Programming Study
						</h2>
						<h3>����� ���α׷����� �����ϼ���.</h3>
							<div class="btn btn-default">���α׷��� ���</div><br>
							
							<div class="btn btn-default" href="//www.naver.com">�����ͺ��̽�</div>
							
							<br>
							<div class="btn btn-default">WEB</div>
						<div class="details">
							
						</div>
						
					</a>
				</div>
				<div class="option">
					<a href="boardmain.do" class="wrap">
						<h2>
							Share <br>& your Knowledge
						</h2>
								<h3>���α׷������������𸣴°ſ��������</h3>
							<div class="btn btn-default">Q&A �Խ���</div><br>
							<div class="btn btn-default">�����Խ���</div><br>
							<div class="btn btn-default">�ҽ� ����</div>
						<div class="details">
					
						</div>
					</a>
				</div>
			</div>	 

		<!-- Footer -->
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
				<li>&copy;Copyright by SIST-C2.</li>

	

			</ul>
			
			
		</footer>

	</div>

	<!-- Scripts -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/modal.js"></script>
	
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.onvisible.min.js"></script>
	<script src="assets/js/main2.js"></script>
	
	<!-- ȸ������/�α��� �˾�â ���� -->	
	<script src="assets/js/popup.js"></script>
	<!-- �������������� ������/�̹��� ��ġ�� ��ũ��Ʈ -->
	<script type="text/javascript"	src="//cdn.jsdelivr.net/g/modernizr@2.7,respond@1.4,bootstrap@3.1,fittext@1.2"></script>

	

</body>
</html>