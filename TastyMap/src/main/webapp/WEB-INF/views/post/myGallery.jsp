<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
 <title>tastyMap</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	    <!-- header 부분 -->
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">tastyMap</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="agent.html" class="nav-link">Agent</a></li>
	          <li class="nav-item"><a href="properties.html" class="nav-link">Listing</a></li>
	          <li class="nav-item active"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END header -->

    <!-- 상위 집 이미지 -->
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h2 class="mb-3 bread">${member.nickname}님의 갤러리</h2>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single<i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    <hr>
    
    <!-- 프로필 사진, 이름, 팔로워 버튼, 팔로워 수, 설명 등등..-->
    <section class="ftco-section ftco-fullwidth">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5 fadeInUp ftco-animated">
          	<span class="subheading">${member.nickname}님의 페이지</span>
          </div>
        </div>
      </div>
    	<div class="container" style="display:table;">
        <div class="row">
    		<!-- <div class="col-12" style="display: inline-flex;"> -->
          <div class="col-lg-5 col-md-5" style="text-align: -webkit-right;">
          <div class="one-half img d-flex align-self-stretch" style="background-image: url('images/강아지.jpg'); height : 350px; width : 350px; border-radius: 30%;
          overflow: hidden;"></div>
          </div>
					<!-- <div class="one-half half-text d-flex justify-content-end align-items-center"> -->
						<div class="col-lg-5 col-md-5" style=" display:table-cell;
            vertical-align: middle;">
							<div class="row d-flex">
                
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            
			              <div class="media-body pl-4">
                      <button type="button" class="btn btn-outline-success" style="float: right;">팔로우</button>
			                <h3>사용자 이름 : ${member.nickname}</h3> 
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            	
			              <div class="media-body pl-4">
                      <p>게시글 : 5,000</p>  
                      <p>팔로워 : 1,652</p> 
                      <p>팔로우 : 500</p>
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            
			              <div class="media-body pl-4">
			                <p>프로필 내용 : ${member.mcontent}</p>
			              </div>
			            </div>      
			          </div>
			        </div>
            </div>
					<!-- </div> -->
    		<!-- </div> -->
      </div>
    </div>
    </section>

<!-- 골 모달 실행한 버튼-->
    <!-- <button type="button" class="btn btn-warning btn-lg btn-block"
                         data-toggle="modal" data-target="#Joinform" >참여하기</button> -->

    <!-- 사진 갤러리 list -->
    <section class="ftco-section ftco-agent" style="margin-left: 100px;">
    	<div class="container">
        <div class="row">
          <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            <div class="agent" style="width: 100%; height: 100%;">
              <a href="#">
    					  <div class="img" style="width: 100%; height: 100%;">
		    				  <img src="images/person_4.jpg" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                </div>
              </a>
    				</div>
        	</div>
          <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            <div class="agent" style="width: 100%; height: 100%;">
              <a href="#">
    					  <div class="img" style="width: 100%; height: 100%;">
		    				  <img src="images/person_1.jpg" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                </div>
              </a>
    				</div>
        	</div>
          <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            <div class="agent" style="width: 100%; height: 100%;">
              <a href="#">
    					  <div class="img" style="width: 100%; height: 100%;">
		    				  <img src="images/person_2.jpg" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                </div>
              </a>
    				</div>
        	</div>
          <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            <div class="agent" style="width: 100%; height: 100%;">
              <a href="#">
    					  <div class="img" style="width: 100%; height: 100%;">
		    				  <img src="images/person_3.jpg" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                </div>
              </a>
    				</div>
        	</div>
          <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            <div class="agent" style="width: 100%; height: 100%;">
              <a href="#">
    					  <div class="img" style="width: 100%; height: 100%;">
		    				  <img src="images/work-3.jpg" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                </div>
              </a>
    				</div>
        	</div>
          <!-- <div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px;">
            <div class="agent" style="margin-bottom : 10px;">
              <a href="#">
    					  <div class="img">
		    				  <img src="images/team-1.jpg" class="img-fluid" alt="Colorlib Template"style="height: auto; width: 100%;" >
                </div>
              </a>
    				</div>
        	</div> -->


        </div>
    	</div>
    </section>
		
<!-- footer 시작 -->
    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Findstate</h2>
              <p>Far far away, behind the word mountains, far from the countries.</p>
              <ul class="ftco-footer-social list-unstyled mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Community</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search Properties</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For Agents</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">About Us</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our Story</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet the team</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Company</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About Us</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Press</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
	
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
</body>
</html>