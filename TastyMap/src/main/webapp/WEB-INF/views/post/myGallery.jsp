<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>

<head>
<title>tastyMap</title>
<meta charset="utf-8">
<c:import url="/views/common/header.jsp" />
<!-- ------------------------ 팔로워 팔로잉 리스트 출력 모달 출력 시작 ------------------------------- -->
<style>
@import
	url("https://fonts.googleapis.com/css?family=IBM+Plex+Mono:400,400i|IBM+Plex+Sans+Condensed:400,400i|IBM+Plex+Sans:100,100i,400,400i,700,700i|IBM+Plex+Serif:400,400i")
	;

.about {
	position: fixed;
	z-index: 10;
	bottom: 10px;
	right: 10px;
	width: 40px;
	height: 40px;
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	transition: all 0.2s ease;
}

.about .bg_links {
	width: 40px;
	height: 40px;
	border-radius: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 100%;
	backdrop-filter: blur(5px);
	position: absolute;
}

.about .logo {
	width: 40px;
	height: 40px;
	z-index: 9;
	background-image:
		url(https://rafaelalucas91.github.io/assets/codepen/logo_white.svg);
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: 10px 7px;
	opacity: 0.9;
	transition: all 1s 0.2s ease;
	bottom: 0;
	right: 0;
}

.about .social {
	opacity: 0;
	right: 0;
	bottom: 0;
}

.about .social .icon {
	width: 100%;
	height: 100%;
	background-size: 20px;
	background-repeat: no-repeat;
	background-position: center;
	background-color: transparent;
	display: flex;
	transition: all 0.2s ease, background-color 0.4s ease;
	opacity: 0;
	border-radius: 100%;
}

.about .social.portfolio {
	transition: all 0.8s ease;
}

.about .social.portfolio .icon {
	background-image:
		url(https://rafaelalucas91.github.io/assets/codepen/link.svg);
}

.about .social.dribbble {
	transition: all 0.3s ease;
}

.about .social.dribbble .icon {
	background-image:
		url(https://rafaelalucas91.github.io/assets/codepen/dribbble.svg);
}

.about .social.linkedin {
	transition: all 0.8s ease;
}

.about .social.linkedin .icon {
	background-image:
		url(https://rafaelalucas91.github.io/assets/codepen/linkedin.svg);
}

.about:hover {
	width: 105px;
	height: 105px;
	transition: all 0.6s cubic-bezier(0.64, 0.01, 0.07, 1.65);
}

.about:hover .logo {
	opacity: 1;
	transition: all 0.6s ease;
}

.about:hover .social {
	opacity: 1;
}

.about:hover .social .icon {
	opacity: 0.9;
}

.about:hover .social:hover {
	background-size: 28px;
}

.about:hover .social:hover .icon {
	background-size: 65%;
	opacity: 1;
}

.about:hover .social.portfolio {
	right: 0;
	bottom: calc(100% - 40px);
	transition: all 0.3s 0s cubic-bezier(0.64, 0.01, 0.07, 1.65);
}

.about:hover .social.portfolio .icon:hover {
	background-color: #698fb7;
}

.about:hover .social.dribbble {
	bottom: 45%;
	right: 45%;
	transition: all 0.3s 0.15s cubic-bezier(0.64, 0.01, 0.07, 1.65);
}

.about:hover .social.dribbble .icon:hover {
	background-color: #ea4c89;
}

.about:hover .social.linkedin {
	bottom: 0;
	right: calc(100% - 40px);
	transition: all 0.3s 0.25s cubic-bezier(0.64, 0.01, 0.07, 1.65);
}

.about:hover .social.linkedin .icon:hover {
	background-color: #0077b5;
}

/* main 1*/
/* main 2*/
/* neutral 1*/
/* neutral 2*/
#wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.content {
	max-width: 600px;
	width: 100%;
	min-width: 260px;
	margin: 0 5%;
	margin-top: 10%;
	transition: 0.3s ease;
}

@media screen and (max-width: 512px) {
	.content {
		margin: 0 4%;
		margin-top: 5%;
	}
}

/* Tabs menu */
.tabs {
	margin: 0;
	background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 80px;
	border-radius: 2px 2px 0px 0px;
}

@media screen and (max-width: 512px) {
	.tabs {
		height: 40px;
	}
}

/* Tab Links */
.tablinks {
	background: transparent;
	background-image: linear-gradient(90deg, transparent 70%, rgba(255, 255, 255, 0.2)
		100%);
	border: 0;
	outline: 0;
	cursor: pointer;
	width: 25%;
	/*change depending on the number of tabs*/
	height: 80px;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	font-family: "IBM Plex Sans", sans-serif;
	overflow: hidden;
	transition: 0.3s ease;
}

@media screen and (max-width: 512px) {
	.tablinks {
		height: 40px;
		font-size: 12px;
	}
}

.tablinks:before {
	background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	content: "";
	width: 100%;
	height: 0px;
	position: absolute;
	top: 0;
	left: 0;
	transition: 0.3s ease-in-out;
	z-index: 2;
}

/*tab buttons hover*/
.tablinks:hover::before {
	height: 100%;
	z-index: 2;
	bottom: 0;
}

@media screen and (max-width: 512px) {
	.tablinks:hover::before {
		height: 0;
	}
}

/* Tab active */
.tablinks.active {
	background-color: white;
	z-index: 0;
	border-right: 0px;
	border-left: 0px;
	height: 110px;
	bottom: 0px;
	overflow: hidden;
	border: 0;
	outline: 0;
}

@media screen and (max-width: 512px) {
	.tablinks.active {
		height: 60px;
	}
}

.tablinks.active:before {
	content: "";
	width: 100%;
	height: 5px;
	top: 0;
	left: 0;
}

/* Tabs text */
.tablinks.active p, .tablinks.active:hover p {
	opacity: 1;
	background: -webkit-linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.tablinks p {
	opacity: 0.6;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 2;
	transition: 0.5s ease;
	padding: 0;
	margin: 0;
	color: #686868;
	backface-visibility: hidden;
	font-weight: 400;
}

.tablinks:hover p {
	color: white;
	opacity: 1;
}

@media screen and (max-width: 512px) {
	.tablinks:hover p {
		color: #686868;
		opacity: 0.6;
	}
}

/* Tabs text bigger */
.tablinks p:before {
	content: attr(data-title);
	position: absolute;
	height: auto;
	width: auto;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.1;
	font-size: 40px;
	transition: 1s ease-out;
	z-index: -1;
	font-weight: 600;
	top: 110%;
}

@media screen and (max-width: 512px) {
	.tablinks p:before {
		display: none;
	}
}

.tablinks:hover p:before {
	opacity: 0.1;
	font-size: 40px;
	top: -80%;
}

/* tab content */
.wrapper_tabcontent {
	background-color: white;
	margin-top: 0px;
	z-index: -3;
	position: relative;
	opacity: 1;
	padding: 40px 60px;
	overflow: hidden;
	transition: all 1s ease;
	top: 0;
}

.tabcontent {
	display: none;
	min-height: 180px;
}

@
keyframes tabEffect {from { top:-40px;
	
}

to {
	top: 0px;
}

}
.tabcontent.active {
	transition: all 1s ease;
	display: block;
}

/* Tab content line */
.wrapper_tabcontent:after {
	content: "";
	height: 5px;
	width: 100%;
	position: absolute;
	background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	left: 0;
	bottom: 0;
	z-index: -2;
	transition: all 1s ease;
}

/* Title */
.tabcontent h3 {
	font-size: 40px;
	top: 75px;
	transform: rotate(90deg);
	position: absolute;
	left: -90px;
	opacity: 0.1;
	width: 200px;
	height: 60px;
	background: -webkit-linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	padding: 0;
	animation: city 1s ease;
}

@media screen and (max-width: 512px) {
	.tabcontent h3 {
		top: 65px;
	}
}

@
keyframes city {from { left:-150px;
	
}

to {
	left: -90px;
}

}
/* Text*/
.tabcontent p {
	color: #686868;
	margin: 0;
	padding: 0;
	line-height: 28px;
	font-weight: 100;
	transition: all 1s ease;
	animation: fadeEffect 0.6s ease;
	width: 100%;
	font-size: 16px;
	font-family: "IBM Plex Sans", sans-serif;
}

@media screen and (max-width: 512px) {
	.tabcontent p {
		font-size: 14px;
		line-height: 26px;
	}
}

@
keyframes fadeEffect {from { opacity:0;
	margin-left: 30px;
}

to {
	opacity: 1;
	margin-left: 0;
}
}
</style>



<!-- ------------------------ 팔로워 팔로잉 리스트 출력 모달 출력 끝 ------------------------------- -->
</head>
<body>

	<c:set var="m" value="${ sessionScope.member }" />
	<!-- m : member -->


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
				<div
					class="col-md-12 heading-section text-center ftco-animate mb-5 fadeInUp ftco-animated">
					<span class="subheading">${user.nickname}님의 페이지</span>
				</div>
			</div>
		</div>
		<div class="container" style="display: table;">
			<div class="row">
				<!-- <div class="col-12" style="display: inline-flex;"> -->
				<div class="col-lg-5 col-md-5" style="text-align: -webkit-right;">
					<div class="one-half img d-flex align-self-stretch"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/profileImage/${member.mphoto}'); height : 350px; width : 350px; border-radius: 30%;
          overflow: hidden;"></div>
					<!-- ${m.mphoto} -->
				</div>
				<!-- <div class="one-half half-text d-flex justify-content-end align-items-center"> -->
				<div class="col-lg-5 col-md-5"
					style="display: table-cell; vertical-align: middle;">
					<div class="row d-flex">

						<div
							class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
							<div class="media block-6 services-wrap d-flex">

								<div class="media-body pl-4">

									<c:if test="${ empty member}">
										<!-- 비회원일때-->
										<img id="followerimg" onclick="login();" border="0"
											src="${pageContext.request.contextPath}/resources/images/follower/follower1.png"
											style="width: 30px; height: 30px; float: right;">
									</c:if>
									<c:if test="${ !empty member}">
										<!-- 회원일때-->
										<c:if test="${member.memberId ne user.memberId }">
											<!-- 비회원이거나  로그인한 아이디와 마이갤러리의 아이디가 다를때 보이기-->
											<c:if test="${ map.status eq 'N' }">
												<img id="followerimg" onclick="changefollower();" border="0"
													src="${pageContext.request.contextPath}/resources/images/follower/follower1.png"
													style="width: 30px; height: 30px; float: right; margin-right: 7px;">
											</c:if>
											<c:if test="${ map.status eq 'Y' }">
												<img id="followerimg" onclick="changefollower();" border="0"
													src="${pageContext.request.contextPath}/resources/images/follower/follower2.png"
													style="width: 30px; height: 30px; float: right; margin-right: 7px;">
											</c:if>
										</c:if>
									</c:if>

									<h3>사용자 이름 : ${user.nickname}</h3>
								</div>
							</div>
						</div>
						<div
							class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
							<div class="media block-6 services-wrap d-flex">

								<div class="media-body pl-4">
									<p>게시글 : ${myPostCnt}</p>
									<p>
										<a href="#followListModal" data-toggle="modal"
											data-target="#followListModal">팔로워 : ${followerCnt}</a>
									</p>
									<p>
										<a href="#followListModal" data-toggle="modal"
											data-target="#followListModal">팔로우 : ${followingCnt}</a>
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-md-12 d-flex align-self-stretch ftco-animate fadeInUp ftco-animated">
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

				<c:forEach var="post0img" items="${ myGPhoto }">
					<!-- 이미지 반복문 -->

					<div class="col-md-4 ftco-animate"
						style="padding-right: 5px; padding-left: 5px; width: 300px; height: 350px; padding-top: 5px; padding-bottom: 5px;">
						<div class="agent" style="width: 100%; height: 100%;">
							<a
								href="${pageContext.request.contextPath}/post/postDetail.do?pNo=${post0img.PNO}&memberId=${member.memberId}">
									<img
										src="${pageContext.request.contextPath}/resources/upload/post/${post0img.pRenamedName}"
										class="img-fluid" alt="Colorlib Template"
										style="width: 100%; height: 100%;">
							</a>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>
	</section>

	<!-- ------------------------ 팔로워 팔로잉 리스트 출력 모달 출력 시작 ------------------------------- -->

	<!-- about -->
	<!-- partial:index.partial.html -->
	<!-- about -->
	<div class="about">
		<a class="bg_links social portfolio"
			href="https://www.rafaelalucas.com" target="_blank"> <span
			class="icon"></span>
		</a> <a class="bg_links social dribbble"
			href="https://dribbble.com/rafaelalucas" target="_blank"> <span
			class="icon"></span>
		</a> <a class="bg_links social linkedin"
			href="https://www.linkedin.com/in/rafaelalucas/" target="_blank">
			<span class="icon"></span>
		</a> <a class="bg_links logo"></a>
	</div>
	<!-- end about -->

			<!-- Tab content -->
			<div class="modal fade" id="followListModal" tabindex="-1"
				role="dialog" aria-labelledby="followListModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document" >
					<div class="modal-content" style="width : 500px;">

						<div class="modal-header">
							<h5 class="modal-title" id="followListModalLabel">Follower & Following</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
							<!-- Tab links -->
							<div class="tabs">
								<button class="tablinks active" data-country="London"
									style="width: 50%">
									<p data-title="follower">팔로워리스트</p>
								</button>
								<button class="tablinks" data-country="Paris"
									style="width: 50%;">
									<p data-title="following">팔로잉리스트</p>
								</button>
							</div>
							<div class="wrapper_tabcontent" style="z-index:100;">
								<div id="London" class="tabcontent active">
									<h3>FOLLOWER</h3>


									<!--반복 시작-->
									 <c:forEach  items="${myFollowingList}" var="followings">    
    <div class="center" style="width: 350px; height: 50px; border: 1px solid lightgray; border-radius: 4%; margin-top: 5px;">
                <img src="${pageContext.request.contextPath}/resources/images/profileImage/${followings.mphoto}"
			   						class="rounded-circle" style="width:49px; height: 49px; margin-right: 10px"alt="">
			   	 <span style="font-size: 16px;">${followings.nickname}(${followings.userName})
               </span>
                       
                        <button type="button" id="followingCancel" onclick="followingCancel('${followings.fmemberId}', this);" class="btn btn-danger float-right" style="width:100px; height:30px; margin-top: 8px; margin-right: 7px;">
                            팔로워삭제
                        </button>     
    </div>
    </c:forEach>
									<!--반복 끝-->






								</div>
								<div id="Paris" class="tabcontent">
									<h3>FOLLOWING</h3>

                     <!--반복 시작-->
	
    
    								 <c:forEach  items="${myFollowerList}" var="followers">
    <div class="center" style="width: 350px; height: 50px; border: 1px solid lightgray; border-radius: 4%; margin-top: 5px;">
                <img src="${pageContext.request.contextPath}/resources/images/profileImage/${followers.mphoto}"
			   						class="rounded-circle" style="width:49px; height: 49px; margin-right: 10px"alt="">
			  
             <span style="font-size: 16px;">${followers.nickname}(${followers.userName})
               </span>
                        <button type="button" id="followerCancel" onclick="followerCancel('${followers.fmemberId}',this);" class="btn btn-danger float-right" style="width:100px; height:30px; margin-top: 8px; margin-right: 7px;">
                            팔로잉취소
                        </button>     
    </div>
    </c:forEach>
    <!--반복 끝-->
    

								</div>
							</div>
					</div>
				</div>
			</div>
			
	
			

	
	
	<!-- partial -->
	<script>
		// ------------------------ 팔로워 모달에 필요한 js -------------------------------//
		// tabs

		var tabLinks = document.querySelectorAll(".tablinks");
		var tabContent = document.querySelectorAll(".tabcontent");

		tabLinks.forEach(function(el) {
			el.addEventListener("click", openTabs);
		});

		function openTabs(el) {
			var btnTarget = el.currentTarget;
			var country = btnTarget.dataset.country;

			tabContent.forEach(function(el) {
				el.classList.remove("active");
			});

			tabLinks.forEach(function(el) {
				el.classList.remove("active");
			});

			document.querySelector("#" + country).classList.add("active");

			btnTarget.classList.add("active");
		}

		// ------------------------ 팔로워 모달에 필요한 js -------------------------------//
	</script>

	<!-- ------------------------ 팔로워 팔로잉 리스트 출력 모달 출력 끝 ------------------------------- -->
	<script type="text/javascript">
		// 팔로워 버튼
		function changefollower() {

			var memberId = "${user.memberId}";
			var followerId = "${member.memberId}";

			//var state =0;
			$.ajax({
				url : '${pageContext.request.contextPath}/member/clickFollower.do',
				data : {
					memberId : memberId,
					followerId : followerId
				},
				dataType : 'json',
				success : function(data) {
					if (data.status == "Y") {
						document.getElementById('followerimg').src = "${pageContext.request.contextPath}/resources/images/follower/follower2.png";
					} else {
						document.getElementById('followerimg').src = "${pageContext.request.contextPath}/resources/images/follower/follower1.png";
					}
					alert(data.msg);
				},
				error : function(req, status, error) {
					console.log(req);
					console.log(status);
					console.log(error);
					alert('에러임');
				}
			});
			
		}

		function followerCancel(obj, button) {
			
			var me = "${member.memberId}";
			 var you = obj;
			   
			  //var state =0;
		  		$.ajax({
		  			url :'${pageContext.request.contextPath}/member/followerCancel.do',
		  			data : { memberId : you, followerId : me }, 
		  			dataType : 'json',  
		  			success : function(data){
		                console.log(data);
		                // if(data=="true") //stream 방식
		                if(data.isUsable==true){ //viewName 방식
		                	console.log("팔로워 삭제 성공");
		                	$(button).parent().remove();
		                } else {
		                	console.log("팔로워 삭제 실패");
		                    
		                }
		                
		                
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
		 		});
		 	}   
		
		function followingCancel(obj, button) {
		
			var me = "${member.memberId}";
			var you = obj;
		   
		  //var state =0;
			$.ajax({
				url :'${pageContext.request.contextPath}/member/followingCancel.do',
				data : { memberId : me, followerId : you }, 
				dataType : 'json',  
				success : function(data){
	                console.log(data);
	                
	                // if(data=="true") //stream 방식
	                if(data.isUsable==true){ //viewName 방식
	                	console.log("팔로잉 취소 성공");
	                	$(button).parent().remove();
	                } else {
	                	console.log("팔로잉 취소 실패");
	                    
	                }
	                
	             	
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
			});
		}
	</script>

	<!-- footer 시작 -->
	<c:import url="/views/common/footer.jsp" />
</body>
</html>