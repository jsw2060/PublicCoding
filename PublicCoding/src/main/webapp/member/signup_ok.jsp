<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ���</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<center>
		<legend class="sumain"></legend>
			
			<c:if test="${count == 1}">
				<h4 class="modal-title" id="lineModalLabel">
					<center>�����մϴ�! PUCO�� ȸ���� �Ǿ����ϴ�!</center>
				</h4>
				<br>
				<br>
				<h4 class="modal-title" id="lineModalLabel">
					<center>${mid }�� ȯ���մϴ�.</center>
				</h4>
				
				<div class="row row-gap-medium ng-scope">
					<!-- ngView:  -->
					<div data-ng-view="" class="ng-scope">
						<div class="form-box ng-scope" style="padding: 0 35px 35px 35px;">
							<center>
							<div class="row">
								<div class="col-sm-6 col-xs-12">
									<legend class="sumain"></legend>
									<a href="main.do">
										<input type="button" class="btn btn-block btn-primary" value="����ȭ��">
									</a>
								</div>
							</div>
							</center>
			</c:if>
			<c:if test="${count == null}">
				<h4 class="modal-title" id="lineModalLabel">
					<center>ȸ�� ������ ���� �ʾҽ��ϴ�. �ٽ� �Է� ���ּ���.</center>
				</h4>
				<div class="row row-gap-medium ng-scope">
						<!-- ngView:  -->
						<div data-ng-view="" class="ng-scope">
							<div class="form-box ng-scope" style="padding: 0 35px 35px 35px;">	
							<center>
							<div class="row">	
								<div class="col-sm-6 col-xs-12">
									<legend class="sumain"></legend>
									<a href="../join.do">
										<input type="button" class="btn btn-block btn-primary" value="ȸ������">
									</a>
								</div>
							</div>
							</center>		
			</c:if>
				</div>
			</div>
		</div>
	</center>
</body>
</html>