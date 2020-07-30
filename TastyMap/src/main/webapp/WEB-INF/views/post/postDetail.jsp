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
     
<div id="mapapi" class="carousel slide col-lg-8 col-lg-offset-4 col-md-10 col-md-offset-4 col-xs-2" style="width:87%;height:200px; "></div> 



     
<!-- 작성자 설명 란 -->

          <div class="col-md-8 ftco-animate">
            <br>
            <h4 class="mb-3" style="float: left;"> ${ post.nickname } </h4> .
           
			<!-- 경로 복사하기 -->
			<a href="#urlCopyBtn" class="urlCopyBtn">
				<span class="urlCopyBtnIcon" style="margin-left:10px; float: right;">URL복사</span>
			</a>
			<input type="text" value="localhost:8088/${pageContext.request.contextPath}/post/postDetail.do?pNo=${post.PNo}&memberId=" id="urlAddress" style="display:none;">
			<!-- 경로 복사하기 끝 -->
            
            <!--해당 페이지 출력 기능-->
            <img onclick="window.print()" border="0" src="${pageContext.request.contextPath}/resources/images/print/print.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;" />
                        
            <!-- 신고 이미지 -->
            <c:if test="${ map.pstatus eq 'N' }">
            <img id="postreportimage" onclick="changePostReport();" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren1.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
            <c:if test="${ map.pstatus eq 'Y' }">
            <img id="postreportimage" onclick="changePostReport();" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren2.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
                       
            <!-- 좋아요 이미지 -->
            <c:if test="${ map.status eq 'N' }">
            <img id="loveimage" onclick="changeLove();" border="0" src="${pageContext.request.contextPath}/resources/images/heart/heart1.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
            <c:if test="${ map.status eq 'Y' }">
            <img id="loveimage" onclick="changeLove();" border="0" src="${pageContext.request.contextPath}/resources/images/heart/heart2.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
      		
            <br>
            <hr/>
            <p>${post.PContent}</p>
            <hr/>
            

            <div class="pt-5 mt-5">
            	  
				<h3 class="mb-5" style="margin-bottom: 1rem !important;">댓글</h3> 
					<div class="col-12" style="padding: 0px;">
						<input type="text" style="width: 80%; margin-bottom: 5px;" id="normalcomment">
						<button type="button" class="btn btn-outline-primary col-2"style="float: right;" onclick="commentinsert(0,$('#normalcomment').val());">작성</button>					</div>
				<br><br>
				
				<ul class="comment-list">
					<!-- comment start-->
					<c:forEach items="${PComment}" var="PComment">
					<li class="comment" style="margin-left : ${(PComment.level -1) * 30}px; width : ${800 - ((PComment.level-1) * 15)}px;">
						<div class="vcard bio">
							<img src="${pageContext.request.contextPath}/resources/images/profileImage/${PComment.mphoto}" alt="Image placeholder" style="margin-bottom: 5px;">
							<h6>${PComment.nickname}</h6>
						</div>
						<div class="comment-body">
							<button type="button" class="btn btn-outline-danger" style="float: right;">신고</button>
							<button type="button" class="btn btn-outline-info" style="float: right; margin-right: 5px;" > 댓글 달기 </button>
							    
							<div class="meta">${fn:substring(PComment.cdate, 0, 10)}</div>
							<p>${PComment.ccontent}</p>
						</div>
					</li>
					</c:forEach>
				</ul>
            </div>
            
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
	<script type="text/javascript">
	// 댓글 작성
  	  function commentinsert(parentkey, content) {
			
			var memberId = "${member.memberId}";
			var pNo = "${post.PNo}";
			var parentkey = parentkey;
			var ccontent= content;
			
	    		$.ajax({
	    			url :'${pageContext.request.contextPath}/postComment/insertComment.do',
	    			data : { cwriter : memberId, pNo : pNo, ccontent : ccontent, parentkey : parentkey }, 
	    			dataType : 'json',  
	    			success : function(data){
	    				alert(data.msg);		
	    			},error : function(error) {
	    				console.log(error);
	   				/* ajax에서 msg에 값을 가져오고 싶으면 컨트롤러에서 map 형식으로 보내줘야한다.	 */	
	    			}
	   		});
	   	}     
	</script>
	<script type="text/javascript">
	// 좋아요 버튼
	  function changeLove() {
		   console.log("Post 번호 : " + pNo);
			console.log("아이디 : " + memberId); 
			
			var memberId = "${member.memberId}" ;
			 var pNo = "${post.PNo}";
			  console.log("Post 번호 : " + pNo);
				console.log("아이디 : " + memberId); 
			  //var state =0;
	    		$.ajax({
	    			url :'${pageContext.request.contextPath}/love/postLove.do',
	    			data : { pNo : pNo, memberId : memberId }, 
	    			dataType : 'json',  
	    			success : function(data){
	    				if(data.status == "Y"){
	    					   document.getElementById('loveimage').src="${pageContext.request.contextPath}/resources/images/heart/heart2.png"; 
	    				}else{
	    					   document.getElementById('loveimage').src="${pageContext.request.contextPath}/resources/images/heart/heart1.png";
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
	  
  	// 게시글 신고
		function changePostReport() {
			
			var memberId = "${member.memberId}";
			var pNo = "${post.PNo}";
			
			$.ajax({
				url : '${pageContext.request.contextPath}/report/insertPostReport.do',
				data : { pNo : pNo, memberId : memberId },
				dataType : 'json',
				success : function(data) {
					// 메세지 출력			
					alert(data.pmsg);
					document.getElementById('postreportimage').src="${pageContext.request.contextPath}/resources/images/report/siren2.png";
				}, error : function(req, qstatus, error) {
					console.log(req);
					console.log(qstatus);
					console.log(error);
					alert('에러입니다.');
				}
				
			});
		}	  
	 </script>  
	 
	 <!-- 지도 시작 -->
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
	
	<!-- 경로 복사 스크립트 -->
	<script type="text/javascript">
		$('.urlCopyBtn').click(function(){   
		
		   var urlAddress= $('#urlAddress');
		   urlAddress.css('display','block').select();
		   document.execCommand("Copy");
		   urlAddress.css('display','none');
		   alert('URL 주소가 복사 되었습니다');   
		   return false;
		});
	</script>   

	<!-- 지도 끝-->
      
    <!-- footer 시작 -->
<c:import url="/views/common/footer.jsp"/>
</body>
</html>