<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="ko">
 	
<head>
	<meta charset="UTF-8">
	<c:import url="views/common/header.jsp"/>
</head>
    
    <div class="hero-wrap" style="background-image: url('/tastyMap/resources/images/main/main.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="overlay-2"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center w-100">
				<h1 class="mb-4">Find Restaurant <br>Where You Want to Go!</h1>
				<!-- 검색바 시작 -->
				<div class="search_form" style="background: #fff; border-radius: 5px; border: solid #d4ca68;">
					<form action="${pageContext.request.contextPath}/restaurant/searchBar.do" id="searchForm" method="get">
						<div class="row align-items-center">
							<div class="col-10" style="display:flex; margin-top:4px;">
								<div class="input_field col-2">
									<select name="searchOption" style="border:none;">
										<option value="Restaurant"><c:out value="${map.searchOption == 'Restaurant'?'selected':''}"/>음식점</option>
										<option value="Post"><c:out value="${map.searchOption == 'Post'?'selected':''}"/>게시글</option>
									</select>
								</div>
								<div class="input_field col-10">
									<input type="text" id="keyword" name="keyword" 
										   placeholder="What's your favorite food?  어떤 음식을 좋아하시나요?"
										   style="width:100%; height:30px; padding: 15px; border: none;" required>
								</div>
							</div>
							<div class="col-2">
								<div class="button_search" style="display: grid;">
									<button class="btn btn-primary py-3 px-4" type="submit" id="search">Search</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 검색바 끝 -->	        
            </div>
          </div>
        </div>
      </div>
      
      <!-- scroll 시작 -->
      <div class="mouse">
		<a href="#here" class="mouse-icon">
			<div class="mouse-wheel">
				<span class="ion-ios-arrow-round-down"></span>
			</div>
		</a>
	  </div>
	  <!-- scroll 시작 -->  
    </div>
    
    <section class="ftco-section" style="padding:5em 0;"></section>


    
	<!-- Top 9 맛집 검색 시작 -->
    <section class="ftco-section-top8" name="here">
    	<div class="container">
    	  <div class="row justify-content-center">
	         <div class="col-md-12 heading-section text-center ftco-animate mb-5">
	          	<span class="subheading">Find Restaurant</span>
				<h2 class="mb-2">Find Restaurant Around Your City</h2>
				<p>음식점 Top 9</p>
	         </div>
          </div>
          <div class="row">
        
          </div>
        </div>
    </section>
    <!-- Top 9 맛집 검색 끝 -->
    
    <section class="ftco-section" style="padding:5em 0;"></section>

    

	<!-- Top 8 인플루언서 시작 -->
    <section class="ftco-section ftco-no-pt">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Influencer</span>
			<h2>Top10 Influencer's Post</h2>
			<p>인기10 인플루언서의 게시글</p>
          </div>
        </div>
        <div class="row d-flex">
         
        </div>
      </div>
    </section>		
    <!-- Top 8 인플루언서 끝 -->
    
    <section class="ftco-section" style="padding:1em 0;"></section>
    
    <c:import url="views/common/footer.jsp"/>
    
    <script>
    $(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/restaurant/top8.do',
			type : 'get',
			// data : { g}
			success : function(list) {
				
				var $tab_content = $('.ftco-section-top8>.container>.row')[0];
				
				for(var i in list) {
					var html = '<div class="col-md-4">' + 
			    	        		'<div class="listing-wrap img rounded d-flex align-items-end"' + 
			    	        		'style="background-image: url(${pageContext.request.contextPath}/resources/upload/post/' + list[i].prenamedName + ');">' + 
			            			'<div class="location">' + 
			            				'<span class="rounded">' + list[i].address + '</span>' + 
			            			'</div>' + 
			            			'<div class="text">' + 
			            				'<h3><a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=' + list[i].rno + '&memberId=${member.memberId}"> '+ list[i].rname + '</a></h3>' + 
			            				'<a href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=' + list[i].rno + '&memberId=${member.memberId}" class="btn-link">자세히 <span class="ion-ios-arrow-round-forward"></span></a>' + 
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
				
				var $influencer = $('.ftco-section.ftco-no-pt>.container>.row.d-flex')[0];
				
				for(var i in list) {
					
					var html1 = '<div class="col-md-3 d-flex ftco-animate">' +  
		    		          	'<div class="blog-entry justify-content-end">' + 
		    		              '<div class="text">' +  
		    		              	'<a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=${p.pno}" class="block-20 img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/post/' + list[i].prenamedName + ');">' + 
		    			              '</a>' + 
		    		                '<h3 class="heading"><a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=' + list[i].pno + '&memberId=${member.memberId}">' + list[i].pcontent + '</a></h3>' + 
		    		                '<div class="meta mb-3">' + 
		    		                  '<div><a href="${pageContext.request.contextPath}/post/postDetail.do?pNo=' + list[i].pno + '&memberId=${member.memberId}">' + formatDate(taskDate(list[i].pdate)) + '</a></div>' + 
		    		                  '<div><a href="${pageContext.request.contextPath}/post/postDetail.do?pno=' + list[i].pno + '&memberId=${member.memberId}">' + list[i].nickName + '</a></div>' + 
		    		                  '<div><a href="${pageContext.request.contextPath}/post/postDetail.do?pno=' + list[i].pno + '&memberId=${member.memberId}" class="meta-chat"><span class="icon-chat"></span> ' + list[i].pc_cnt + '</a></div>' + 
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
	
	function taskDate(dateMilli) {
	    var d = (new Date(dateMilli) + '').split(' ');
	    d[2] = d[2] + ',';

	    return [d[0], d[1], d[2], d[3]].join(' ');
	}
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;

	    return [year, month, day].join('/');
	}

    </script>
	</body>
</html>