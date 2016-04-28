<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PUBLIC CODING | 모두가 즐기는 코딩</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="lectures.css">
</head>
<body>

	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<div class="panel-group" id="accordion">
						
							<c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne">
												<i class="fa fa-code"></i>${d.dname }</a>
										</h4>
									</div>
									
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
												<c:forEach var="s" items="${slist }">
													<tr>
														<td>	<a href="#">${s.sname }</a></td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</c:forEach>
						
							<!-- <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">
											<i class="fa fa-code"></i> 언어</a>
									</h4>
								</div>
								
								<div id="collapseOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td>	<a href="#">자바</a></td>
											</tr>
											
											<tr>
												<td>	<a href="#">C/C++</a></td>
											</tr>
											
											<tr>
												<td>	<a href="#">Ruby</a></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo">
												<i class="fa fa-database"></i> 데이터베이스</a>
									</h4>
								</div>
								
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td><a href="#">데이터베이스 기초</a></td>
											</tr>
											
											<tr>
												<td><a href="#">Oracle</a></td>
											</tr>
											
											<tr>
												<td><a href="#">My SQL</a></td>
											</tr>
											
										</table>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree"> <i class="fa fa-css3"></i> WEB/HTML/CSS</a>
									</h4>
								</div>
								
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td><a href="#">WEB</a></td>
											</tr>
											
											<tr>
												<td><a href="#">HTML</a></td>
											</tr>
											
											<tr>
												<td><a href="#">CSS</a></td>
											</tr>
											
											<tr>
												<td><a href="#">Jquery</a></td>
											</tr>
											
										</table>
									</div>
								</div>
							</div> -->
							
						</div>
					</div>
				</div>
			</div>
		</article>

		<article>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</article>


		<article>
			<div class="text">
				<span>동영상들~~~</span>
			</div>
		</article>

	</section>


	<!-- Scripts -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>

	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/modal.js"></script>


	<!-- 회원가입/로그인 팝업창 띄우기 -->
	<script src="../assets/js/popup.js"></script>
	<!-- 메인페이지에서 동영상/이미지 겹치는 스크립트 -->
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/g/modernizr@2.7,respond@1.4,bootstrap@3.1,fittext@1.2"></script>


	<script type="text/javascript">
		$(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).fadeIn("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			}, function() {
				$('.dropdown-menu', this).stop(true, true).fadeOut("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			});
		});
	</script>


</body>
</html>