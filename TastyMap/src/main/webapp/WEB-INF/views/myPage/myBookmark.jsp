<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
  
  <head>
	<meta charset="UTF-8">
    <c:import url="/views/common/header.jsp"/>
  </head>
  <body>
    
	  
    <!-- 마이페이지 내용 시작-->
    <section class="ftco-section contact-section" >
      <div class="container">
        
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">
         
          <!-- 마이페이지 좌측 메뉴바 -->
         <c:import url="/views/myPage/myMenu.jsp"/>
         
          <!-- 마이페이지 우측 내용(북마크한 가게 리스트)-->
          <div class="col-md-8 align-items-stretch d-flex">
            <div class="row">
        
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-1.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      
                    </div>
                    <div class="text">
                      <h3 class="mb-0"><a href="properties-single.html">식당이름</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>위치 강남구 도곡동</span>
                      <ul class="property_list">
                        <li><span class="flaticon-heart"></span>4.5</li>
                        <li><span class="flaticon-bed"></span>리뷰 수 </li><br>
                        
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-2.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      <div class="list-agent d-flex align-items-center">
                        <a href="#" class="agent-info d-flex align-items-center">
                          <div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
                          <h3 class="mb-0 ml-2">Ben Ford</h3>
                        </a>
                        <div class="tooltip-wrap d-flex">
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Bookmark">
                            <span class="ion-ios-heart"><i class="sr-only">Bookmark</i></span>
                          </a>
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Compare">
                            <span class="ion-ios-eye"><i class="sr-only">Compare</i></span>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="text">
                      <p class="price mb-3"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
                      <h3 class="mb-0"><a href="properties-single.html">Blue View Home</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>2854 Meadow View Drive, Hartford, USA</span>
                      <ul class="property_list">
                        <li><span class="flaticon-bed"></span>3</li>
                        <li><span class="flaticon-bathtub"></span>2</li>
                        <li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-3.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      <div class="list-agent d-flex align-items-center">
                        <a href="#" class="agent-info d-flex align-items-center">
                          <div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
                          <h3 class="mb-0 ml-2">Ben Ford</h3>
                        </a>
                        <div class="tooltip-wrap d-flex">
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Bookmark">
                            <span class="ion-ios-heart"><i class="sr-only">Bookmark</i></span>
                          </a>
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Compare">
                            <span class="ion-ios-eye"><i class="sr-only">Compare</i></span>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="text">
                      <p class="price mb-3"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
                      <h3 class="mb-0"><a href="properties-single.html">Blue View Home</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>2854 Meadow View Drive, Hartford, USA</span>
                      <ul class="property_list">
                        <li><span class="flaticon-bed"></span>3</li>
                        <li><span class="flaticon-bathtub"></span>2</li>
                        <li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
                      </ul>
                    </div>
                  </div>
                </div>
      
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-4.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      <div class="list-agent d-flex align-items-center">
                        <a href="#" class="agent-info d-flex align-items-center">
                          <div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
                          <h3 class="mb-0 ml-2">Ben Ford</h3>
                        </a>
                        <div class="tooltip-wrap d-flex">
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Bookmark">
                            <span class="ion-ios-heart"><i class="sr-only">Bookmark</i></span>
                          </a>
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Compare">
                            <span class="ion-ios-eye"><i class="sr-only">Compare</i></span>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="text">
                      <p class="price mb-3"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
                      <h3 class="mb-0"><a href="properties-single.html">Blue View Home</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>2854 Meadow View Drive, Hartford, USA</span>
                      <ul class="property_list">
                        <li><span class="flaticon-bed"></span>3</li>
                        <li><span class="flaticon-bathtub"></span>2</li>
                        <li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-5.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      <div class="list-agent d-flex align-items-center">
                        <a href="#" class="agent-info d-flex align-items-center">
                          <div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
                          <h3 class="mb-0 ml-2">Ben Ford</h3>
                        </a>
                        <div class="tooltip-wrap d-flex">
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Bookmark">
                            <span class="ion-ios-heart"><i class="sr-only">Bookmark</i></span>
                          </a>
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Compare">
                            <span class="ion-ios-eye"><i class="sr-only">Compare</i></span>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="text">
                      <p class="price mb-3"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
                      <h3 class="mb-0"><a href="properties-single.html">Blue View Home</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>2854 Meadow View Drive, Hartford, USA</span>
                      <ul class="property_list">
                        <li><span class="flaticon-bed"></span>3</li>
                        <li><span class="flaticon-bathtub"></span>2</li>
                        <li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(/tastyMap/resources/images/work-6.jpg);">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      <div class="list-agent d-flex align-items-center">
                        <a href="#" class="agent-info d-flex align-items-center">
                          <div class="img-2 rounded-circle" style="background-image: url(images/person_1.jpg);"></div>
                          <h3 class="mb-0 ml-2">Ben Ford</h3>
                        </a>
                        <div class="tooltip-wrap d-flex">
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Bookmark">
                            <span class="ion-ios-heart"><i class="sr-only">Bookmark</i></span>
                          </a>
                          <a href="#" class="icon-2 d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="top" title="Compare">
                            <span class="ion-ios-eye"><i class="sr-only">Compare</i></span>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="text">
                      <p class="price mb-3"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
                      <h3 class="mb-0"><a href="properties-single.html">Blue View Home</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>2854 Meadow View Drive, Hartford, USA</span>
                      <ul class="property_list">
                        <li><span class="flaticon-bed"></span>3</li>
                        <li><span class="flaticon-bathtub"></span>2</li>
                        <li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
                      </ul>
                    </div>
                  </div>
                </div>
      
         
          </div>
          </div>
        </div>
        <!-- 페이징처리 -->
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
		
   
    <!-- footer 위치 -->
    
    <c:import url="/views/common/footer.jsp"/>
    
    
  </body>
</html>