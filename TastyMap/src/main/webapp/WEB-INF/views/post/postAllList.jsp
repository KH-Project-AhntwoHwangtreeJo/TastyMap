<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 전체리스트</title>
</head>
<body>
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h1 class="mb-3 bread">게시글</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Properties <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

	<!--게시글 리스트 부분-->
    <section class="ftco-section goto-here">
    	<div class="container">
        <div class="row">
			<!-- 게시글 하나 시작-->
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/오미라식당.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조은성</h3>
        					</a>
        				</div>
					</div>
					<!-- 식당이름/주소-->
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">오미라 식당</a></h3>
						<p style="margin-bottom: 0px;">한식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울 강남구 테헤란로 124 삼원타워</span>
					</div>
					<!--//식당이름/주소 끝-->
        		</div>
			</div>
			<!--// 게시글 하나 끝-->
			
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/텐동.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info  d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조성아</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">나이스샤워</a></h3>
						<p style="margin-bottom: 0px;">일식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/피자.jpg);">
        		
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">황하용</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">매드포갈릭</a></h3>
						<p style="margin-bottom: 0px;">양식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>

			<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/오미라식당.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조은성</h3>
        					</a>
        				</div>
					</div>
					
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">오미라 식당</a></h3>
						<p style="margin-bottom: 0px;">한식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울 강남구 테헤란로 124 삼원타워</span>
					</div>
					
        		</div>
			</div>
			
			
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/텐동.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info  d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조성아</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">나이스샤워</a></h3>
						<p style="margin-bottom: 0px;">일식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/피자.jpg);">
        		
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">황하용</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">매드포갈릭</a></h3>
						<p style="margin-bottom: 0px;">양식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->  
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>
			<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/오미라식당.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조은성</h3>
        					</a>
        				</div>
					</div>
					
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">오미라 식당</a></h3>
						<p style="margin-bottom: 0px;">한식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울 강남구 테헤란로 124 삼원타워</span>
					</div>
					
        		</div>
			</div>
			
			
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/텐동.jpg);">
        			
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info  d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">조성아</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">나이스샤워</a></h3>
						<p style="margin-bottom: 0px;">일식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="property-wrap ftco-animate">
        			<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/피자.jpg);">
        		
        				<div class="list-agent d-flex align-items-center">
        					<a href="#" class="agent-info d-flex align-items-center">
        						<div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
        						<h3 class="mb-0 ml-2">황하용</h3>
        					</a>
        				</div>
        			</div>
        			<div class="text">
        				
						<h3 class="mb-0"><a href="properties-single.html">매드포갈릭</a></h3>
						<p style="margin-bottom: 0px;">양식</p>
						<div class="star-box">★★★★★</div><!--별점 받아오는 부분-->
        				<span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>서울특별시 강남구 역삼동 테헤란로48길</span>
        			</div>
        		</div>
        	</div>
			
        
     
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	</div>
	</section>
	<!-- //게시글 리스트 부분 끝-->
</body>
</html>