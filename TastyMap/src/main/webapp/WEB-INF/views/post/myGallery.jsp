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
    
	<c:set var="m" value="${ sessionScope.member }" /> <!-- m : member -->
	

    <!-- 상위 집 이미지 -->
<%--     <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>                                                                
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h2 class="mb-3 bread">${user.nickname}님의 갤러리</h2>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single<i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section> --%>
    <hr>
    <br />
    <br />
    <br />
    <br />
    
    <!-- 프로필 사진, 이름, 팔로워 버튼, 팔로워 수, 설명 등등..-->
    <section class="ftco-section ftco-fullwidth">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5 fadeInUp ftco-animated">
          	<span class="subheading">${user.nickname}님의 페이지</span>
          </div>
        </div>
      </div>
    	<div class="container" style="display:table;">
        <div class="row">
    		<!-- <div class="col-12" style="display: inline-flex;"> -->
          <div class="col-lg-5 col-md-5" style="text-align: -webkit-right;">
          <div class="one-half img d-flex align-self-stretch" style="background-image: url('${pageContext.request.contextPath}/resources/images/profileImage/${member.mphoto}'); height : 350px; width : 350px; border-radius: 30%;
          overflow: hidden;"></div>                                                   <!-- ${m.mphoto} -->
          </div>
					<!-- <div class="one-half half-text d-flex justify-content-end align-items-center"> -->
						<div class="col-lg-5 col-md-5" style=" display:table-cell;
            vertical-align: middle;">
							<div class="row d-flex">
                
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            
			              <div class="media-body pl-4">
			              
			              	<c:if test="${ empty member}"> <!-- 비회원일때-->
                     			<img id="followerimg" onclick="login();" border="0" src="${pageContext.request.contextPath}/resources/images/follower/follower1.png" style="width: 30px; height: 30px; float: right;">
                     		</c:if>
                     		<c:if test="${ !empty member}"> <!-- 회원일때-->
                     			<c:if test="${member.memberId ne user.memberId }"> <!-- 비회원이거나  로그인한 아이디와 마이갤러리의 아이디가 다를때 보이기-->
                     				<c:if test="${ map.status eq 'N' }">
						            <img id="followerimg" onclick="changefollower();" border="0" src="${pageContext.request.contextPath}/resources/images/follower/follower1.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
						      		</c:if>
						            <c:if test="${ map.status eq 'Y' }">
						            <img id="followerimg" onclick="changefollower();" border="0" src="${pageContext.request.contextPath}/resources/images/follower/follower2.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
						      		</c:if>
                     			</c:if>
                     		</c:if>
                     		
			                <h3>사용자 이름 : ${user.nickname}</h3> 
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            	
			              <div class="media-body pl-4">
                      <p>게시글 : ${myPostCnt}</p>  
                      <p>팔로워 : ${followerCnt}</p> 
                      <p>팔로우 : ${followingCnt}</p>
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
			            <div class="media block-6 services-wrap d-flex">
			            
			              <div class="media-body pl-4">
			                <p>프로필 내용 : ${user.mcontent}</p>
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

    <!-- 사진 갤러리 list -->
    <section class="ftco-section ftco-agent" style="margin-left: 100px;">
    	<div class="container">
        	<div class="row">
        	
        		<c:forEach var="post0img" items="${ myGPhoto }"> <!-- 이미지 반복문 -->
        		
          		<div class="col-md-4 ftco-animate" style="padding-right : 5px; padding-left : 5px; width:300px; height: 350px; padding-top:5px; padding-bottom : 5px;">
            		<div class="agent" style="width: 100%; height: 100%;">
              			<a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=${post0img.PNO}&memberId=${member.memberId}">
    						<div class="img" style="width: 100%; height: 100%;">
		    					<img src="${pageContext.request.contextPath}/resources/upload/post/${post0img.pRenamedName}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                			</div>
              			</a>
    				</div>
        		</div>
        		
        		</c:forEach>
  
       		</div>
    	</div>
    </section>
    
	<script type="text/javascript">
	// 팔로워 버튼
 	  function changefollower() {
			
			var memberId = "${user.memberId}" ;
			 var followerId = "${member.memberId}";
			   
			  //var state =0;
	    		$.ajax({
	    			url :'${pageContext.request.contextPath}/member/clickFollower.do',
	    			data : { memberId : memberId, followerId : followerId }, 
	    			dataType : 'json',  
	    			success : function(data){
	    				if(data.status == "Y"){
	    					   document.getElementById('followerimg').src="${pageContext.request.contextPath}/resources/images/follower/follower2.png"; 
	    				}else{
	    					   document.getElementById('followerimg').src="${pageContext.request.contextPath}/resources/images/follower/follower1.png";
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
		
<!-- footer 시작 -->
<c:import url="/views/common/footer.jsp"/>
</body>
</html>