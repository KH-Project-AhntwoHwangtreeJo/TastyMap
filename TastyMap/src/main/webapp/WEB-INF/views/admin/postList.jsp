<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<title>Admin post </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="${pageContext.request.contextPath}/resources/resource/css/styles.css" rel="stylesheet">

<style>
@charset "UTF-8";

.switch {
	position: relative;
	display: inine-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196f3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196f3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.small {
	width: 50px;
	height: 50px;
}
/* 평소큰이미지.pic 에대한스타일*/
.gallery .zoom {
	transition: all 0.3s ease-in-out; /* 웹킷브라우저에서트랜지션효과가나타나도록*/
	-webkit-transition: all 0.3s ease-in-out; /* 웹킷브라우저에서트랜지션효과가나타나도록*/
	width: 50px; /* 너비*/
	height: 50px; /* 높이*/
	opacity: 0; /* 페이드아웃효과*/
	visibility: hidden; /* 처음에는보이지않게*/
	position: absolute; /* 고정위치*/
	margin-top: 10px; /* 상단여백*/
	margin-left: -20px; /* 왼쪽으로20픽셀이동해서*/
	border: 1px solid black; /* 검은색테두리그림*/
	-webkit-box-shadow: #272229 2px 2px 10px; /* 박스그림자*/
	-moz-box-shadow: #272229 2px 2px 10px; /* 박스그림자*/
	box-shadow: #272229 2px 2px 10px; /* 박스그림자*/
}

/*마우스 오버 효과주기*/
.gallery img.small:hover {
	cursor: pointer;
}

/* 썸네일이미지위로마우스오버했을때큰이미지의스타일* */
.gallery:hover .zoom {
	width: 300px; /* 너비*/
	height: 300px; /* 높이*/
	margin-right: 200px; /* 커지는 이미지가 다음줄로 이어지게 설정*/
	opacity: 1; /* 불투명하게*/	
	position:relative; /* 서로 가리지 않게 설정*/
	visibility: visible; /* 화면에보임*/
	float: left; /* 오른쪽으로플로팅*/
}
</style>
<c:import url="/views/admin/adminHeader.jsp"/>
<!--header-->


<div class="page-content">
	<div class="row">
		<c:import url="/views/admin/adminMenu.jsp"/>


		<div class="col-md-10">
			<div class="content-box-large">
				<div class="panel-heading">
					<div class="panel-title"></div>
				</div>
				<div class="panel-body">
					<table cellpadding="0" cellspacing="0" border="0"
						class="table table-striped table-bordered" id="example">
						<thead >
							<tr style="text-align:center">
								<th>게시글 번호</th>
								<th>사용자ID</th>
								<th>식당이름</th>
								<th>게시글 내용</th>
								<th>사진</th>
								<th>별점</th>
								<th>등록일자</th>
								<th>조회수</th>
								<th>게시상태</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="p"> 

							<tr>
								<td>${p.PNo}</td>
								<td>${p.member_Id}</td>
								<td>${p.rname}</td>
								<td>${p.PContent}</td>
								<%-- <td class="gallery"><img class="img-fluid small"
									src="${pageContext.request.contextPath}/resources/authUploadFiles/<%=a.getSigncf()%>"
									alt=""> <img class="img-fluid zoom"
									src="${pageContext.request.contextPath}/resources/authUploadFiles/<%=a.getSigncf()%>"
									alt=""></td> --%>
								<td class="gallery">
									<c:forEach var="pictureList" items="${ pictureList}">
										<c:if test="${ p.PNo eq pictureList.PNo }">
											<img class="img-fluid small" src="${pageContext.request.contextPath}/resources/upload/post/${pictureList.PRenamedName}"
												style="width:100px; height:100px"/>
											<img class="img-fluid zoom" src="${pageContext.request.contextPath}/resources/upload/post/${pictureList.PRenamedName}"
												/>
										</c:if>
									</c:forEach>
								</td>
								<td>${p.star}</td>
								<td>${p.date}</td>
								<td>${p.PCnt}</td>
								<td>
									<label class="switch"> <input type="checkbox"
										onclick="toggle(this)"
										${p.PStatus eq 'Y' ? "checked" : ""}>  <span
										class="slider round"></span>
									</label>
								</td>
							</tr>
							</c:forEach>
						</tbody>



					</table>
					
					<script>
						function toggle(obj) {
							var tr = $(obj).parent().parent().parent();
							var td = tr.children();

							var status=$(obj).prop('checked');
							var pno= td.eq(0).text();
			
							$.ajax({
								url : '${pageContext.request.contextPath}/admin/updatePostStatus.do',
								data : { pNo : pno, status : status},
								dataType : 'json',
								success : function(data) {
									alert(data.msg);
								}
							});
						};
						
						
						
					</script>


				</div>
			</div>
		</div>
	</div>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<footer>
	<div class="container">

		<div class="copy text-center">
			Copyright 2014 <a href='#'>Website</a>
		</div>

	</div>
</footer>

<link
	href="${pageContext.request.contextPath}/resources/resource/vendors/datatables/dataTables.bootstrap.css"
	rel="stylesheet" media="screen">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/resources/resource/bootstrap/js/bootstrap.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/resource/vendors/datatables/js/jquery.dataTables.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/resource/vendors/datatables/dataTables.bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/resources/resource/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/resource/js/tables.js"></script>
</body>
</html>