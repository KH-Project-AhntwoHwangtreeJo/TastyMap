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
  <!--원형차트 시작-->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          /* ['한식', ${map.k}],
          ['중식', ${map.c}],
          ['일식', ${map.j}],
          ['양식', ${map.y}],
          ['기타', ${map.e}]  */
          ['${category[0]}', ${map.get(category[0])}],
          ['${category[1]}', ${map.get(category[1])}],
          ['${category[2]}', ${map.get(category[2])}],
          ['${category[3]}', ${map.get(category[3])}],
          ['${category[4]}', ${map.get(category[4])}] 
          
        ]);

        var options = {
          title: '식당 카테고리별 통계'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
 
<!--원형차트 끝-->

<!--원형차트 시작-->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);

      function drawChart1() {

    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'], 
          ['${countrys[0]}', ${map.get(countrys[0])}],
          ['${countrys[1]}', ${map.get(countrys[1])}],
          ['${countrys[2]}', ${map.get(countrys[2])}],
          ['${countrys[3]}', ${map.get(countrys[3])}],
          ['${countrys[4]}', ${map.get(countrys[4])}] 
        ]);

        var options = {
          title: '지역별 음식점 통계'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
    </script>
 
<!--원형차트 끝-->
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
				                '            <div class="close" onclick="closeOverlay()" title="닫기" style="font-size:15px;"></div>' + 
				                '        </div>' + 
				                '        <div class="body">' +  
				                '            <div class="desc">' + 
				                '                <div class="ellipsis">${list.address}</div>' + 
				                '                <div><a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=${list.pno }&memberId=${member.memberId}" class="link">더보기</a></div>' + 
				                '            </div>' + 
				                '        </div>' + 
				                '    </div>' +    
				                '</div>',
				                removable : true
				        });
				        
				        (function(marker, infowindow) {
					        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
					        kakao.maps.event.addListener(marker, 'mouseover', function() {
					            infowindow.open(map, marker);
					        });

					        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
					        kakao.maps.event.addListener(marker, 'mouseout', function() {
					            infowindow.close();
					        });
					    })(marker, infowindow);
				     				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});

				</c:forEach>
  
		</script>
		</div>
        
        
        
        
      </div>
      </div>
     
     <div class="col-10" style="margin-left:20%; display:flex;"> 
     
        <div class="col-6" id="piechart" style="position: relative;margin-left: -133px; width: 900px; height: 500px; display:flex;"></div>
        <div class="col-6" id="piechart1" style="position: relative;margin-left: -133px; width: 900px; height: 500px; "></div>
     </div>
      
    </section>
    
    
   
		
    <!-- footer 위치 -->  
    <c:import url="/views/common/footer.jsp"/>
	
    
  </body>
</html>