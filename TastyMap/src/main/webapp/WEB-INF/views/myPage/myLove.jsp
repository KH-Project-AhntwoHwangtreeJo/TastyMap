<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
  <head>
<c:import url="/views/common/header.jsp"/>

  </head>

  <body>
    
    <!-- 마이페이지 내용 시작-->
    <section class="ftco-section contact-section" >
      <div class="container">
        
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">
         
          <!-- 마이페이지 좌측 메뉴바 -->
          <c:import url="/views/myPage/myMenu.jsp"/>
          
          <!-- 마이페이지 우측 내용(좋아요한 게시물 리스트)-->
          <div class="col-md-7 align-items-stretch d-flex">
            <div class="row">
            
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img" >
                    <img src="/tastyMap/resources/images/team-1.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-2.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-3.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-4.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
    
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-5.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-6.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-7.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
                </div>
              </div>
              
              <div class="col-md-3 ftco-animate">
                <div class="agent">
                  <div class="img">
                    <img src="/tastyMap/resources/images/team-8.jpg" class="img-fluid" alt="Colorlib Template">
                  </div>
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
        <!-- 페이징처리 끝 -->
        

    </section>
		
 <!-- footer 위치 -->
    
    <c:import url="/views/common/footer.jsp"/>
    
    
  </body>
</html>