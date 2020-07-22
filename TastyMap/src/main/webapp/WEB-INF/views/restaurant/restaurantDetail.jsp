<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/views/common/header.jsp"/> 
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
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

    <link rel="stylesheet" href="${pagecontext.request.contextPath }/images/owl.carousel.min.css"><!--이미지 슬라이드-->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/animate.css">
    
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/magnific-popup.css">

    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/aos.css">

    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/ionicons.min.css">

    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/flaticon.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/icomoon.css">
    <link rel="stylesheet" href="${pagecontext.request.contextPath }/css/style.css">
  </head>
  <body>
    
	  
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
          </div>
        </div>
      </div>
    </section>
    <hr>

  
  
	<c:if test="${ empty list}">
     <div id="header">    <!-- 가져오는 값이 없을때 이미지 출력 -->
  <img src="${pageContext.request.contextPath}/resources/images/sajin.jpg" style="width: 100% ;height: 70%;" > 
   		  </div>
   </c:if>
   
   
	<c:if test="${ !empty list }">
     <div id="header">
        <div class="owl-carousel">
          <c:forEach items="${list}" var="name">   <!-- 가져오는 값이 있을때 이미지 출력 -->
    	      <div class="col-md-4">
          	
            	<img src="${pageContext.request.contextPath}/resources/images/${name.prenamedname}" style="width: 560px ;height: 370px;" >
	          </div>
            </c:forEach>
        </div>
        </div> 
	</c:if>  
	
	
      

     
    <!-- <section class="ftco-section ftco-degree-bg"> -->
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
       	   <br>
       	   <hr>     	 
            <h1 class="mb-3 bread"> ${restaurant.rname} </h1>
            <hr>
            <img id="image" onclick="changeImage()" border="0" src="${pageContext.request.contextPath}/resources/images/front.png" style="width: 30px; height: 30px; float: right;"/>
      

 			
 			<tr>
           <th>주소 : </th> 
           
           <td>${restaurant.address}</td><br>
			<th>영업시간 : </th> 			
            <td>${restaurant.time}</td><br>
 			<th>가격대 : </th>
            <td>${restaurant.price}</td><br>
            <th>전화 번호 : </th>
            <td>${restaurant.tel}</td><br>
         	<td>주차가능 여부 : ${restaurant.paking}</td>	<br>     		
         	<td style="float: right">가게정보 수정일 : ${restaurant.updatedate}</td>	    
            <tr>
 		
            <!--해당 페이지 출력 기능-->
                <input class="btn btn-outline-info" type="button" value="프린트하기" onclick="window.print()" style="float: right";/>
            <!--//해당 페이지 출력 기능-->
            
            <form>
              <p class="test">
              </p>
            </form>                  
            <hr/>
              <td>${restaurant.rcontent}</td>
         
          
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
		

  




  <!--이미지 슬라이드-->  
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script> 
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
      document.getElementById('image').src="${pageContext.request.contextPath}/resources/images/back.png";
    }
    else{
      state = 0;
      document.getElementById('image').src="${pageContext.request.contextPath}/resources/images/front.png";
    }
  }
  </script> 
  <c:import url="/views/common/footer.jsp"/>

  </body>
</html>
