<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
  
  <head>
	<meta charset="UTF-8">
    <style>
     	@import 'https://fonts.googleapis.com/css?family=Open+Sans';
		html,
		body {
		  width: 100%;
		  height: 100%;
		}
		 
		#myChart {
		  width: 100%;
		  height: 100%;
		  min-height: 250px;
		}
		 
		.zc-ref {
		  display: none;
		}

    </style>
    <c:import url="/views/common/header.jsp"/>
  </head>
  <body>
  

    <!-- 마이페이지 내용 시작-->
    <section class="ftco-section contact-section" >
      <div class="container">
        
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">
         
          <!-- 마이페이지 좌측 메뉴바 -->
         <c:import url="/views/myPage/myMenu.jsp"/>
         
         
          <!-- 마이페이지 우측 내용(지도)-->
          <div class="col-md-9 align-items-stretch d-flex" style="white-space : nowrap ;">
            <div id="map" style="width:100%;height:100%;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71cfabf5739c195830217cd92296d03&libraries=services"></script>
            <script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 8 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				<c:forEach items="${list}" var="list">
				geocoder.addressSearch('${list.address}', function(result, status) {
					
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
				            content: 
				            	'<div class="wrap">' + 
				                '    <div class="info">' + 
				                '        <div class="title">' + 
				                '            ${list.RName}' + 
				                '            <div class="close" onclick="closeOverlay()" title="닫기" style="font-size:15px;">닫기</div>' + 
				                '        </div>' + 
				                '        <div class="body">' +  
				                '            <div class="desc">' + 
				                '                <div class="ellipsis">${list.address}</div>' + 
				                '                <div><a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=${list.pno }&memberId=${member.memberId}" class="link">더보기</a></div>' + 
				                '            </div>' + 
				                '        </div>' + 
				                '    </div>' +    
				                '</div>'
				        });
				        infowindow.open(map, marker);
				        
				     	
				     	
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});

				</c:forEach>
				/* 
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(map, 'click', function() {
					map.open(map, marker);
				});
				
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()       
				});
				
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
				    overlay.setMap(map);
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
				    overlay.setMap(null);     
				} */
				
				
				
		</script>
        </div>
      </div>
      </div>
    </section>
		
    <!-- footer 위치 -->
    
    <c:import url="/views/common/footer.jsp"/>
    
    
  </body>
</html>