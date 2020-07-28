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
    <br />
    <section class="ftco-section contact-section" >
      <div class="container">
        
        <div class="row block-12 justify-content-center mb-6-stretch d-flex">
         
          <!-- 마이페이지 좌측 메뉴바 -->
         <c:import url="/views/myPage/myMenu.jsp"/>
         
          <!-- 마이페이지 우측 내용(북마크한 가게 리스트)-->
          <div class="col-md-9 align-items-stretch d-flex">
            <div class="row col-12 d-flex">
        		<c:forEach var="list" items="${ list }">
                <div class="col-md-4">
                  <div class="property-wrap ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url('/tastyMap/resources/upload/post/${list.prenamedname }');">
                      <a href="properties-single.html" class="icon d-flex align-items-center justify-content-center btn-custom">
                        <span class="ion-ios-link"></span>
                      </a>
                      
                    </div>
                    <div class="text">
                      <h3 class="mb-0"><a href="properties-single.html">${list.rname }</a></h3>
                      <span class="location d-inline-block mb-3"><i class="ion-ios-pin mr-2"></i>${list.address }</span>
                      <ul class="property_list">
                        <!-- <li><span class="flaticon-heart"></span>4.5</li>
                        <li><span class="flaticon-bed"></span>리뷰 수</li><br> -->
                        
                      </ul>
                    </div>
                  </div>
                </div>
                </c:forEach> 
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