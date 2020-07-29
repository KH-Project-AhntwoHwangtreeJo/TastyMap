<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<!-- 경로 복사 -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>
	.urlCopyBtn {

		font-weight:normal;			
		color:gray;
		text-decoration:none;
		font-size:12px;	
	}
	.urlCopyBtnIcon {
		border:1px solid gray;
		border-radius:3px;
		padding:0px 2px 1px 2px;
		color:white;
		background-color:gray;	
	}
	.urlCopyBtnIcon a {
		color:white;
	}
</style>
<!-- 경로 복사  끝 -->
<meta charset="UTF-8">
<c:import url="/views/common/header.jsp"/> 
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>

<script> 
function share() { var url = encodeURI(encodeURIComponent(myform.url.value)); var title = encodeURI(myform.title.value); var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title; document.location = shareURL; }
</script>

  </head>
  <body>
 <!--원형차트 시작-->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">    
 google.charts.load('current', {'packages':['corechart']});
 google.charts.setOnLoadCallback(drawChart);  
   function drawChart() {
	
	/* 차트 전체 구조 */
		/*빨간줄떠요 실행됨*/
     var data = google.visualization.arrayToDataTable([
    	  ['Task', 'Hours per Day'],
          ['10대',${map.A}],
          ['20대',${map.B}],
          ['30대',${map.C}],
          ['40대',${map.D}],
          ['50대 이상',${map.E}]
        ]);
		
	/*차트 타이틀 생성 */
     var options = {
       title: '리뷰 등록 연령대 비율 차트'
     };

     var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
     chart.draw(data, options);
   } 
 </script>   
<!--원형차트 끝-->
<br />
<br />
<br />
<br />
  
  
	<c:if test="${ empty list}">
     <div id="header">    <!-- 가져오는 값이 없을때 이미지 출력 -->
  <img src="${pageContext.request.contextPath}/resources/upload/post/sajin.jpg" style="width: 100% ;height: 70%;" > 
   		  </div>
   </c:if>
    
	<c:if test="${ !empty list }">
     <div id="header">
        <div class="owl-carousel">
          <c:forEach items="${list}" var="name">   <!-- 가져오는 값이 있을때 이미지 출력 -->
    	      <div class="col-md-4">       	
            	<img src="${pageContext.request.contextPath}/resources/upload/post/${name.prenamedname}" style="width: 560px ;height: 370px;" />
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
       	   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v7.0" nonce="eYFpy6Ga"></script>	 
    <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">공유하기</a></div>
    	 
   
    	 
<span>
	<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
	<script type="text/javascript">
	new ShareNaver.makeButton({"type": "b"});
	</script>
</span>
    	 
    <!-- 경로 복사하기 -->
<div>	
	<a href="#urlCopyBtn" class="urlCopyBtn">
	
		<span class="urlCopyBtnIcon" style="margin-left:10px;">경로 복사하기(a나중에 위치 옮길꺼임)</span>
	</a>
</div>
<input type="text" value="http://localhost:8088/${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" id="urlAddress" style="display:none;">
<script type="text/javascript">
$('.urlCopyBtn').click(function(){	

	var urlAddress= $('#urlAddress');
	urlAddress.css('display','block').select();
	document.execCommand("Copy");
	urlAddress.css('display','none');
	alert('URL 주소가 복사 되었습니다');	
	return false;
});


