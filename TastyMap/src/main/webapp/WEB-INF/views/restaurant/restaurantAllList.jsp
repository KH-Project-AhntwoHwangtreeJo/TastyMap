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
            <h1 class="mb-3 bread">Blog</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section> 
<!--gggg-->
<div class="explorer_europe">
  <div class="container">
      <div class="explorer_wrap">
          <div class="row align-items-center">
              <div class="col-xl-12 col-md-4">
                  <div class="explorer_tab">
                      <nav>
                          <div class="nav" id="nav-tab" role="tablist" style="float: right;">  
                              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                                  href="생활습관" role="tab" aria-controls="nav-home"
                                  aria-selected="true">공백1</a>
                                  
                                  
                              <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
                                  href="식단" role="tab" aria-controls="nav-profile"
                                  aria-selected="false">공백2</a>
                                  
                                  
                              <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
                                  href="유산소" role="tab" aria-controls="nav-contact"
                                  aria-selected="false">공백3</a>
                                  
                                  
                              <a class="nav-item nav-link" id="nav-contact-tab2" data-toggle="tab"
                                  href="웨이트" role="tab" aria-controls="nav-contact"
                                  aria-selected="false">공백4</a>
                                  
                                  
                              <a class="nav-item nav-link" id="nav-contact-tab3" data-toggle="tab"
                                  href="스트레칭" role="tab" aria-controls="nav-contact"
                                  aria-selected="false">공백5</a>
                          </div>
                      </nav>

                  </div>
              </div>
          </div>
      </div>
      <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
              <div class="row">
                  
              </div>
          </div>
        </div>
      </div>
  </div>
<script>
$(function() { // 즉석 실행 함수
  $.ajax({
  url : '/Goal_In/selectList.go',
  type : 'get',
  data : { gcategory : '생활습관' },
  success : function(list) {
    console.log(list);
    
    var $tab_content = $('.tab-content>.tab-pane.fade.show.active>.row')[0];
    
    for(var i in list) {
      var html = '<div class="col-xl-3 col-lg-3 col-md-4">' + 
                       '<div class="single_explorer">' + 
                       '<div class="thumb">' + 
                           '<img src="/Goal_In/resources/enrollFiles/' + list[i].gimg + '" alt="">' + 
                       '</div>' + 
                       '<div class="explorer_bottom d-flex">' + 
                           '<div class="explorer_info">' + 
                               '<h3><img src="/Goal_In/resources/img/newGoal/tick1.png" alt="">' + 
                                   '<a href="/Goal_In//gsol.go?gno=' + list[i].gno + '">' + list[i].goalname + '</a>' + 
                               '</h3>' + 
                               '<img src="/Goal_In/resources/img/newGoal/money.png" alt=""> ' + list[i].gspoint + 
                               '<ul>' + 
                                   '<li> <img src="/Goal_In/resources/img/newGoal/calendar1.png" alt="">' + 
                                       list[i].startdate + '~'+ list[i].enddate + '</li>' + 
                                   '<li><img src="/Goal_In/resources/img/newGoal/avatar.png" alt="">'+ list[i].gcurrnum + '</li>' + 
                               '</ul>' + 
                          '</div>' + 
                       '</div>' + 
                   '</div>' + 
               '</div>';
               console.log($('.tab-content>.tab-pane fade show active>.row')[0]);
          $tab_content.append($(html)[0]);
    }
  }
});

  $('.nav-item.nav-link').on('click', function(){
    $.ajax({
    url : '/Goal_In/selectList.go',
    type : 'get',
    data : { gcategory : $(this).attr('href') },
    success : function(list) {
      console.log(list);
      
      var $tab_content = $('.tab-content>.tab-pane.fade.show.active>.row')[0];
      $($tab_content).empty();
      
      for(var i in list) {
        var html = '<div class="col-xl-3 col-lg-3 col-md-4">' + 
                         '<div class="single_explorer">' + 
                         '<div class="thumb">' + 
                             '<img src="/Goal_In/resources/enrollFiles/' + list[i].gimg + '" alt="">' + 
                         '</div>' + 
                         '<div class="explorer_bottom d-flex">' + 
                             '<div class="explorer_info">' + 
                                 '<h3><img src="/Goal_In/resources/img/newGoal/tick1.png" alt="">' + 
                                     '<a href="/Goal_In//gsol.go?gno=' + list[i].gno + '">' + list[i].goalname + '</a>' + 
                                 '</h3>' + 
                                 '<img src="/Goal_In/resources/img/newGoal/money.png" alt=""> ' + list[i].gspoint + 
                                 '<ul>' + 
                                     '<li> <img src="/Goal_In/resources/img/newGoal/calendar1.png" alt="">' + 
                                         list[i].startdate + '~'+ list[i].enddate + '</li>' + 
                                     '<li><img src="/Goal_In/resources/img/newGoal/avatar.png" alt="">'+ list[i].gcurrnum + '</li>' + 
                                 '</ul>' + 
                            '</div>' + 
                         '</div>' + 
                     '</div>' + 
                 '</div>';
                 console.log($('.tab-content>.tab-pane fade show active>.row')[0]);
            $tab_content.append($(html)[0]);
      }
    }
  });
  });           
});



$(function(){
	$("trd").on("click",function(){
		var rno = $(this).attr("trd");
	
		location.href = "${pageContext.request.contextPath}/restaurant/restaurantdatail.do?rno=${rno}";
	});
});


</script>
<!--//gggg-->
    <section class="ftco-section">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
          
              	<a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}" class="block-20 img"   id="trd" style="background-image: url('images/image_1.jpg');">
	              </a>
                <h3 class="heading"><a href="#">이름</a></h3>
                <div class="meta mb-3">
                  <div><a href="#">공백</a></div>
                  <div><a href="#">공백</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
              
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



















  <c:import url="/views/common/footer.jsp"/>
	</body>
</html>
