<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
</head>
<body>
	 <div class="container" style="padding:4%;">

	        <h2 class="mb-2"  style="text-align: center"><img src="/tastyMap/resources/images/logo.png" alt="" /></h2>
	       
          <!--로그인폼 -->
          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <h5 class="" id="findId">아이디찾기</h5>
          <form onsubmit="return findId()" action="${pageContext.request.contextPath}/member/findId.do"  method="post">
                  <div class="form-group">
                    <label for="findIdName">아이디</label>
                    <input type="text" class="form-control" id="findIdName" name="findIdName" placeholder="이름를 입력해주세요" value="">
                  </div>
                  <div class="form-group">
                    <label for="findIdBirth">주민번호 앞자리</label>
                    <input type="text" class="form-control" id="findIdBirth" name="findIdBirth" placeholder="주민번호앞자리를 입력해주세요" value="">
                  </div>
                  <br>

                    <div class="form-group text-center">      
                    </div>
                    <div class="form-group text-center">                     
                      <button type="submit" id="findId-submit" class="btn btn-primary" style="width: 100%; height: 50px;">
                          아이디 찾기
                        </button>                
                  </div>
                </form>
        </div>      
                
<script>
function findId() {

	  if(($('#findIdName').val()) == "") {

	    alert("이름을 입력해 주세요.");

	    return false;

	  }

	  else if(($('#findIdBirth').val()) == "") {

	    alert("주민번호 앞자리 값을 입력해 주세요.");

	    return false;
	  }

	  else return true;

	}
</script>

</body>
</html>