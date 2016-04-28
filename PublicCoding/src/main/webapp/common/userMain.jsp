<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">
</head>

<body>
	<section>
		<article>
<%-- <<<<<<< HEAD
			<div class="text" id="content">
						<div class="avatar-card">
				<div class="avatar">
					<a href="#">
						<div class="gravatar-wrapper-164">
							<c:if test="${vo.filesize==0 }">
							<img src="resources/userprofiles/defaultprofile.jpg"
								alt width="300" height="300" class="avatar-user">
								</c:if>
						</div>
					</a>
				</div>
				<div id="score">
					<span id="grade" title="����"></span>${vo.mpoint } ��
				</div>
		<input type="button"
								class="btn btn-default" name="list" id="list" onclick="window.location.href='user_update.do?mno=${sessionScope.mno }'"
								value="����" size=50>
			</div>
				<div id="profile_wrapper">
				<!-- <div id="description">
					<h2>loveyk.eun</h2>
					<ul id="descr">
						<li>����: �ֿ뱳������</li>
						<li>���ɻ�: JAVA</li>
						<li>�ϰ���� ��: ��� �ϸ� �ڹ� ����� �� �� �ֳ���?</li>
					</ul>
				</div> -->
				<div id="info-summary">
				<h2>${vo.mid }</h2>
					<div class="u_num">
						<div class="u_num_answers">
							<div class="mini-counts">
								<span title="�亯 ����">0</span>
							</div>
							<div>�亯��</div>
						</div>
						<div class="u_num_question">
							<div class="mini-counts">
								<span title="������">0</span>
							</div>
							<div>������</div>
						</div>

						<div class="u_num_lectures">
							<div class="mini-counts">
								<span title="�������� ��">0</span>
							</div>
							<div>������</div>
						</div>

					</div>
					<div>
						<ul>
							<li><i class="fa fa-sign-in" aria-hidden="true">&nbsp;������: 
							<fmt:formatDate value="${vo.mdate}" pattern="yyyy�� MM�� dd��"/>
							</i></li>
							<li><i class="fa fa-github" aria-hidden="true">&nbsp;Github:</i></li>
							<li><i class="fa fa-eye" aria-hidden="true">&nbsp;����Ʈ ��</i></li>
							<li><i class="fa fa-clock-o" aria-hidden="true">&nbsp;�ֱ� ���ӽð� ${login }</i></li>
						</ul>
					</div>
				</div>
			</div>
======= --%>
			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
						<div class="well profile">
							<div class="col-sm-6 col-md-4 profilepic" >
							<c:if test="${vo.filesize==0 }">
							<img src="resources/userprofiles/defaultprofile.jpg"
								alt="" width="160" height="140" class="img-rounded">
								<div id="modifybtn">
								<input type="button"
								class="btn btn-default" name="list" id="list" onclick="window.location.href='user_update.do?mno=${sessionScope.mno }'"
								value="����" size=50></div>
								</c:if>
<!-- 								<img src="http://img.visualdive.co.kr/sites/2/2015/10/gisa2.jpg"
									alt="" width="160" height="140"
									class="img-rounded" />
 -->							</div>
							<div class="col-sm-6 col-md-8">
<<<<<<< HEAD
								<h4>${sessionScope.id }</h4>
=======
								<h3>${vo.mid }</h3>
>>>>>>> refs/remotes/origin/master
								<p>
									<i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;${vo.memail } <br />
									<i class="glyphicon glyphicon-gift"></i>&nbsp;������: <fmt:formatDate value="${vo.mdate}" pattern="yyyy�� MM�� dd��"/><br /> 
									<i class="glyphicon glyphicon-globe"></i> &nbsp;www.jquery2dotnet.com <br /> 
									<i class="fa fa-eye" aria-hidden="true">&nbsp;����Ʈ ��:</i><br /> 
									<i class="fa fa-clock-o" aria-hidden="true">&nbsp;�ֱ� ���ӽð�: ${login }</i><br /> 
									
									<p><strong><font color="red"><i class="fa fa-heart" aria-hidden="true"></i></font>&nbsp;favorite: </strong>
                        <span class="tags">html5</span> 
                        <span class="tags">css3</span>
                        <span class="tags">jquery</span>
                        <span class="tags">bootstrap3</span>
                    </p>
									
									
								<br /><br /><br />
							</div>
							<div class="col-xs-12 divider text-center">
								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong> ${vo.mpoint }  </strong>
									</h2>
									<p>
										<small>PUCO����</small>
									</p>
									<button class="btn btn-success btn-block">
										<span class="fa fa-plus-circle"></span> �亯 ����
									</button>
								</div>

								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong>245</strong>
									</h2>
									<p>
										<small>������</small>
									</p>
									<button class="btn btn-info btn-block">
										<span class="fa fa-user"></span> ���� ����
									</button>
								</div>

								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong>245</strong>
									</h2>
									<p>
										<small>��������</small>
									</p>
									<button class="btn btn-info btn-block">
										<span class="fa fa-user"></span> �������� ����
									</button>
								</div>

							</div>
						</div>
					</div>
				</div>
<!-- //>>>>>>> refs/remotes/origin/master -->
			</div>
		</article>

		<article>
			<div id='calendar'>calendar</div>
		</article>

		<article>
			<div class="text">
				<span>���� �� ��</span>
				<div id="u_qalist">
				<h3>������ �亯</h3>
				<table>
					<tr><td>How can I make an instance of a block of Blockly with
						Javascript?</td></tr>
					<tr>	<td>Grocery CRUD Join tabl</td></tr>
					<tr><td>Apache folder not showing up</td></tr>
					<tr><td>How can I make an instance of a block of Blockly with
						Javascript?</td></tr>
					<tr><td>Grocery CRUD Join table</td></tr>
					<tr><td>Apache folder not showing up</td></tr>
				</table>
			</div>
			</div>
		</article>

		<article>
			<div class="text">
				<span>�湮Ƚ��</span>
			</div>
		</article>

		<article>
			<div class="text">
				<span>���� ���͵� ����</span>
			</div>
		</article>

		<article>
			<div class="footer">
				<ul class="icons">
					<li><a href="#">about us</a></li>
				</ul>

				<ul class="copyright">
					<li>&copy;Copyright by SIST-C3.</li>
				</ul>

			</div>
		</article>

	</section>


	<!-- Scripts -->

	<script type='text/javascript'>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2016-01-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2016-01-01'
				},
				{
					title: 'Long Event',
					start: '2016-01-07',
					end: '2016-01-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-01-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-01-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-01-11',
					end: '2016-01-13'
				},
				{
					title: 'Meeting',
					start: '2016-01-12T10:30:00',
					end: '2016-01-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-01-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-01-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-01-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-01-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-01-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2016-01-28'
				}
			]
		});
		
	});
	</script>


</body>
</html>