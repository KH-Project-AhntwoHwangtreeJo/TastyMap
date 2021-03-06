<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<title>TastyMap page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="${pageContext.request.contextPath}/resources/resource/css/styles.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

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
						<thead>
							<tr>
								<th>번호</th>
								<th>식당이름</th>
								<th>주소</th>
								<th>소개글</th>
								<th>카테고리</th>
								<th>금액대</th>
								<th>영업시간</th>
								<th>연락처</th>
								<th>주차</th>
								<th>수정일자</th>
								<th>활성화여부</th>
								<th>관리자 체크</th>
							</tr>
						</thead>
						<tbody>
					
							<c:forEach items="${list}" var="r" varStatus="status"> 
							<tr>
								<td>${r.rno}</td>
								<td>${r.rname}</td>
								<td>${r.address }</td>
								<td>${r.rcontent}</td>
								<td>${r.category}</td>
								<td>${r.price}</td>
								<td>${r.time}</td>
								<td>${r.tel}</td>
								<td>${r.paking}</td>
								<td>${r.updatedate}</td>
								<td><label class="switch"> <input type="checkbox"
										onclick="toggle(this)"
										${r.rstatus eq 'Y' ? "checked" : ""}>  <span
										class="slider round"></span>
								</label></td>
								<td>
									<script>
										$(function(){
											var index = ${status.index};
											var num = 0;
											var adminStatus = '${r.adminStatus}';
											
											 switch (adminStatus) {
											case 'R': num=1;
												break;
											case 'H':num=2;
												break;
											case 'C':num=3;
												break;
											case 'A':num=4;
												break;
											}			
											
											 $('.adminStatus').eq(index).val(num);
											
										});
										
											 
									</script>
										
									<input type="range" id="adminStatus" class="adminStatus" min="1" max="4" step="1"onchange = "adminToggle(this)" value="">
									<br /> R &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  H  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    C  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    A  
							</tr>
								</c:forEach>
							
							
						
						</tbody>
					</table>
					<a href="${pageContext.request.contextPath}/admin/goinsertRestaurant.do">
					<button type="button" id="insertRestaurant" class="btn-btn-info">admin 식당등록</button>
					</a>
						<script>
						
						// 식당 활성화 상태 변경 토글
						function toggle(obj) {
							var tr = $(obj).parent().parent().parent();
							var td = tr.children();

							var status=$(obj).prop('checked');
							var rno= td.eq(0).text();

							$.ajax({
								url : '${pageContext.request.contextPath}/admin/updateRestaurantStatus.do',
								data : { rno : rno, status : status},
								dataType : 'json',
								success : function(data) {
									alert(data.msg);
								}
							});
						};
						
						// 관리자 status 변경 토글
						function adminToggle(obj) {
							var tr = $(obj).parent().parent();
							var td = tr.children();

							var status=$(obj).val();
							var rno= td.eq(0).text();

							$.ajax({
								url : '${pageContext.request.contextPath}/admin/updateRestaurantAdminStatus.do',
								data : { rno : rno, status : status},
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