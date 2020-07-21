<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

      <!--차트2-->
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
  
        function drawChart() {
  
          var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['Work',     11],
            ['Eat',      2],
            ['Commute',  2],
            ['Watch TV', 2],
            ['Sleep',    7]
          ]);
  
          var options = {
            title: 'My Daily Activities'
          };
  
          var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  
          chart.draw(data, options);
        }
      </script>
      
    <!--//차트2-->

    <link rel="stylesheet" href="./images/owl.carousel.min.css"><!--이미지 슬라이드-->

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <title>Findstate - Free Bootstrap 4 Template by Colorlib</title>
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
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Findstate</a>
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
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h1 class="mb-3 bread">Blog Single</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single<i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    <hr>

   



      <!--이미지 -->


      
     <div id="header">
        <div class="owl-carousel">
          <div class="col-md-4">
            <img src="images/person_1.jpg" title="커피 한잔 할까요? ^.^" style="width: 370% ;height: auto;" >
          </div>
          <div class="col-md-4">
            <img src="images/person_1.jpg" title="커피 한잔 할까요? ^.^" style="width: 370% ;height: auto;" >
          </div>
          <div class="col-md-4">
            <img src="images/person_1.jpg" title="커피 한잔 할까요? ^.^" style="width: 370% ;height: auto;" >
          </div>
        </div>
        </div> 

        <hr>
    <!-- <section class="ftco-section ftco-degree-bg"> -->
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3"> 제목 </h2>
            <hr>
            <img id="image" onclick="changeImage()" border="0" src="images/front.png" style="width: 20px; height: 20px; float: right;"/>
      

 
           
            <p>주소</p>   
            <p>레스토랑 설명</p>
            <p>가격대</p>
            <p>오픈시간</p>
            <p>전화번호</p>
            <p>주차가능여부</p>
            <!--해당 페이지 출력 기능-->
            <form>
              <p class="test">
                <input type="button" value="프린트 하기" onclick="window.print()" />
              </p>
            </form>
            <!--//해당 페이지 출력 기능-->
            
            
            <p class="test">가게정보수정일</p>
            <hr/>
            
            <p>설명란</p>
          
            <div class="pt-5 mt-5">
              <hr>
              <h3 class="mb-1">리뷰 <input type="button" value="리뷰등록하기" onclick="" style="font-size: 10px;" />
              </h3>
             
              <hr>
              <div class="pt-5 mt-5">
              
              
                <ul class="comment-list">
                  <li class="comment">
                    <div class="vcard bio">
                      <img src="images/person_1.jpg" alt="Image placeholder" style="margin-bottom: 5px;">
                      <h6>조은성</h6>
                    </div>
                    <div class="comment-body">
                      <button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
                      
                      <div class="meta">날짜시간</div>
                        <div class="col-md-11">이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??이게 맞는건가요 ??</div>
                        <br>
                    </div>

                    <img class="pt"src="images/person_1.jpg"  style="width: 200px; height: 200px;">
                    <hr>
                  </li>
                  
                </ul>
    
              </div>
               
            </div>

          </div>
          
          
          
          
          
          
          
          
           <!-- .col-md-8 -->
          <div class="col-md-4 pl-md-5 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">


<!-- 지도  -->
         
	<div id="map" style="width:500px;height:400px;"></div>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4945e6596ec6eb54d1d8456b29637f23"></script> -->
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	</div>
	</form>
</div>
<!-- 지도 끝-->
















         
            <!--//차트-->











            <div class="sidebar-box ftco-animate" style ="height: 2500px;">
              <h3>주변인기식당</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text pl-3">
                  <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar mr-2"></span>Oct. 17, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text pl-3">
                  <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar mr-2"></span>Oct. 17, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text pl-3">
                  <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar mr-2"></span>Oct. 17, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div id="chart_div"style="position: relative;margin-left: -100px;" ></div>
              <div id="piechart" style="position: relative;margin-left: -170px; width: 900px; height: 500px; "></div>
 

            </div>

            
           <!--차트-->
           <div style="text-align:center; margin:10 10px 10px 10; background:#555; line-height:80px;">
            <a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt; " target="_blank"></a>
          </div>
          
          
          <!-- 예제 시작 -->
          
          <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
          <script >
            // 차트를 사용하기 위한 준비입니다.
            google.charts.load('current', {packages:['corechart']});
          </script>
          
          <!-- <div id="chart_div" ></div> --> <!-- 여기에 차트가 생성됩니다. -->
          
          <script >
          
          // 로딩 완료시 함수 실행하여 차트 생성
          google.charts.setOnLoadCallback(drawChart);
          
          function drawChart() {
          
            // 차트 데이터 설정
            var data = google.visualization.arrayToDataTable([
              ['항목', '다리수'], // 항목 정의
              ['고양이', 4], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
              ['메뚜기', 6],
              ['문어', 8],
              ['오징어', 10],
              ['운영자', 2],
              ['달팽이', 0], // ?
              ['랜덤', Math.round(Math.random() * 10)],
            ]);
          
            // 그래프 옵션
            var options = {
              title : '다리 갯수', // 제목
              width : 600, // 가로 px
              height : 400, // 세로 px
              bar : {
                groupWidth : '70%' // 그래프 너비 설정 %
              },
              legend : {
                position : 'relative' // 항목 표시 여부 (현재 설정은 안함)              

              }
            };
          
            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
          }
          
          </script>
          
          <!-- 예제 종료 -->
           


          </div>












        </div>
      </div>
    <!-- </section> .section -->
		

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
 <%--  <div id="ftco-loader" class="show fullscreen">
  <svg class="circular" width="48px" height="48px">
  <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
  <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg>
  </div> --%>


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

  <!--이미지 슬라이드-->  
<script src="./images/owl.carousel.min.js"></script> 
<script>  
var owl = $('.owl-carousel');
owl.owlCarousel({
    items:4,
    loop:true,
    margin:10,
    autoplay:true,
    autoplayTimeout:5000,
    autoplayHoverPause:true
});
$('.play').on('click',function(){
    owl.trigger('play.owl.autoplay',[1000])
})
$('.stop').on('click',function(){
    owl.trigger('stop.owl.autoplay')
})


</script>  
<script type="text/javascript">
  state =0;
  function changeImage(){
    if(state ==0){
      state = 1;
      document.getElementById('image').src="images/front.png";
    }
    else{
      state = 0;
      document.getElementById('image').src="images/back.png";
    }
  }
  </script> 

  </body>
</html>



</body>
</html>