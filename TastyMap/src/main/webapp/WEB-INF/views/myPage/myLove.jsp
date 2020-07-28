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
    <br />
    <!-- 마이페이지 내용 시작-->
    <section class="ftco-section contact-section" >
      <div class="container">
        
        <div class="row block-10 justify-content-center mb-6-stretch d-flex">
         
          <!-- 마이페이지 좌측 메뉴바 -->
          <c:import url="/views/myPage/myMenu.jsp"/>
          
          <!-- 마이페이지 우측 내용(좋아요한 게시물 리스트)-->
          <div class="col-md-7 align-items-stretch d-flex">
          <div class="row d-flex">    
          <c:forEach var="list" items="${ list }">    
	          <div class="col-md-5 d-flex ftco-animate">
	          	<div class="blog-entry justify-content-end">
	              <div class="text">
	              	<a href="blog-single.html" class="block-20 img" style="background-image: url('/tastyMap/resources/upload/post/${list.PRenamedName }');">
		              </a>
	                <h3 class="heading"><a href="#">${list.PContent }</a></h3>
	                <div class="meta mb-3">
	                  <div><a href="#">${list.PDate }</a></div>
	                  <div><a href="#">${list.nickName }</a></div>
	                  <!-- <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div> -->
	                </div>
	              </div>
	            </div>
	          </div>
          </c:forEach>    
              
              
              
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