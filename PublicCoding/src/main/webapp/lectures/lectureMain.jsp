<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="lectures/lectures.css">
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
												href="#collapse${d.dno}">
												<c:if test="${d.dno == 1 }">
												<i class="fa fa-code"></i>${d.dname }</a>
												</c:if>
												<c:if test="${d.dno == 2 }">
												<i class="fa fa-database"></i>${d.dname }</a>
												</c:if>
												<c:if test="${d.dno == 3 }">
												<i class="fa fa-css3"></i>${d.dname }</a>
												</c:if>
										</h4>
									</div>
									
									
									<div id="collapse${d.dno}" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
											<c:forEach var="sl" items="${slist }">
												<c:forEach var="s" items="${sl }">
													<c:if test="${d.dno == s.dno }">
														<tr>
															<td><a href="courseGroup.do?sno=${s.sno }">${s.sname }</a></td>
														</tr>
													</c:if>
												</c:forEach>
											</c:forEach>	
											</table>
										</div>
									</div>
									
								</div>
							</c:forEach>
							
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
				<span>�������~~~</span>
				<div class="row">
										<!-- begin="1" end="${fn:length(glist)}" -->
	                <c:forEach var="g" items="${glist}">
	                	
	                    <div class="col-sm-3 col-lg-3 col-md-3">
	                        <div class="thumbnail hthumbnail">
	                            <img src="${g.gimageurl}">
	                            <div class="caption">
	                                <h4 class="pull-right">���Ǹ�:${g.gname }</h4>
	                                <p><a href="play.do?gno=${g.gno }" style="color: red;">${g.gintro }<br>
	                               	 �Ѱ��Ǽ�:${g.totalcno }��</a></p><!-- rgb(171,164,234) -->
	                            </div>
	                            <div class="ratings">
	                                <p class="pull-right">15 reviews</p>
	                                <p>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                    <span class="glyphicon glyphicon-star"></span>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                    
	                 </c:forEach>
	            </div>
			</div>
		</article>

	</section>

</body>
</html>