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
<script
	src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<c:import url="/views/common/header.jsp" />


</head>


<body>


	<section class="ftco-section">
		<div class="explorer_europe">
			<div class="container">

				<div class="explorer_wrap">
					<div class="row align-items-center">
						<!-- 카테고리 창 -->
						<div class="col-xl-12 col-md-12">
							<div class="explorer_tab">
								<nav>
									<div class="nav" id="nav-tab" role="tablist"
										style="width: 600px;">
										<a class="nav-item nav-link active" id="nav-home-tab"
											data-toggle="tab" href="#nav-home" role="tab"
											aria-controls="nav-home" aria-selected="true">전체 리스트</a> <a
											class="nav-item nav-link" id="nav-contact1-tab"
											data-toggle="tab" href="#nav-contact1" role="tab"
											aria-controls="nav-contact1" aria-selected="false">한식</a> <a
											class="nav-item nav-link" id="nav-contact2-tab"
											data-toggle="tab" href="#nav-contact2" role="tab"
											aria-controls="nav-contact2" aria-selected="false">중식</a> <a
											class="nav-item nav-link" id="nav-contact3-tab"
											data-toggle="tab" href="#nav-contact3" role="tab"
											aria-controls="nav-contact3" aria-selected="false">일식</a> <a
											
											
											class="nav-item nav-link" id="nav-contact4-tab"
											data-toggle="tab" href="#nav-contact4" role="tab"
											aria-controls="nav-contact4" aria-selected="false">양식</a> <a
											class="nav-item nav-link" id="nav-contact5-tab"
											data-toggle="tab" href="#nav-contact5" role="tab"
											aria-controls="nav-contact5" aria-selected="false">기타</a>
									</div>
								</nav>

							</div>
						</div>
					</div>
				</div>


				<!-- 전체 리스트 -->
				<!-- RList는 전체 식당 -->
				<!-- kList는 한식 -->
				<!-- cList는 중식 -->
				<!-- jList는  일식-->
				<!-- yList는  양식-->
				<!-- etcList는  기타-->







				<!-- 전체 -->
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row">
							<c:forEach var="A" items="${ RList }">

								<div class="col-md-3 ftco-animate">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.PRenamedName}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.RName}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>

					<!-- 한식 -->
					<div class="tab-pane fade" id="nav-contact1" role="tabpanel"
						aria-labelledby="nav-contact1-tab">
						<div class="row">
							<c:forEach var="A" items="${ kList }">
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=${rno}&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.PRenamedName}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.RName}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<!-- 중식 -->
					<div class="tab-pane fade" id="nav-contact2" role="tabpanel"
						aria-labelledby="nav-contact2-tab">
						<div class="row">
							<c:forEach var="A" items="${ cList }">
								<div class="col-md-3 d-flex">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=${rno}&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.PRenamedName}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.RName}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>




					<!-- 일식 -->
					<div class="tab-pane fade" id="nav-contact3" role="tabpanel"
						aria-labelledby="nav-contact3-tab">
						<div class="row">
							<c:forEach var="A" items="${ jList }">
								<%-- 	<c:if test="${ A.category eq '일식' }"> --%>
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=${rno}&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.PRenamedName}');">
											</a>
											<%-- <img src="${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}" class="img-fluid" alt="Colorlib Template"style="width: 100%; height: 100%;" > --%>
											<h3 class="heading">
												<a href="#">${A.RName}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%--    </c:if>  --%>
							</c:forEach>
						</div>
					</div>


				<!-- 양식 -->
					<div class="tab-pane fade" id="nav-contact4" role="tabpanel"
						aria-labelledby="nav-contact4-tab">
						<div class="row">
							<c:forEach var="A" items="${ yList }">
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.rname}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
					
					<!-- 기타 -->
					<div class="tab-pane fade" id="nav-contact5" role="tabpanel"
						aria-labelledby="nav-contact5-tab">
						<div class="row">
							<c:forEach var="A" items="${ etcList }">
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.rname}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

				<!-- 양식 -->
					<div class="tab-pane fade" id="nav-contact4" role="tabpanel"
						aria-labelledby="nav-contact4-tab">
						<div class="row">
							<c:forEach var="A" items="${ yList }">
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.rname}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
					
					<!-- 기타 -->
					<div class="tab-pane fade" id="nav-contact5" role="tabpanel"
						aria-labelledby="nav-contact5-tab">
						<div class="row">
							<c:forEach var="A" items="${ etcList }">
								<div class="col-md-3 d-flex ">
									<div class="blog-entry justify-content-end">
										<div class="text">
											<a
												href="${pageContext.request.contextPath}/restaurant/restaurantDatail.do?rno=1&memberId=${member.memberId}"
												class="block-20 img" id="trd"
												style="background-image: url('${pageContext.request.contextPath}/resources/upload/post/${A.prenamedname}');">
											</a>
											<h3 class="heading">
												<a href="#">${A.rname}</a>
											</h3>
											<h6 class="heading1" style="font-size: smaller;">
												<a href="#">${A.address}</a>
											</h6>
											<div class="meta mb-3">
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>${A.avg_star}</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

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


	</section>
	<c:import url="/views/common/footer.jsp" />
</body>
</html>