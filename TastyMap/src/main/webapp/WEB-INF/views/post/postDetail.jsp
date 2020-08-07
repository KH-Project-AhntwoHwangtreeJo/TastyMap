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
	<c:set var="m" value="${ sessionScope.member }" /> <!-- m : member -->
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
keyframes tabEffect {from { top:-40px;}

to {top: 0px;}}
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
	</style>
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
            <a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${post.member_Id}&followerId=${member.memberId}">
            <h4 class="mb-3" style="float: left;"> ${ post.nickname } </h4> 
           	</a>
           	
           	<!-- 포스트 조회수 -->
           	<p style="margin-left:10px; float: right;">조회수 : ${selectPCNT}</p>
			
			<!-- 경로 복사하기 -->
			<a href="#urlCopyBtn" class="urlCopyBtn">
				<span class="urlCopyBtnIcon" style="margin-left:10px; float: right;">URL복사</span>
			</a>
			<input type="text" value="localhost:8088/${pageContext.request.contextPath}/post/postDetail.do?pNo=${post.PNo}&memberId=" id="urlAddress" style="display:none;">
			<!-- 경로 복사하기 끝 -->
			
			<!-- 내 게시글에 좋아요한 사용자 리스트 -->
			<p>
				<a href="#followListModal" data-toggle="modal"
					data-target="#followListModal">좋아요♥  ${followerCnt}</a>
			</p>
			<!-- 끝 -->
			
            
            <!-- 신고 이미지, 삭제 버튼 -->
            <c:if test="${ empty member.memberId }">    
	            <img id="preportimage" onclick="location.href=#loginModal" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren1.png" data-toggle="modal" data-target="#loginModal" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	        </c:if>  
            <c:if test ="${post.member_Id ne member.memberId and !empty member.memberId}"> <!-- 세션아이디와 포스트 아이디가 같지 않으면 신고보여주기 -->
	            <c:if test="${ map.pstatus eq 'N' }">
	            <img id="postreportimage" onclick="changePostReport();" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren1.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	      		</c:if>
	            <c:if test="${ map.pstatus eq 'Y' }">
	            <img id="postreportimage" onclick="changePostReport();" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren2.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	      		</c:if>
            </c:if>     
            <c:if test ="${post.member_Id eq member.memberId and !empty member.memberId}">
            	 <img id="deleteimage" onclick="location.href='${pageContext.request.contextPath}/post/postDelete.do?pNo=${post.PNo}'" border="0" src="${pageContext.request.contextPath}/resources/images/delete/delete.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
 
            </c:if>
            
            <!--해당 페이지 출력 기능-->
            <img onclick="window.print()" border="0" src="${pageContext.request.contextPath}/resources/images/print/print.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;" />
             
             <!-- 수정 이미지 -->        
             <c:if test="${post.member_Id eq member.memberId}"> 
            <c:if test="${ map.pstatus eq 'N' }"> 			
            <img id="postchange" onclick="change()" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren3.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
            <c:if test="${ map.pstatus eq 'Y' }">
            <img id="postchange" onclick="change()" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren3.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
      		</c:if>
   		    </c:if>
   		     
            <!-- 좋아요 이미지 -->
            <c:if test="${ empty member.memberId }">    
	            <img id="image" onclick="location.href=#loginModal" border="0" src="${pageContext.request.contextPath}/resources/images/heart/heart1.png" data-toggle="modal" data-target="#loginModal" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	        </c:if>   
            <c:if test="${ !empty member.memberId }">
	            <c:if test="${ map.status eq 'N' }">
	            <img id="loveimage" onclick="changeLove();" border="0" src="${pageContext.request.contextPath}/resources/images/heart/heart1.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	      		</c:if>
	            <c:if test="${ map.status eq 'Y' }">
	            <img id="loveimage" onclick="changeLove();" border="0" src="${pageContext.request.contextPath}/resources/images/heart/heart2.png" style="width: 30px; height: 30px; float: right; margin-right: 7px;">
	      		</c:if>
      		</c:if>
      		
            <br>
            <hr/>
            <h4>${post.PContent}</h4>
            <p>${post.star}</p>
            <hr/>
            

            <div class="pt-5 mt-5">
            	  
				<h3 class="mb-5" style="margin-bottom: 1rem !important;">댓글</h3> 
					<div class="col-12" style="padding: 0px;">
