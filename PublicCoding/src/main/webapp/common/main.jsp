<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Public Coding</title>

<link type="text/css" rel="stylesheet" href="../assets/css/main.css">

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
		
	<section id="banner">
			<article class="content">
				<li>
					����1
					����2
				</li>
			</article>
			
			<article class="boardq">
				<li>
					����1
					����2
				</li>
			</article>
			
			<article class="boardf">
			<li>
					����1
					����2
				</li>
			</article>
			
			<article class="boards">
			<li>
					����1
					����2
				</li>
			</article>
			
			<article>
			</article>
				
	</section> 

		<!-- Footer -->
		<!-- <footer id="footer">
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
			
			
		</footer> -->

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
	
	<!-- ȸ������/�α��� �˾�â ���� -->	
	<script src="assets/js/popup.js"></script>
	<!-- �������������� ������/�̹��� ��ġ�� ��ũ��Ʈ -->
	<script type="text/javascript"	src="//cdn.jsdelivr.net/g/modernizr@2.7,respond@1.4,bootstrap@3.1,fittext@1.2"></script>

	

</body>
</html>