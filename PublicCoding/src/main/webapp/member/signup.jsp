<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>Sign up</title>
<script type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../assets/css/su.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<!-- //////////////////// �ߺ�üũ shadowBox /////////////////// -->
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});
function idcheck() {
	Shadowbox.open({
		content:'member/idcheck.jsp',
		player:'iframe',
		width:240,
		height:150,
		title:'���̵� �ߺ�üũ'
	});
}
</script>
<!-- //////////////////// �ߺ�üũ shadowBox /////////////////// -->

<!-- ////////////////////////////////////// JOIN ACTION /////////////////////////// -->

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#joinBtn').click(function() {
			var id = $('#id').val();
			if (id.trim() == "") {
				$('#id').focus();
				return;
			}

			var pwd = $('#pwd').val();
			if (pwd.trim() == "") {
				$('#pwd').focus();
				return;
			}
			
			var email = $('#email').val();
			if (pwd.trim() == "") {
				$('#email').focus();
				return;
			}
			$('#join_frm').submit();
		});
	});
</script>
<!-- ////////////////////////////////////////////////////////////////////////////// -->

</head>
<body>

	<center>
		<legend class="sumain"></legend>


		<!-- <form class="su-email">

<div class="container" data-responsiveness-enabler="">
	<div class="row">
		<div class="col-lg-6 col-sm-8 col-xs-12 col-lg-offset-3 col-sm-offset-2">
			
 </form> -->
		<h4 class="modal-title" id="lineModalLabel">
						<center>PUCO�� ȸ���� �Ǿ� �ּ���</center>
					</h4>
		<div class="row row-gap-medium ng-scope">
			<!-- ngView:  -->
			<div data-ng-view="" class="ng-scope">
				<div class="form-box ng-scope" style="padding: 0 35px 35px 35px;">

					<form class="form-horizontal ng-pristine ng-valid ng-valid-email" role="form"
						name="join_frm" action="signup.do" method="post" id="join_frm">

						<div class="row">
							<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
								<label for="firstname">���̵�</label>
								<input type="text" class="form-control ng-pristine ng-untouched ng-valid"
									id="firstName" placeholder="���̵�" name="id" readonly>
								<br>
								<input type="button" class="btn btn-block btn-primary" value="�ߺ�üũ" onclick="idcheck()">
							</div>
							<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
								<label for="password1">��й�ȣ</label>
								<input type="password" class="form-control ng-pristine ng-untouched ng-valid"
									id="password" placeholder="��й�ȣ" name=pwd required>
									&nbsp;
								<label for="password2">���Է�</label>
								<input type="password" class="form-control ng-pristine ng-untouched ng-valid" 
									placeholder="���Է�" name="pwd1" required>
							</div>
						</div>

						<div class="row onboarding-form-group">
							<div class="col-sm-12 col-xs-12">
								<div>
									<label for="email">E-mail</label>
									<input type="text" class="form-control ng-pristine ng-untouched ng-valid ng-valid-email"
										id="email" placeholder="E-mail" name="email">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6 col-xs-12">
								<legend class="sumain"></legend>
								<button type="submit" class="btn btn-block btn-primary" id="joinBtn">ȸ������</button>
							</div>
							<div class="col-sm-6 col-xs-12">
								<legend class="sumain"></legend>
								<a href="main.do">
									<input type="button" class="btn btn-block btn-primary" value="���">
								</a>
							</div>
						</div>
					</form>
					<!-- 
	<div class="hr-with-words">
	
	</div>
	 -->
					<!-- 	<div class="row">
		<div class="col-xs-12">
			<button class="btn btn-block btn-default" data-ng-click="signUpFacebook()">
				<img src="/media/img/logos/third_party/facebook-login.png" alt="Facebook icon" title="Facebook icon">
		<i class="fa fa-facebook-official fa-1g"></i>
				
				Sign up with Facebook
			</button>
		</div>
		
		<div class="col-xs-12">
			<button class="btn btn-block btn-default" data-ng-click="signUpGoogle()">
				<img src="/media/img/logos/third_party/google-login.png" alt="G+ icon" title="G+ icon">
		<i class="fa fa-google-plus-square fa-1g"></i>
				Sign up with Google
			</button>
		</div>
	</div> -->


					<div class="row row-gap-medium ng-scope">
						<br>
						<p class="col-xs-6 col-xs-offset-3 bold text-center">
							�̹� ���� �ϼ̳���? <br>
							<br>
							
								<input type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#login" value="�α���">
								<!-- class="btn btn-block btn-primary" -->
							
						</p>
					</div>
					
					
				</div>
			</div>
		</div>
	</center>


</body>
</html>