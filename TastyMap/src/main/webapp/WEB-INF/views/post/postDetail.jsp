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

<br />
<br />
    
    <!-- 페이지 몸통 가운데 정렬 -->
    <section class="ftco-section contact-section" >
      <div class="container">
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">

      <!--이미지 -->
      <div id="carouselExampleControls" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" data-ride="carousel">
	     <div class="carousel-inner " style="width:100%; height:100%">
       	 <c:forEach var="postDetailimg" items="${ postDetailPhotoList }" varStatus="status"> <!-- 이미지 반복문 -->
       	 	<c:if test="${status.index eq 0}">
	          <div class="carousel-item active " style="width:100%; height:100%">
	            <img src="${pageContext.request.contextPath}/resources/upload/post/${postDetailimg.pRenamedName}" class="block-20 img" style="width:100%; height:600px">
	          </div>
	          </c:if>
	          <c:if test="${status.index ne 0}">
 	          <div class="carousel-item" style="width:100%; height:100%">
	            <img src="${pageContext.request.contextPath}/resources/upload/post/${postDetailimg.pRenamedName}" class="block-20 img" style="width:100%; height:600px">
	          </div>
	          </c:if>
	          <%-- <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/resources/upload/post/${postDetailimg.pRenamedName}" class="d-block w-100" alt="...">
	          </div> --%>
	          
	        
         </c:forEach>
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

<!-- <div id="map" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" style="width:87%;height:200px; " ></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71cfabf5739c195830217cd92296d03"></script>
<script>
   var container = document.getElementById('map');
   var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
   };

   var map = new kakao.maps.Map(container, options);
</script> -->

<div id="mapapi" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" style="width:87%;height:200px; "></div> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71cfabf5739c195830217cd92296d03&libraries=services"></script>

<script>
var mapContainer = document.getElementById('mapapi'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${post.address}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">"${post.rname}"</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<!-- 지도 끝-->

     
<!-- 작성자 설명 란 -->

          <div class="col-md-8 ftco-animate">
            <br>
            <h4 class="mb-3" style="float: left;"> ${ post.nickname } </h4> 
            <button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
            <button type="button" class="btn btn-outline-info" style="float: right; margin-right: 5px;">좋아요 </button> 
            <br>
            <hr/>
            <p>${post.PContent}</p>
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