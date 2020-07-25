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

	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate() {
		var content = $("[name=pContent]").val();
		if (content.trim().length == 0) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

	// 사진 게시판 미리보기 기능 지원 스크립트
	function loadImg(value) {
		//location.href="${pageContext.request.contextPath}/../..";
		//console.log(value.files);
		// 파일 객체의 내용을 텍스트 형식으로 읽는다.
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
	}
	

	/* $.ajax({
		url :"${pageContext.request.contextPath}/post/resAddress.do",
		dataType : "json",
		type : "POST",
		success : function(result){
			for(var i=0; i<result.length; i++){
				var
			}
		}*/

</script>
</head>
<body>
    
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('${pageContext.request.contextPath}/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h1 class="mb-3 bread">게시글 작성</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section contact-section">
      <div class="post-container">
       
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-6 align-items-stretch d-flex">
            <form method="post" action="${pageContext.request.contextPath}/post/insertPostEnd.do" class="bg-light p-5 contact-form" enctype="multipart/form-data">
              <!--사진 업로드-->
              <div class="wrap-input100 validate-input m-b-23"  data-validate = "Username is reauired">
                <span class="label-input100" ></span>		
                <label class="upLoad" for="upFile" ><img src="${pageContext.request.contextPath}/resources/images/add-photo.png"  style="width: 50px;"></label>
                <br><input  multiple="multiple" type="file" id="upFile" name="upFile" onchange="loadImg(this);" style="display:none;">
                <span class="focus-input100" ></span>
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
                  <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile0" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile1" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile2"class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item ">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile3" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile4" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile5" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item ">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile6" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile7" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile8" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/picture.png" id="upFile9" class="d-block w-100" alt="...">
                  </div>
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
                <input type="text" class="form-control" id="roadFullAddr"name="roadFullAddr" style="width : 87%; display: inline;" placeholder="주소검색을 눌러주세요">
                <button class="btn btn-primary py-3 px-4" id="address" onclick="goAddress();">검색</button>
              </div>

              <!-- 별점 (0.5까지 포함해서 5점 만점)-->
              <div class="star-box" name="star">
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              
               <span class="star star_left"></span>
               <span class="star star_right"></span>
              
               <span class="star star_left"></span>
               <span class="star star_right"></span>
              </div>  

             
              <div class="form-group">
                <input type="text" class="form-control" placeholder="작성자 닉네임" name="member_Id" value="${member.memberId}" readonly required>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="pContent" cols="30" rows="7" placeholder="글 작성" required></textarea>
              </div>
              <div class="btnArea">
                <input type="submit" value="올리기" class="btn btn-primary py-3 px-5">
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