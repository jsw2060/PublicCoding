<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String mode=request.getParameter("mode");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="../assets/css/hyun/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/hyun/shop-homepage.css" rel="stylesheet">
</head>
<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <p class="lead"></p>
                <div class="list-group">
                    <a href="#" class="list-group-item"><b>��Programing��</b></a>
                    <a href="#" class="list-group-item">-Java-</a>
                    <a href="#" class="list-group-item">-C/C++-</a>
                    <a href="#" class="list-group-item">-JSP-</a>
                    <a href="#" class="list-group-item">-Oracle-</a>
                    <a href="#" class="list-group-item">-Spring-</a>
                    <a href="#" class="list-group-item">-HTML-</a>
                    <a href="#" class="list-group-item">-CSS-</a>
                    <a href="#" class="list-group-item">-JavaScript-</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Java����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� Java���� <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
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
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">C++/C#����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� C++/C#����</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Html����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� Html����</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Fourth Product</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� CSS</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">JavaScript����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� JavaScript</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Oracle����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� Oracle</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Oracle����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� Oracle</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-lg-3 col-md-3 hyundiv">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">����</h4>
                                <h4><a href="#">Oracle����</a>
                                </h4>
                                <p>You Tube�� �Ա��ϴ� Oracle</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    
    <!-- jQuery -->
    <script src="../assets/js/hyun/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../assets/js/hyun/bootstrap.min.js"></script>
</body>
</html>