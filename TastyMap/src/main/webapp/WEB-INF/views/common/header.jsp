<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<head>
   <meta charset="UTF-8">

    <title>Tasty Map</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
	
	<!--Chrome, Safari, IE -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">
	<!-- Firefox, Opera  -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <script>
    function logoutCheck() {

    	 if (confirm("로그아웃하시겠습니까??") == true){    //확인
			
    		 location.href='${pageContext.request.contextPath}/member/memberLogout.do';

    	 }else{   //취소

    	     return false;

    	 }

    }

    function goFindId(){
    		// 주소검색을 수행할 팝업 페이지를 호출합니다.
    		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    		var pop = window.open("${pageContext.request.contextPath}/member/goFindId.do","pop","width=570,height=480, scrollbars=no, resizable=yes"); 
    		
    		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    	  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
    	}
    </script>
    <style>
    	.profile-box {
    	 	width: 45px;
    	 	height: 45px;
		    border-radius: 100%;
		    overflow: hidden;
    	}
    	
    </style>
  </head>
  <body>

     <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
        <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width: 270px;" /></a>
         <!-- <a class="navbar-brand" href="index.html">Findstate</a> -->
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <li class="nav-item active"><a href="${pageContext.request.contextPath}" class="nav-link">Home</a></li>
             <li class="nav-item"><a href="${pageContext.request.contextPath}/restaurant/restaurantAllList.do" class="nav-link">Restaurant</a></li>
           	 <li class="nav-item"><a href="${pageContext.request.contextPath}/post/postAllList.do" class="nav-link">Post</a></li>
         
            <%-- <c:if test="${ empty member.memberId }">
           		<li class="nav-item"><a href="#loginModal" class="nav-link" data-toggle="modal" data-target="#loginModal" >Write</a></li>
           </c:if>  --%>
            <c:if test="${ !empty member.memberId }">
           		<li class="nav-item"><a href="${pageContext.request.contextPath}/post/insertPost.do" class="nav-link">Write</a></li>
			</c:if>
			
           <c:if test="${ empty member.memberId }">
           		<li class="nav-item"><a href="#loginModal" class="nav-link" data-toggle="modal" data-target="#loginModal" >my Gallery</a></li>
           </c:if> 
           <c:if test="${ !empty member.memberId }">
           		<li class="nav-item"><a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${member.memberId}&followerId=${member.memberId}" class="nav-link">my Gallery</a></li>
     	     </c:if>

             <!-- <li class="nav-item"><a href="agent.html" class="nav-link">Agent</a></li>
             <li class="nav-item"><a href="properties.html" class="nav-link">Listing</a></li> -->
             <li class="nav-item" id="pop"><span class="nav-link" data-toggle="popover"><img src="${pageContext.request.contextPath}/resources/images/bell.png" data-toggle="popover"></span></li>
            
           
            <!-- 로그인 처리 --> 
            <!--  로그인이 안된 상태 -->
         <c:if test="${empty member}">
           <li class="nav-item"><a href="#loginModal" class="nav-link"><button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#loginModal">login</button></a></li>
		   <li class="nav-item"><a href="${pageContext.request.contextPath}/member/goInsertMember.do" class="nav-link"><button type="button" class="btn btn-outline-success">sing up</button></a></li>
         </c:if>
         <!--  로그인 후  -->
         <c:if test="${!empty member}">
         	<li class="nav-item">
         		<a href="${pageContext.request.contextPath}/member/myPage.do?memberId=${member.memberId}" class="nav-link">
	         		<img src="${pageContext.request.contextPath}/resources/images/profileImage/${member.mphoto}"
			   						class="rounded-circle" style="width:31px; height: 31px"alt="">
			   	</a>
			</li>
           <li class="nav-item"><a href="#" onclick="logoutCheck();" class="nav-link"><img src="${pageContext.request.contextPath}/resources/images/logout.png"  style="width:31px; height:31px" alt=""></a></li>
           <c:if test="${member.memberId eq 'admin'}">
           	<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/adminMain.do" class="nav-link">admin</a></li>
          </c:if>
         </c:if>
           </ul>
         </div>
       </div>
     </nav>
   <!-- END nav -->

   <!-- modal start -->
   <!-- <span data-placement="bottom" >Popover Me !!!</span> -->
   <div id="popover-content" style="display:none; width:500px;">
      <div class="panel panel-default" id="myLargeModal style="margin:20px;">
         <div class="panel-heading">
            <fieldset style="text-align: center; margin-top: 10px;"><strong>알림</strong></fieldset>
         </div>
         <hr>
         <div class="panel-body" id="approvalHeartbit">
            
            
            <div class="row" style="width: 500px;">
               <div class="col-lg-2">
                  <img src="${pageContext.request.contextPath}/resources/images/bee.png" alt="">
               </div>
               <!-- <div class="col-1"></div> -->
               <div class="col-8" style="display: inline; line-height: 4;">
                  000 님이 회원님을 팔로우하기 시작했습니다.
               </div>
               <button style="margin-top:12px; border-radius : 5px; height: 30px; background-color:dodgerblue; color: white; border: none;">맞팔하기</button>
            </div>
            
            
            <hr>
            
            
            <div class="row" style="width: 500px;">
               <div class="col-lg-2">
                  <img src="${pageContext.request.contextPath}/resources/images/bee.png" alt="">
               </div>
               <!-- <div class="col-1"></div> -->
               <div class="col-8" style="display: inline; line-height: 4;">
                  000 님이 회원님의 사진을 좋아합니다.
               </div>
               <img src="${pageContext.request.contextPath}/resources/images/res/res1.jpg" style="width: 70px;">
            </div>
            <hr>
            <div class="row" style="width: 500px;">
               <div class="col-lg-2">
                  <img src="${pageContext.request.contextPath}/resources/images/bee.png" alt="">
               </div>
               <!-- <div class="col-1"></div> -->
               <div class="col-8" style="display: inline; line-height: 4;">
                  000 님이 회원님의 게시글에 댓글을 남겼습니다.
               </div>
               <img src="${pageContext.request.contextPath}/resources/images/res/res2.jpg" style="width: 70px;">
            </div>
            <hr>
         </div>
         <!-- <div class="panel-footer">
            <input type="button" class="btn btn-success" value="Save" />
            <input type="button" class="btn btn-danger" id="closePopover" value="Close" />
         </div> -->
      </div>
   </div>
   <!-- modal end -->
   
   <!-- 로그인 모달 시작 -->
   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="padding:5%">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <br />
          <!--로그인폼 -->
          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
                  <div class="form-group">
                    <label for="inputId">아이디</label>
                    <input type="text" class="form-control" id="inputId" name="inputId" placeholder="아이디를 입력해주세요">
                  </div>
                  <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="비밀번호를 입력해주세요">
                  </div>
                  <br>

                    <div class="form-group text-center">
                        <button type="submit" id="login-submit" class="btn btn-primary" style="width: 100%; height: 50px;">
                            로그인<i class="fa fa-check spaceLeft"></i>
                        </button>
                    </div>
                    <div class="form-group text-center">
                     <a href="${pageContext.request.contextPath}/member/goInsertMember.do">
                      <button type="button" id="join-submit" class="btn btn-primary" style="width: 50%; height: 50px;">
                          회원가입
                      </button>
                      </a>
                     
                      <button type="button" id="find-submit" class="btn btn-primary" onclick="goFindId();" style="width: 49%; height: 50px;">
                          아이디 / 비밀번호 찾기
                        </button>   
                  </div>
                </form>
	    </div>
	  </div>
	</div>
	<!-- 로그인 모달 끝-->
	<c:if test="${!empty member}">
         	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
	<script>
		var sock = new SockJS("<c:url value='/echo'/>");
	
		sock.onmessage = onMessage;
	
		function onMessage(evt) {
			var text = "";
			var data = JSON.parse(evt.data);
			var btnArr = [ 'ml-2', 'mb-3', 'btn-outline-primary', 'loveimage' ];
			var approvalMSG = $('#approvalHeartbit');
			//console.log(evt.data);
			if (data.length != 0) {
				$('#approvalHeartbit').css('display', 'block');
				$('#approvalNoMSG').css('display', 'none');
				approvalMSG.empty();
				for (var i = 0; i < data.length; i++) {
					//console.log(data[i]);
					
					switch(data[i].type) {
				    case 1:
				      text = '<div class="row">' + 
					              '<div class="profile-box" style="margin-left:5px;">' + 
					              '<img style="width: 100%; height: 100%; object-fit: cover;" src="${pageContext.request.contextPath}/resources/images/' + data[i].mphoto + '" alt="">' + 
					           '</div>' + 			           
					           '<div class="col-8" style="display: contents; line-height: 3;">' + 
					           data[i].whos + '님이 회원님의 사진을 좋아합니다.' + 
					           '</div>' + 
					           '<img src="${pageContext.request.contextPath}/resources/upload/post/' + data[i].prenamedName + '" style="width: 65px; height : 50px;">' + 
					        '</div>' + 
		          	  		'<hr>';
				      
				      approvalMSG.append(text);
				      //console.log(text);
				      break;
				      
				    case 2:
				      text = '<div class="row">' + 
					              '<div class="profile-box" style="margin-left:5px;">' +
					              '<img style="width: 100%; height: 100%; object-fit: cover;" src="${pageContext.request.contextPath}/resources/images/' + data[i].mphoto + '" alt="">' +
					           '</div>' +			          
					           '<div class="col-12" style="display: contents; line-height: 3;"><a>' + 
					           data[i].whos + '님이 게시글에 댓글을 남겼습니다.' + 
					           '</a></div>' + 
					           '<div><img src="${pageContext.request.contextPath}/resources/upload/post/' + data[i].prenamedName + '" style="width: 65px; height : 50px;"></div>' + 
					        '</div>' + 
		          	  		'<hr>';
				   	  
				   	  approvalMSG.append(text);
				      
				      //console.log(text);
				      break;
				      
					}
				}
			
			}else {
	
				approvalMSG = $("<div class='m-3' align='center' ><h5 class='text-info'>새로운 알람이 없습니다</h5></div>");
	
			}
			$('.panel-body').append(approvalMSG);
			
		}
		
	</script>
	</c:if>
</html>