<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>

<!doctype html>
<div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<ul class="nav">
						<!-- Main menu -->
						<li class="current"><a href="${pageContext.request.contextPath}/admin/adminMain.do"><i
								class="glyphicon glyphicon-home"></i>관리자 </a></li>
								
								
						<li><a href="${pageContext.request.contextPath}/admin/selectMember.do"><i
								class="glyphicon glyphicon-list"></i> 회원관리</a></li>
								
								
						<li><a href="${pageContext.request.contextPath}/admin/selectRestaurant.do"><i
								class="glyphicon glyphicon-list"></i> Restaurant 관리</a></li>
								
								
						<li><a href="${pageContext.request.contextPath}/admin/selectPost.do"><i
								class="glyphicon glyphicon-list"></i> Post 관리<br></a></li>
								
								
						<li><a href="${pageContext.request.contextPath}/admin/selectCommentReport.do"><i
								class="glyphicon glyphicon-list"></i> 댓글 신고 목록<br></a></li>
								
						<li><a href="${pageContext.request.contextPath}/admin/selectPostReport.do"><i
								class="glyphicon glyphicon-list"></i> 게시글 신고 목록<br></a></li>		
					</ul>
				</div>
			</div>