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
	<c:import url="/views/common/header.jsp"/>
</head>
<body>

    <!-- 상위 집 이미지 -->
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h2 class="mb-3 bread">${ member.nickname } 의 게시글 입니다</h2>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single<i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 페이지 몸통 가운데 정렬 -->
    <section class="ftco-section contact-section" >
      <div class="container">
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">

      <!--이미지 -->
      <div id="carouselExampleControls" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" data-ride="carousel">
        <div class="carousel-inner " >
          <div class="carousel-item active " >
            <img src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg"  class="d-block w-100" alt="..." >
          </div>
          <div class="carousel-item">
            <img src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg"  class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
        <br>
      </div>
     
<!-- 지도  -->

<div id="map" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" style="width:87%;height:200px; "></div>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4945e6596ec6eb54d1d8456b29637f23"></script> -->
<script>
   var container = document.getElementById('map');
   var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
   };

   var map = new kakao.maps.Map(container, options);
</script>

<!-- 지도 끝-->

     
<!-- 작성자 설명 란 -->

          <div class="col-md-8 ftco-animate">
            <br>
            <h4 class="mb-3" style="float: left;"> 작성자 </h4> 
            <button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
            <button type="button" class="btn btn-outline-info" style="float: right; margin-right: 5px;">좋아요 </button> 
            <br>
            <hr/>
            <p>여기는 작성자가 리뷰하는 곳입니다.</p>
            <hr/>
            



            <div class="pt-5 mt-5">
              
              <h3 class="mb-5" style="margin-bottom: 1rem !important;">댓글</h3> 
              <div class="col-12" style="padding: 0px;">

                <input type="text" style="width: 80%; margin-bottom: 5px;">
                
                <button type="button" class="btn btn-outline-primary col-2"style="float: right;">작성</button>
              </div>
              <br><br>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/person_1.jpg" alt="Image placeholder" style="margin-bottom: 5px;">
                    <h6>조은성</h6>
                  </div>
                  <div class="comment-body">
                    <button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
                    <button type="button" class="btn btn-outline-info" style="float: right; margin-right: 5px;"> 댓글 달기 </button>
                    
                    <div class="meta">날짜&시간</div>
                      <p>이게 맞는건가요 ??</p>
                  </div>
                </li>
                    <!-- comment start-->
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="images/person_1.jpg" alt="Image placeholder" style="margin-bottom: 5px;">
                        <h6>장그래</h6>
                      </div>
                      <div class="comment-body">
                        <button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
                        <button type="button" class="btn btn-outline-info" style="float: right; margin-right: 5px;"> 댓글 달기 </button>
                        
                        <div class="meta">날짜&시간</div>
                          <p>맛있다는데 맛있었어요!!</p>
                      </div>
                    </li>
              </ul>
  
            </div>
          </div> <!-- .col-md-8 -->

        </div>
      </div>
    </section> <!-- .section -->

      
    <!-- footer 시작 -->
<c:import url="/views/common/footer.jsp"/>
</body>
</html>