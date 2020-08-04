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

<script>
function goAddress(){
	
	var add = window.open("${pageContext.request.contextPath}/post/resAddress.do","add","width=570,height=420, scrollbars=yes, resizable=yes");
	//var vReturn = window.showModalDialog(url, "_blank", sFeatures);
	 //document.formname.textfield.value = vReturn;
	//document.formname.rName.value = add;
}

function jusoCallBack(roadFullAddr, title){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	console.log(roadFullAddr);
	console.log(title);
	//document.form.roadFullAddr.value = roadFullAddr;
	/** 2017년 3월 추가제공 **/
}
</script>

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
					<div class="panel-title"><h1>Restaurant Register</h1></div>
				</div>
				<div class="panel-body">
				
					<form action="${pageContext.request.contextPath }/admin/insertRestaurant.do">
						
						<table style="width: 30%;">
							<tr>
								<td>식당이름 : </td>
								<td><input type="text" id="rName" name="rName" value="${rname}" style="width:100%" readonly placeholder="검색버튼으로 등록해주세요"/></td>
								<td><button type="button" onclick="goAddress();">검색</button></td>
							</tr>
							<tr>
								<td>주소 : </td>
								<td><input type="text" id="roadFullAddr" name="address" value="${address}" style="width:100%" readonly placeholder="검색버튼으로 등록해주세요"/></td>
							</tr>
							<tr>
								<td>소개내용 : </td>
								<td><input type="text" name="rcontent" style="width:100%"/></td>
							</tr>
							<tr>
								<td>카테고리 : </td>
								<td><input type="text" name="category" style="width:100%"/></td>
							</tr>
							<tr>
								<td>가격 : </td>
								<td><input type="text" name="price" style="width:100%"/></td>
							</tr>
							<tr>
								<td>영업시간 : </td>
								<td><input type="text" name="time" style="width:100%"/></td>
							</tr>
							<tr>
								<td>연락처 : </td>
								<td><input type="text" name="tel" style="width:100%"/></td>
							</tr>
							<tr>
								<td>주차여부 : </td>
								<td><input type="text" name="paking" style="width:100%"/></td>
							</tr>
							<tr>
								<td>등록일자 : </td>
								<td><input type="date" name="updatedate" style="width:100%" /></td>
							</tr>
							<tr>
								<td>활성화상태 : </td>
								<td><input type="text" name="rstatus" style="width:100%"/></td>
							</tr>
						</table>
						
						<br /><br />
						<button type="submit" id="insertRestaurant" class="btn-btn-info">식당 등록 insert</button>
				
					</form>

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