function gajaa(){
	location.href = "${pageContext.request.contextPath}/post/Rpost.do?rno=${rno}&memberId=${member.memberId}";
}
</script>    	 
    	 <!-- 경로 복사하기 끝 -->
    	 
       	   <hr>     	 
            <h1 class="mb-3 bread"> ${restaurant.rname} </h1>
            <hr>
             	
            <c:if test="${ empty member.memberId }">
            <img id="image" onclick="login();" border="0" src="${pageContext.request.contextPath}/resources/upload/post/bookmark.png" style="width: 30px; height: 30px; float: right;">
      		</c:if>
      		
      		<c:if test="${ !empty member.memberId }">
	            <c:if test="${ map.status eq 'N' }">
	            <img id="image" onclick="changeImage();" border="0" src="${pageContext.request.contextPath}/resources/upload/post/bookmark.png" style="width: 30px; height: 30px; float: right;">
	      		</c:if>
	      		<c:if test="${ map.status eq 'Y' }">
	            <img id="image" onclick="changeImage();" border="0" src="${pageContext.request.contextPath}/resources/upload/post/bookmark2.png" style="width: 30px; height: 30px; float: right;">
	      		</c:if>
      		</c:if>
			
			<img onclick="window.print()" border="0" src="${pageContext.request.contextPath}/resources/images/print/print.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;" />
 		
 	<table border="0">
 	<tr>
 	<td rowspan="6">주소<br>영업시간<br>가격대<br>전화번호 <br>주차가능 여부</td>
 	</tr>	
 	<tr>
 	<td>${restaurant.address}</td>
 	</tr>	
	<tr>
	<td>${restaurant.time}</td>	
	</tr>
	<tr>
	<td>${restaurant.price}</td>
	</tr>
	<tr>
	<td>${restaurant.tel}</td>
	</tr>
	<tr>
	<td>${restaurant.paking}</td>
	</tr>
    <tr> 
	</tr>
	</table>
 		
 			<div style="float: right">가게정보 수정일 : ${restaurant.updatedate}</div><br>
        
               
                   <p>${restaurant.rcontent}</p>       
           
     
          		<!-- 리뷰 기능 -->
         		<h6>${PostNumber}</h6>
              <hr>                                    
              <h3 class="mb-1">리뷰(${map.Pnum}) 
              <input class="btn btn-outline-info" onclick="gajaa()" type="button" value="리뷰등록하기" style="font-size: 10px; float: right;" >
		    </h3>           
              <hr>
              <div class="pt-5 mt-5">     
                <ul class="comment-list">
                <c:forEach items="${RPost}" var="RPost"> 
                  <li class="comment">                     
                  <div id="postdate" style="position: relative;right: 10px;">${fn:substring(RPost.date,0,10)}</div>                                    
                    <div class="vcard bio">   
                      <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder" style="margin-bottom: 5px;margin-bottom: 1px;position: relative;top: 0px;">
                      <h6 style="top: 8px;position: relative;">${RPost.NICKNAME}</h6>
                    </div>
                    <div class="comment-body">
                      <button  type="button" class="btn btn-outline-danger" style="right: -580px;position: relative;">신고</button>   
                   
                     
              
                      <div class="meta" style="position: relative;margin-left: 490px; font-size: 30px; top: -43px;"><img src="${pageContext.request.contextPath}/resources/upload/post/star1.png" style="width: 30px; height: 30px; margin-bottom: 0px;">  &nbsp;${RPost.STAR}</div> 
                    
                    	
                     <div style="position: relative;top: -80px;">${RPost.PCONTENT}</div>                                          
                        <br>
                    </div>
                    
                <c:forEach items="${RPicture}" var="RPicture"> 
                
                    <c:if test="${RPost.PNO eq RPicture.PNO}">       			  
           			 <img class="pt"src="${pageContext.request.contextPath}/resources/upload/post/${RPicture.prenamedname}"  style="width: 200px; height: 200px;">                    
                    </c:if>
                     </c:forEach>
                   	<hr>
                  </li>                 
                 </c:forEach>       
                </ul>          
              </div>
        
            
            
            
          </div>           
    	 <!-- 리뷰 기능 -->
    	 

    	 
    	 
    	 
  		<script>
  		function taskDate(dateMilli) {
  		    var d = (new Date(dateMilli) + '').split(' ');
  		    d[2] = d[2] + ',';

  		    return [d[0], d[1], d[2], d[3]].join(' ');
  		}
  		
  		function formatDate(date) {
  		    var d = new Date(date),
  		        month = '' + (d.getMonth() + 1),
  		        day = '' + d.getDate(),
  		        year = d.getFullYear();

  		    if (month.length < 2) 
  		        month = '0' + month;
  		    if (day.length < 2) 
  		        day = '0' + day;

  		    return [year, month, day].join('/');
  		}

  		</script>
  
  
			<!-- 지도  시작 -->
         
          <div class="col-md-4 pl-md-5 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">

		<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
        
        </a>
    </em>
</p>
<div id="mapim" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a082b5607624c5e0728c630bad039620&libraries=services"></script>
<script>
var mapContainer = document.getElementById('mapim'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${restaurant.address}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurant.rname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
		</script>
				</div>
				</form>
			</div>
			<!-- 지도 끝-->
			








           
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
       <div id="chart_div"style="position: relative;margin-left: -60px;" ></div>
       <div id="piechart" style="position: relative;margin-left: -133px; width: 900px; height: 500px; "></div>


     </div>

            
           <!--막대 차트 시작-->
           <div style="text-align:center; margin:10 10px 10px 10; background:#555; line-height:80px;">
            <a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt; " target="_blank"></a>
          </div>         
    
          
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
            /* 	오류보고 당황하지 말아주세요. */
            var data = google.visualization.arrayToDataTable([
                ['항목', '게시글 수'], // 항목 정의
                ['남', ${map.M}],
                ['여', ${map.F}],// 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
                ]);      
            // 그래프 옵션
            var options = {
              title : '게시글 수', // 제목
              width : 500, // 가로 px
              height : 400, // 세로 px
              bar : {
                groupWidth : '30%' // 그래프 너비 설정 %
              },
              legend : {
                position : 'relative' // 항목 표시 여부 (현재 설정은 안함)              

              }
            };
          
            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
          }
          
          </script>
          </div>
        </div>
      </div>
        <!--막대 차트 끝-->
		

  




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

	<!-- ex> MEMBER_ID = user01 -->
 <script type="text/javascript">
 

function login() {
	alert("로그인 해주세요");
}
 
  function changeImage() {
	   console.log("레스토랑 번호 : "+rno);
		console.log("아이디 : "+memberId); 
		
		var memberId = "${member.memberId}" ;
		 var rno = "${restaurant.rno}";
		  console.log("레스토랑 번호 : "+rno);
			console.log("아이디 : "+memberId); 
		  //var state =0;
    		$.ajax({
    			url :'${pageContext.request.contextPath}/restaurant/bookmark.do',
    			data : { rno : rno, memberId : memberId }, 
    			dataType : 'json',  
    			success : function(data){
    				if(data.status == "Y"){
    					   document.getElementById('image').src="${pageContext.request.contextPath}/resources/upload/post/bookmark2.png"; 
    				}else{
    					   document.getElementById('image').src="${pageContext.request.contextPath}/resources/upload/post/bookmark.png";
    				}
    				alert(data.msg);		
    			},error : function(req, status, error) {
    				console.log(req);
    				console.log(status);
    				console.log(error);
   				alert('에러임');	
    			}
   		});
   	}  
  

  
  
  
  
  
  
 </script>  


  
 
  <c:import url="/views/common/footer.jsp"/>

  </body>
</html>
