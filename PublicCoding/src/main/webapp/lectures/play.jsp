<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

	<body>
				<div class="container">
					<div class="page-header" style="margin-top: 100px">
 					 <h1 style="font: 20px ���� ���">���� SW�η��� ���� ���� JSP Servlet ������ ���� <small>Subtext for header</small></h1>
					</div>
				<!-- Content -->
					<div class="row">
						<div class="col-xs-10 col-sm-7 col-md-7">
					<section id="content">
							<div class="embed-responsive embed-responsive-16by9">
  							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${url }" frameborder="0" allowfullscreen></iframe>
							</div>
						</div>
						<div class="col-xs-10 col-sm-5 col-md-5">
							<table class="table">
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>1�� </td>
									<td><a href="" target="_self">�����α׷���</a></td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>2�� </td>
									<td><a href="" target="_self">���� ȯ�� ����</a></td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>3�� </td>
									<td><a href="" target="_self"> JSP ������</a> </td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>4�� </td>
									<td><a href="" target="_self">Servlet ������</a> </td>
									<td>23:41</td>
								</tr>
								<tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
									</td>
									<td>5�� </td>
									<td><a href="" target="_self">Servlet ���������� ���캸�� 1</a> </td>
									<td>23:41</td>
								</tr>
							</table>
						</div>
					</section>
					</div>
				<div>
  					<!-- Nav tabs -->
  					<ul class="nav nav-tabs" id="myTab" role="tablist">
   						<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">���ǼҰ�</a></li>
    					<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">������</a></li>
    					<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">��������</a></li>
    					<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">�����Խñ�</a></li>
    					<li role="presentation"><a href="#board" aria-controls="board" role="tab" data-toggle="tab">�ǽ���ũ</a></li>
  					
  					</ul>

 					<!-- Tab panes -->
  					<div class="tab-content">
    				<div role="tabpanel" class="tab-pane active" id="home">
    					<p><h5>���Ǹ� : ����SW�η��� ���� ���� JSP Servlet ��������� - �� 03�� JSP ������</h5></p>
						<p>���� ���� : <br>
							�̹� ���Ǵ� JSP ������ ���Դϴ�.<br>
							PC�� ���Ƕ��� www.wiz.center/tag/jsp, http://www.youtube.com/wizcenterseoul �Ǵ� ���� �����󿡼� HD �������� ���ô� ���� �����ϴ�.<br>
							1080p�� �����ؼ� ���ø� ���ڰ� �� ���Դϴ�. ������ �ϴ� ��ϸ�翡�� 1080p�� �����ϼ���.<br>
							�׸��� ����Ϸ� ���� ������ ��Ʃ�� ������ ���ʽÿ�. �׷��� ���ڰ� �� ���Դϴ�.<br></p>
						<p>PPT ����, �ҽ������� ÷�������� www.wiz.center/tag/jsp�� �����ϼ���.</p></div>
    				<div role="tabpanel" class="tab-pane" id="profile"><p><h5>���� ��</h5></p> </div>
    				<div role="tabpanel" class="tab-pane" id="messages"><p><h5>��������</h5></p>
    				<div class="row">
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>��..��...</p>
					      </div>
					    </div>
					  </div>
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>��..��...</p>
					      </div>
					    </div>
					  </div>
					  <div class="col-xs-5 col-sm-4 col-md-3">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>��..��...</p>
					      </div>
					    </div>
					  </div>
					</div>
    				</div>
    				<div role="tabpanel" class="tab-pane" id="settings"><p><h5>���� �Խñ� </h5></p></div>
    				<div role="tabpanel" class="tab-pane" id="board"><p><h5>�ǽ� </h5></p></div>
  					</div>
				</div>
				
			<script src="http://code.jquery.com/jquery-latest.js"></script>
        	<script src="assets/bootstrap-3.3.2/js/tab.js"></script>
        	<script>
        		$('#myTab a').click(function (e) {
        		  	e.preventDefault()
        		  	$(this).tab('show')
        		})
        	</script>
		</div>
	</body>
</html>