<%-- 						<input type="text" style="width: 80%; margin-bottom: 5px;" id="normalcomment">
						<c:if test="${ empty member.memberId }">
							<button type="button" class="btn btn-outline-primary col-2"style="float: right;" data-toggle="modal" data-target="#loginModal" onclick="loginModal">작성</button>
						</c:if>	
						<c:if test="${ !empty member.memberId }">
							<button type="button" class="btn btn-outline-primary col-2"style="float: right;" onclick="commentinsert(0,$('#normalcomment').val());">작성</button>
						</c:if>	 --%>
						<form action="${pageContext.request.contextPath}/postComment/insertComment.do">
							<input type="hidden" class="cwriter" name="cwriter" value="${member.memberId}"/>
							<input type="hidden" class="pNo" name="pNo" value="${post.PNo}"/>
							<input type="hidden" class="parentkey" name="parentkey" value="0"/>
							<input type="hidden" class="level" name="level" value="1"/>
							<input type="text" class="ccontent"name="ccontent" value="" style="width: 80%; margin-bottom: 5px;">
							<button type="submit" id="addReply(this)" class="btn btn-outline-primary col-2"style="float: right;" >작성</button>
						</form>
										
					</div>
				<br><br>
				
				<ul class="comment-list">
					<!-- comment start-->
					<c:forEach items="${PComment}" var="PComment" varStatus="status">
						
						<li class="comment" style="margin-left : ${(PComment.level -1) * 30}px; width : ${800 - ((PComment.level-1) * 15)}px;">
								<div class="vcard bio">
									<a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${PComment.cwriter}&followerId=${member.memberId}" style= " disabled :false">
										<img src="${pageContext.request.contextPath}/resources/images/profileImage/${PComment.mphoto}" alt="Image placeholder" style="margin-bottom: 5px;">
										<h6>${PComment.nickname}</h6>
									</a>
								</div>
							<div class="comment-body" id="commentadd" style="margin-bottom : 5px;">
								<c:if test="${ !empty member.memberId }">
									<c:if test="${PComment.cwriter eq member.memberId}">
										<input type="hidden" id="cno" class="cnoplace" name="cno" value="${PComment.cno}"/>
										<button type="button" id="deleteComment" class="btn btn-outline-info deleteBtn" onclick="deleteReply(this);" style="float: right; margin-right: 5px;">삭제하기</button>
										<button type="button" id="updateCommentBtn"class="btn btn-outline-info updateCommentBtn" style="float: right; margin-right: 5px; display:block"onclick="updateReply(this);" > 댓글 수정 </button>
										<button type="button" id="updateCompleteComment"class="btn btn-outline-info updateConfirm" onclick="updateConfirm(this);"	style="display:none; float: right; margin-right: 5px;" >수정완료</button> 
									</c:if>
									<c:if test="${PComment.cwriter ne member.memberId}">
										<input type="hidden" name="cwriter" class="cwriter" value="${member.memberId}"/>
										<input type="hidden" id="cno" class="cnoplace" name="cno" value="${PComment.cno}"/>
										<input type="hidden" name="level" class="level" value="${PComment.level}"/>
											
											<img class="commentreportimagewhite" onclick="changeCommentReport(this);" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren1.png"  style="display:block;width: 30px; height: 30px; float: right; margin-right: 7px;">
											<c:forEach items="${commentNoReportList}" var="commentNoReportList"  >
									            <c:if test="${ PComment.cno eq commentNoReportList.ReportCommentList and member.memberId eq commentNoReportList.MEMBER_ID}">
									            	<img class="commentreportimage" onclick="changeCommentReport(this);" border="0" src="${pageContext.request.contextPath}/resources/images/report/siren2.png"  style="display:block;width: 30px; height: 30px; float: right; margin-right: 7px;">
									            	<script>
									            		$(function(){
									            			var index= ${status.index};
									            			$('.commentreportimagewhite').eq(index).css('display','none');
									            		}); 
									            	</script>
									      		</c:if>
								      		</c:forEach>
								      		
										<button type="button" class="btn btn-outline-info" onclick="reComment(this);" style="float: right; margin-right: 5px;" >답글 달기</button>
										<button type="button" class="btn btn-outline-info insertConfirm" onclick="reConfirm(this);" style="display:none; float: right; margin-right: 5px;" >답글 완료</button>
									</c:if>
								</c:if>  
								<div class="meta">${fn:substring(PComment.cdate, 0, 10)}</div>
								
							</div>
							<p>${PComment.ccontent}</p>
						<input type="text" style=" display:none; width: 75%; margin-bottom: 5px; margin-top:13px" value="${PComment.ccontent}" class="inputupdate">  <!-- commentinsert(${PComment.level},$('#largecomment').val()); -->
						<input type="text" style=" display:none; width: 75%; margin-bottom: 5px; margin-top:13px" value="" class="largecomment">
						</li>
						
					</c:forEach>
				</ul>
            </div>
            <c:if test="${member.memberId eq post.member_Id}">
     		<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/post/postDelete.do?pNo=${post.PNo}'"style="float: right;" />
     		</c:if>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
      
    </section> <!-- .section -->
    
    <!-- 사용자 좋아요 시작 -->
    <div class="content">

			<!-- Tab content -->
			<div class="modal fade" id="followListModal" tabindex="-1"
				role="dialog" aria-labelledby="followListModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document" >
					<div class="modal-content" style="width : 500px;">
						<div class="modal-header">
							<h5 class="modal-title" id="followListModalLabel">좋아요♥</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
							<div class="wrapper_tabcontent" style="z-index:100;">
								
							<!--반복 시작-->
							<c:forEach items="${pList}" var="p">
								<div class="center" style="width: 350px; height: 50px; border: none; border-radius: 4%; margin-top: 5px;">
									<a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${member.memberId}&followerId=${member.memberId}"><img src="${pageContext.request.contextPath}/resources/images/profileImage/${p.MPhoto}"
										class="rounded-circle" style="width: 49px; height: 49px; margin-right: 10px" alt=""></a>
									<a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${member.memberId}&followerId=${member.memberId}"><span style="font-size: 16px;">${p.nickName}</span></a>
								</div>
								<hr />
							</c:forEach>
							<!--반복 끝-->
							</div>
						</div>
					</div>
				</div>
			</div>
		<script>
		// ------------------------ 사용자 좋아요 모달에 필요한 js -------------------------------//
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

		// ------------------------ 사용자 좋아요 모달에 필요한 js -------------------------------//
	</script>
	<!-- 사용자 좋아요 끝! -->
    
    	
	<!-- 댓글 관련 스크립트 -->
	<script>


	
	function updateReply(obj){
		// input 보이게 하기
		$(obj).parent().parent().find('.inputupdate').css('display', 'block');
		// 수정하기 버튼 숨기기
		$(obj).css('display', 'none');
		// 수정 완료 버튼 화면에 보이게 하기
		$(obj).next().css('display', 'block');
	}
	
	function updateConfirm(obj){
		// 변수 찾아오기
		var ccontent=$(obj).parent().parent().find('.inputupdate').val();
		var cno=$(obj).parent().children().eq(0).val();
		
		// 수정완료 버튼 숨기기
		$(obj).css('display', 'none');
		// 수정 하기 버튼 화면에 보이게 하기
		$(obj).prev().css('display', 'block');
		//input 안보이게 하기
		$(obj).parent().parent().find('.inputupdate').css('display', 'none');
		
		// ajax로 컨트롤러로 content 보내기
	 
		$.ajax({
			url :'${pageContext.request.contextPath}/postComment/updateComment.do',
			data : {cno : cno, ccontent : ccontent}, 
			dataType : 'json',  
			success : function(data){
				alert(data.msg);		
			},error : function(error) {
				console.log(error);
				// ajax에서 msg에 값을 가져오고 싶으면 컨트롤러에서 map 형식으로 보내줘야한다.	
			}
		}); 
		
	}
	
	function deleteReply(obj) {
		var cno = $(obj).parent().children().eq(0).val();
		
		$.ajax({
			url :'${pageContext.request.contextPath}/postComment/deleteCommnet.do',
			data : {cno : cno }, 
			dataType : 'json',  
			success : function(data){
				alert(data.msg);		
			},error : function(error) {
				console.log(error);
				// ajax에서 msg에 값을 가져오고 싶으면 컨트롤러에서 map 형식으로 보내줘야한다.	
			}
		}); 
	}
	
	// 답글 달기 버튼 누르면
	function reComment(obj) {
		// input 보여주고
		$(obj).parent().parent().find('.largecomment').css('display', 'block');
		// 답글달기 버튼 숨기고
		$(obj).css('display', 'none');
		// 답글완료 버튼 화면에 보이게 하기
		$(obj).next().css('display', 'block');
	}
	
	// 답글 완료 버튼 누르면
	function reConfirm(obj){
		// 변수 찾아오기
		var ccontent=$(obj).parent().parent().find('.largecomment').val();
		var cno=$(obj).parent().children().eq(1).val();
		var cwriter=$(obj).parent().find('.cwriter').val();
		var pNo = "${post.PNo}";
		
		console.log(ccontent);
		console.log(cno);
		console.log(cwriter);
		console.log(pNo);
		
		// 답글 완료 버튼 숨기기
		$(obj).css('display', 'none');
		// 수정 하기 버튼 화면에 보이게 하기
		//$(obj).parent().find('.updateCommentBtn').css('display', 'block');
		// input 숨기기
		$(obj).parent().parent().find('.largecomment').css('display', 'none');
		
		// ajax로 컨트롤러로 content 보내기
	 
		$.ajax({
			url :'${pageContext.request.contextPath}/postComment/insertComment.do',
			data : {ccontent : ccontent, parentkey : cno, cwriter : cwriter, pNo : pNo}, 
			dataType : 'json',  
			success : function(data){
				alert(data.msg);		
			},error : function(error) {
				console.log(error);
				// ajax에서 msg에 값을 가져오고 싶으면 컨트롤러에서 map 형식으로 보내줘야한다.	
			}
		}); 
		
	}
	
	</script>
	
	<script type="text/javascript">
	
	function commentUpdate(obj){
		document.getElementById('updateComment').attr('display','block');


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
					alert('에러인가?');
				}
				
			});
		}	  
  	
  	// 댓글 신고
 		function changeCommentReport(obj) {
			
			var memberId = "${member.memberId}";
			var reportNo = $(obj).parent().find('.cnoplace').val();
			console.log(reportNo);
			console.log(memberId);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/report/insertCommentReport.do',
				data : { reportNo : reportNo, memberId : memberId },
				dataType : 'json',
				success : function(data) {
					// 메세지 출력			
					alert(data.pcmsg);
					$(obj).attr('src','${pageContext.request.contextPath}/resources/images/report/siren2.png');
				}, error : function(req, qstatus, error) {
					console.log(req);
					console.log(qstatus);
					console.log(error);
					alert('에러입니다.');
				}
				
			});
		}	
  	
  	//수정 버튼 함수
function change(){
location.href = "${pageContext.request.contextPath}/post/postchange.do?nickname=${post.nickname}&rname=${post.rname}&memberId=${member.memberId}&address=${post.address}&pContent=${post.PContent}&star=${post.star}&pNo=${post.PNo}";

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