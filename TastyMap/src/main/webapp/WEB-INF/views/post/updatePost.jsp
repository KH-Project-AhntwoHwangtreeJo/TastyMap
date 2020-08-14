<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<style>
  *{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 30px;height: 60px;
  cursor: pointer;
}
.star_left{   
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 60px; 
  margin-right: -3px;
} 
.star_right{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
  background-size: 60px; 
  margin-left: -3px;
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<c:import url="/views/common/header.jsp"/>
<script>
//파일 삭제하기
function fileDelete() {
	$('#upFile').val(''); 
	$(".block-20.img").attr('src', '${pageContext.request.contextPath}/resources/images/picture.png');
	
    for(var i =0; i < 11; i++){  	  
       $("#upFile" + i).attr('src', '${pageContext.request.contextPath}/resources/images/picture.png');
      }
         
 
}
   /* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
  /*  function validate() {
      var content = $("[name=pContent]").val();
      if (content.trim().length == 0) {
         alert("내용을 입력하세요");
         return false;
      }
      return true;
   } */
   // 사진 게시판 미리보기 기능 지원 스크립트
   function loadImg(value) {
      //location.href="${pageContext.request.contextPath}/../..";
      //console.log(value.files);
      // 파일 객체의 내용을 텍스트 형식으로 읽는다.
      console.log(value);
      var reader = new FileReader();
      function readFile(index) {
         if (index >= value.files.length)
            return;// 이미지 길이가 갯수보다 작으면 리턴
         var file = value.files[index];
         //읽기가 성공하면, 읽기 결과를 표시한다.
         reader.onload = function(e) {
            //var bin = e.target.result;
            console.log("#upFile" + index);
            $("#upFile" + index).attr('src', e.target.result);
            readFile(index + 1);// 0부터 시작하니깐 끝날때마다 +1씩 더해준다.
         }
         reader.readAsDataURL(value.files[index]); // 0,1,2
      }
      readFile(0);//초기화
   }
   function goAddress(){
      
      var add = window.open("${pageContext.request.contextPath}/post/resAddress.do","add","width=570,height=420, scrollbars=yes, resizable=yes");
      //var vReturn = window.showModalDialog(url, "_blank", sFeatures);
       //document.formname.textfield.value = vReturn;
      //document.formname.rName.value = add;
   }
   
   function jusoCallBack(roadFullAddr, title){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      console.log(roadFullAddr);
      console.log(title);
      //document.form.roadFullAddr.value = roadFullAddr;
      /** 2017년 3월 추가제공 **/
   }
   
   function check(){
	    var send = true;
	    if(! $('#upFile').val()){
	       alert("사진을 등록해주세요!");
	       send=false;
	    }
	    if(! $("input[name='starValue']").val()){
	       alert("별점을 등록해주세요!");
	       send=false;
	    }
	    if(! $('#hiddenspace').val()){
	        alert("식당을 등록해주세요!");
	        send=false;
	     } 
	    return send;
	 };
   

</script>
</head>
<body>
    <br /><br />
   <%--  <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('${pageContext.request.contextPath}/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
          		
             <c:if test="${ empty star }">
            <h1 class="mb-3 bread">게시글 작성</h1>
            </c:if>
            <c:if test="${ !empty star }">
            <h1 class="mb-3 bread">게시글 수정</h1>
            </c:if>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section> --%>

    <section class="ftco-section contact-section">
      <div class="post-container">
       
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-6 align-items-stretch d-flex">
            <form role="form" name="form" id="form" method="post" class="bg-light p-5 contact-form" enctype="multipart/form-data">
              <!--사진 업로드-->
              <div class="wrap-input100 validate-input m-b-23"  data-validate = "Username is required">
                <span class="label-input100" ></span>      
                <label class="form-group"  id="upLoad" for="upFile" ><img src="${pageContext.request.contextPath}/resources/images/add-photo.png"  style="width: 50px;"></label>
                <br><input  multiple="multiple" type="file" id="upFile" name="upFile" onchange="loadImg(this);" style="display:none;" required>
               <!--  <span class="focus-input100" ></span> -->
              </div><!--// 사진 업로드 끝-->

              <!--올린 사진 미리보기로 뽑아주기(최대 10장까지-->
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="9"></li>

                </ol>
                <div class="carousel-inner">
             
                  <input type="hidden" name="pno" value="${pNo}" > 
                 <c:forEach var="postDetailimg" items="${ postPhoto }" varStatus="status"> <!-- 이미지 반복문 -->
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
         		</c:forEach>                          
               
                
                </div>
                
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" >
                  <span class="carousel-control-prev-icon" aria-hidden="false"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <!--// 사진 미리보기 끝-->
              <br>
              <div class="col-2"></div>
              <!--식당 주소 검색-->
              <!-- <div class="form-group">
              <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울 강남구 테헤란로 124 삼원타워</span>
              </div> -->

              <div class="callbackDiv">
              	<button type="button" class="btn btn-outline-danger col-3" onclick="fileDelete();">파일 삭제</button>
                
                <input type="hidden" class="form-control" value="${address}" id="hiddenspace" name="hiddenspace" required/>
                <input type="text" class="form-control" value="${address}" id="roadFullAddr" name="address"  placeholder="주소검색을 눌러주세요" readonly/>
                <input type="text"    value="${rname}" id="rName" name="rName" placeholder="식당이름" readonly required/>
                <button type="button" class="btn btn-primary py-3 px-4" id="address" onclick="goAddress();">주소검색</button>
              </div>

              <!-- 별점 (0.5까지 포함해서 5점 만점)-->
              <div class="form-group star-box" id="star">
                <span class="star star_left" data-rate=0.5></span>
                <span class="star star_right" data-rate=1.0></span>
              
                <span class="star star_left" data-rate=1.5></span>
                <span class="star star_right" data-rate=2.0></span>
              
                <span class="star star_left" data-rate=2.5></span>
                <span class="star star_right" data-rate=3.0></span>
              
               <span class="star star_left" data-rate=3.5></span>
               <span class="star star_right" data-rate=4.0></span>
              
               <span class="star star_left" data-rate=4.5></span>
               <span class="star star_right" data-rate=5.0></span>
               <!-- <div id="myStar"> -->
                  <input type="text" id="starValue" name="starValue" value="${star}" style="display:none;"  required></input>
            
               <!-- <div type="text" id="passwdMsg"></div> -->
               <!-- <input type="text" class="form-control" name="userName" id="userName" readonly="readonly"> -->
              </div>   
              

             
               
  
              <div class="form-group">
                <input type="hidden" class="form-control" placeholder="작성자 닉네임" name="member_Id" value="${member.memberId}" readonly required>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="pContent" cols="30" rows="7" placeholder="글 작성" required>${pContent }</textarea>
              </div>
              <div class="btnArea form-group">

                <input type="submit" value="수정하기" class="btn btn-primary py-3 px-5" onclick="javascript:  check(); form.action='${pageContext.request.contextPath}/post/updatePostEnd.do';">
                <input type="reset" value="취소" class="btn btn-info py-3 px-5">
              </div>
            </form>
          </div>        
        </div>
      </div>
    </section>


 <c:import url="/views/common/footer.jsp"/>
</body>
</html>