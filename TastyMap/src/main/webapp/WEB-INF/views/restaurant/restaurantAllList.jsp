<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
    
<head>
   <meta charset="UTF-8">
   <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<c:import url="/views/common/header.jsp"/> 


</head>
 
 
  <body> 
   <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
            <h1 class="mb-3 bread">식당 리스트</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section> 
<!--gggg-->



<!--//gggg-->
    <section class="ftco-section">
      <div class="container">
        <div class="row d-flex">
        
        
        
        
        
         <div class="col-xl-12 col-md-12">
                                <div class="explorer_tab">
                                    <nav>
                                        <div class="nav" id="nav-tab" role="tablist" style="width : 600px;">
                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                                                href="#nav-home" role="tab" aria-controls="nav-home"
                                                aria-selected="true">전체 리스트</a>
                                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
                                                href="#nav-contact1" role="tab" aria-controls="nav-profile"
                                                aria-selected="false">한식</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
                                                href="#nav-contact2" role="tab" aria-controls="nav-contact"
                                                aria-selected="false">중식</a>
                                            <a class="nav-item nav-link" id="nav-contact-tab2" data-toggle="tab"
                                                href="#nav-contact3" role="tab" aria-controls="nav-contact"
                                                aria-selected="false">일식</a>
                                        </div>
                                    </nav>
        
                                </div>
                            </div>
        
     
        
        
        <!-- 전체 리스트 -->
        <!-- RList는 전체 식당 -->
        <!-- kList -->
        <!-- jList -->
        <!-- cist -->
	
         <!-- 전체 -->
         <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
              	<a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
	              </a>
                <h3 class="heading">${A.rname}</h3>
                <div class="meta mb-3">
                  <div>${A.address}</div>
                  <div>${A.address}</div>
                  <div><span class="icon-chat"></span>${A.avg_star}</div>
                </div>
              </div>
            </div>
          </div>
         
         <div class="col-12">
              <div class="tab-pane fade" id="nav-home" role="tabpanel" aria-labelledby="nav-profile-tab" style="display:flex;">
           <c:forEach var="A" items="${ RList }">
       	<%-- 	<c:if test="${ A.category eq '한식' }"> --%>
       	
       	<div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end" id="nav-home" role="tabpanel" aria-labelledby="nav-profile-tab" style="display:flex;">
              <div class="text">
              	<a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
	              </a>
                <h3 class="heading">${A.rname}</h3>
                <div class="meta mb-3">
                  <div>${A.address}</div><br />
                  <div><span class="icon-chat"></span>${A.avg_star}</div>
                </div>
              </div>
            </div>
          </div>
       	
       	
       	
          <%-- <div class="col-md-3 d-flex ftco-animate">
             <div class="blog-entry justify-content-end">
              <div class="text">         
                   <a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img"   id="trd" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
                 </a>
                 <img src="${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" >
                <h3 class="heading"><a href="#">${A.rname}</a></h3>
                <h6 class="heading1" style="font-size:smaller;"><a href="#">${A.address}</a></h6>
                <div class="meta mb-3">               
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a></div>
                </div>            
              </div>
            </div>
          </div> --%>
          
          
          
          
          
     <%--      </c:if>  --%>
          </c:forEach>
          </div>
    
         
         
         
         <div class="tab-pane fade" id="nav-contact1" role="tabpanel" aria-labelledby="nav-profile-tab" style="display:flex;">
           <c:forEach var="A" items="${ kList }">
       	<%-- 	<c:if test="${ A.category eq '한식' }"> --%>
          <div class="col-md-3 d-flex ftco-animate">
             <div class="blog-entry justify-content-end">
              <div class="text">         
                   <a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img"   id="trd" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
                 </a>
             <%--     <img src="${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" > --%>
                <h3 class="heading"><a href="#">${A.rname}</a></h3>
                <h6 class="heading1" style="font-size:smaller;"><a href="#">${A.address}</a></h6>
                <div class="meta mb-3">               
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a></div>
                </div>            
              </div>
            </div>
          </div>
     <%--      </c:if>  --%>
          </c:forEach>
          </div>
    
    
         <!-- 중식 -->
         <div class="tab-pane fade" id="nav-contact2" role="tabpanel" aria-labelledby="nav-profile-tab" style="display:flex;">
           <c:forEach var="A" items="${ cList }">
    <%--    		<c:if test="${ A.category eq '중식' }"> --%>
          <div class="col-md-3 d-flex ftco-animate">
             <div class="blog-entry justify-content-end">
              <div class="text">         
                 <a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img"   id="trd" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
                 </a>
             <%--     <img src="${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" > --%>
                <h3 class="heading"><a href="#">${A.rname}</a></h3>
                <h6 class="heading1" style="font-size:smaller;"><a href="#">${A.address}</a></h6>
                <div class="meta mb-3">               
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a></div>
                </div>            
              </div>
            </div>
          </div>
      <%--     </c:if>  --%>
          </c:forEach>
          </div>
        
        
      
        
         <!-- 일식 -->
         <div class="tab-pane fade" id="nav-contact3" role="tabpanel" aria-labelledby="nav-profile-tab" style="display:flex;">
           <c:forEach var="A" items="${ jList }">
       	<%-- 	<c:if test="${ A.category eq '일식' }"> --%>
          <div class="col-md-3 d-flex ftco-animate">
             <div class="blog-entry justify-content-end">
              <div class="text">         
                 <a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img"   id="trd" style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
                 </a>
                 <%-- <img src="${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" > --%>
                <h3 class="heading"><a href="#">${A.rname}</a></h3>
                <h6 class="heading1" style="font-size:smaller;"><a href="#">${A.address}</a></h6>
                <div class="meta mb-3">               
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a></div>
                </div>            
              </div>
            </div>
          </div>
       <%--    </c:if>  --%>
          </c:forEach>
          </div>
          
          
         </div>
            
            
            
            
         
     
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
           <%--    <c:out value="${pageBar}" escapeXml='false'/> --%>
                <!-- <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li> -->
              </ul>
            </div>
          </div>
        </div>
      </div>
      
</section>      


  <c:import url="/views/common/footer.jsp"/>
  

  
  
  
  
   </body>
</html>