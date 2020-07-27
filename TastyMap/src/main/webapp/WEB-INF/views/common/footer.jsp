<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<!-- footer start -->
    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
           <!-- <h2 class="ftco-heading-2">Findstate</h2> -->
           <a href="#">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="">
           </a>
           <br>
           <br>
              <p>본 프로젝트는 KH정보교육원 [NCS]웹 개발 응용 SW엔지니어 <br>양성과정 352반 2조 안에 <br>
				안이황삼조가 만든 Semi <br>프로젝트 입니다.</p>
              <ul class="ftco-footer-social list-unstyled mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md" style="padding-left: 30px;">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Community</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search Properties</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For Agents</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md" style="padding-right: 45px;">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">About Us</h2>
              <ul class="list-unstyled">
                <!-- <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our Story</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet the team</a></li>
				<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li> -->
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/gal.PNG" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;인간스케줄러, 조성아 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 팀장</small> 
						</div>
					</div>
				</li>
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/pow.png" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;요약전문가, 안예진 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 대리</small> 
						</div>
					</div>
				</li>
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/soon.PNG" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;아이디어뱅크, 황창현 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 사원</small> 
						</div>
					</div>
				</li>
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/cho.png" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;프로 서포터, 조은성 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 노예1</small> 
						</div>
					</div>
				</li>
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/kwan.png" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;디자인전문가, 조현민 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 노예2</small> 
						</div>
					</div>
				</li>
				<li>
					<div class="row" style="line-height: 30px;">
						<div class="col-2">
							<img src="/tastyMap/resources/images/bee.png" alt="">
						</div>
						<div class="col-10">
							&nbsp;&nbsp;&nbsp;행동대장, 황하용 <br>
							<small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;안이황삼조, 노예3</small> 
						</div>
					</div>
				</li> 
              </ul>
            </div>
          </div>
          <!-- <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Company</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About Us</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Press</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div> -->
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울특별시 강남구 역삼동 823-23 호산빌딩 3관 5층 2호</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">1544-9970</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope pr-4"></span><span class="text">example@sample.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
	
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="#" target="_blank" style="color: #fff;">안이황삼조</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
	</footer>
	<!--/ footer end  -->
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>

  
  
  
   
  <script>
	   $("#pop").popover({
	      html: true,
	      animation:true,
	      container : 'body',
	      placement : 'bottom',
	      content: function () {
	         return $('#popover-content').html();
	      }
	   });
	
	   // $('.select2').select2({
	   //    placeholder: 'Select',
	   //    width: '100%',
	   // });
	
	   function btnTitle(obj) {
	     //$('#keyword').val($(obj).text()).on('click', function() {
	     //    $('.boxed-btn2').click();
	     //    
	     //});
	      
	      $('#keyword').val($(obj).text());
	      $('#searchForm').submit();
	       //<%-- location.href="<%=request.getContextPath()%>/goalList.go; --%>
	     // $('#nav-profile-tab').click();
	   }   
   
    	$(function() {
    		$.ajax({
    			url : '${pageContext.request.contextPath}/restaurant/top8.do',
    			type : 'get',
    			// data : { g}
    			success : function(list) {
    				console.log(list);
    				
    				var $tab_content = $('.ftco-section-top8>.container>.row')[0];
    				
    				for(var i in list) {
    					var html = '<div class="col-md-4">' + 
				    	        		'<div class="listing-wrap img rounded d-flex align-items-end"' + 
				    	        		'style="background-image: url(/tastyMap/resources/images/res/res2.jpg);">' + 
				            			'<div class="location">' + 
				            				'<span class="rounded">' + list[i].address + '</span>' + 
				            			'</div>' + 
				            			'<div class="text">' + 
				            				'<h3><a href="#"> '+ list[i].rname +' </a></h3>' + 
				            				'<a href="#" class="btn-link">자세히 <span class="ion-ios-arrow-round-forward"></span></a>' + 
				            			'</div>' +
				            		'</div>' + 
				            	'</div>';
				    	$tab_content.append($(html)[0]);
				    	
    				}
    			}, error : function() {
    				alert("음식점 top 8 조회 실패");
    			}
    		});
    	});
    	
    	$(function() {
    		$.ajax({
    			url : '${pageContext.request.contextPath}/restaurant/influencer.do',
    			type : 'get',
    			// data : { g}
    			success : function(list) {
    				console.log(list);
    				
    				var $influencer = $('.ftco-section.ftco-no-pt>.container>.row.d-flex')[0];
    				
    				for(var i in list) {
    					var html1 = '<div class="col-md-3 d-flex ftco-animate">' +  
			    		          	'<div class="blog-entry justify-content-end">' + 
			    		              '<div class="text">' +  
			    		              	'<a href="blog-single.html" class="block-20 img" style="background-image: url(/tastyMap/resources/images/res/' + list[i].prenameName + ');">' + 
			    			              '</a>' + 
			    		                '<h3 class="heading"><a href="#">' + list[i].pcontent + '</a></h3>' + 
			    		                '<div class="meta mb-3">' + 
			    		                  '<div><a href="#">' + list[i].date + '</a></div>' + 
			    		                  '<div><a href="#">' + list[i].nickname + '</a></div>' + 
			    		                  '<div><a href="#" class="meta-chat"><span class="icon-chat"></span> ' + list[i].pc_cnt + '</a></div>' + 
			    		                '</div>' + 
			    		              '</div>' + 
			    		            '</div>' + 
			    		          '</div>';
				    	$($influencer).append($(html1)[0]);
				    	
    				}
    				
    				var counter = function() {
    					
    					$('#section-counter, .hero-wrap, .ftco-counter').waypoint( function( direction ) {

    						if( direction === 'down' && !$(this.element).hasClass('ftco-animated') ) {

    							var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
    							$('.number').each(function(){
    								var $this = $(this),
    									num = $this.data('number');
    									console.log(num);
    								$this.animateNumber(
    								  {
    								    number: num,
    								    numberStep: comma_separator_number_step
    								  }, 7000
    								);
    							});
    							
    						}

    					} , { offset: '95%' } );

    				}
    				counter();


    				var contentWayPoint = function() {
    					var i = 0;
    					$('.ftco-animate').waypoint( function( direction ) {

    						if( direction === 'down' && !$(this.element).hasClass('ftco-animated') ) {
    							
    							i++;

    							$(this.element).addClass('item-animate');
    							setTimeout(function(){

    								$('body .ftco-animate.item-animate').each(function(k){
    									var el = $(this);
    									setTimeout( function () {
    										var effect = el.data('animate-effect');
    										if ( effect === 'fadeIn') {
    											el.addClass('fadeIn ftco-animated');
    										} else if ( effect === 'fadeInLeft') {
    											el.addClass('fadeInLeft ftco-animated');
    										} else if ( effect === 'fadeInRight') {
    											el.addClass('fadeInRight ftco-animated');
    										} else {
    											el.addClass('fadeInUp ftco-animated');
    										}
    										el.removeClass('item-animate');
    									},  k * 50, 'easeInOutExpo' );
    								});
    								
    							}, 100);
    							
    						}

    					} , { offset: '95%' } );
    				};
    				contentWayPoint();

    			}, error : function() {
    				alert("Influencer 8 조회 실패");
    			}
    		});
    	});
    	
    	 //별점 부분

	$(".star").on('click', function() {
		var idx = $(this).index();
		$(".star").removeClass("on");
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
		}
	});
	
	/*  $(".upLoad").on('click', function() {
		if($(".upLoad").length() > 0) {
			for(var i = 0; i <= idx; i++) {
				$("label[for=upFile]").eq(i).val();
				
			}
		}
	});  */
	
	function btnTitle(obj) {
		
         $('#keyword').val($(obj).text());
         $('#searchForm').submit();

      }
    </script>


</html>