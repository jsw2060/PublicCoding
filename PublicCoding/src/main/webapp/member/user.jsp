<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="user.css">
</head>
<body>
	<div id=content>
		<!-- Profile ù��° �� -->
		<div class=row>
			<div class="avatar-card">
				<div class="avatar">
					<a href="#">
						<div class="gravatar-wrapper-164">
							<img src="http://img.visualdive.co.kr/sites/2/2015/10/gisa2.jpg"
								alt width="200" height="200" class="avatar-user">
						</div>
					</a>
				</div>
				<div id="score">
					<span id="grade" title="����"></span>100 ��
				</div>
			</div>
			<div id="profile_wrapper">
				<div id="description">
					<c:forEach var="m" items="${ mlist}">
						<li>${m.id }</li>
					</c:forEach>
					<ul id="descr">
						<li>����: �ֿ뱳������</li>
						<li>���ɻ�: JAVA</li>
						<li>�ϰ���� ��: ��� �ϸ� �ڹ� ����� �� �� �ֳ���?</li>
					</ul>
				</div>
				<div id="info-summary">
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
							<li><i class="fa fa-sign-in" aria-hidden="true">&nbsp;������</i></li>
							<li><i class="fa fa-github" aria-hidden="true">&nbsp;Github:</i></li>							
							<li><i class="fa fa-stack-overflow" aria-hidden="true">&nbsp;stack overflow:</i></li>
							<li><i class="fa fa-eye" aria-hidden="true">&nbsp;����Ʈ ��</i></li>
							<li><i class="fa fa-clock-o" aria-hidden="true">&nbsp;�ֱ� ���ӽð�</i></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!--  Profile �ι�° �� -->
		<div class=row>
			<div id="u_tags">
			<h3>favorite tags</h3>
				<table>

					<tr>
					<td><a href="#" class="post-tag">�±�</a></td>
					<td><a href="#" class="post-tag">�±�</a></td>
					<td><a href="#" class="post-tag">�±�</a></td>
					</tr>
				</table>
			
			</div>
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
			
			<div id="u_review">
			<h3>���� ȹ�� ����</h3>
				<ul>
							<li>+5 ���� ������ �Ű���ϴ�.</li>
							<li>+5 ���� ������ �Ű���ϴ�.</li>
							<li>+10 �亯�� �ۼ��߽��ϴ�.</li>
							<li>+5 ����Ǵ� �亯���� ���ƿ� ȹ��!</li>
							<li>-1 �Ⱦ�� ȹ��</li>
						</ul>
				
			
			</div>
			
		</div>

	</div>
</body>
</html>