<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
 <div class="col-md-3-stretch d-flex">
            <br><br>
            <ul class="list-group" style="width: auto; text-align:center">
              <li class="list-group-item" >
              	<img class="rounded-circle"src="/tastyMap/resources/images/person_1.jpg" style="width:auto; height:100px"/><br />
              	<b>${member.nickname}</b><br />
              	<p style="font-size:10px;">${member.mcontent}</p>
              </li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${member.memberId}&followerId=${member.memberId}">마이 갤러리</a></li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/love/iHaveLoveList.do?member_Id=${member.memberId}">좋아요 리스트</a></li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/bookmark/iHaveBookmarkList.do?member_Id=${member.memberId}">북마크 리스트</a></li>
              <li class="list-group-item"><a href="#" data-toggle="modal" data-target="#checkPasswordModal"> 회원수정/회원탈퇴 </a></li>
              <!-- <li class="list-group-item"><a href="#">나의 활동로그</a></li> -->
            </ul>
          </div>
          
             <!-- 로그인 모달 끝-->
	
	<div class="modal fade" id="checkPasswordModal" tabindex="-1" role="dialog" aria-labelledby="checkPasswordLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="padding:5%">
	      <div class="modal-header">
	        <h5 class="modal-title" id="checkPasswordModalLabel">비밀번호 확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <br />
          <!--로그인폼 -->
          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <form id="updateMemberInfo" action="${pageContext.request.contextPath}/member/goMemberUpdate.do" method="post">
                   <input type="hidden" name="memberId" value="${member.memberId }"/>
                  <div class="form-group">
                    <label for="inputPassword">비밀번호 확인</label>
                    <input type="password" class="form-control" id="checkPassword" name="password" value="" placeholder="비밀번호를 입력해주세요">
                  </div>
                  <br>

                    <div class="form-group text-center">
                        <button type="button" id="checkPasswordSubmit" class="btn btn-primary" style="width: 100%; height: 50px;"  >
                            	확인<i class="fa fa-check spaceLeft"></i>
                        </button>
                    </div>
                    <div class="form-group text-center">
                  </div>
                </form>
	    </div>
	  </div>
	</div>
	<!-- 로그인 모달 끝-->
	
	<script>
		$('#checkPasswordSubmit').on('click', function(){

			$.ajax({
				url : '${pageContext.request.contextPath}/member/checkPassword.do',
				data : {
					memberId : '${member.memberId}',
					password : $('#checkPassword').val()
				}, dataType : 'json',
				async : false,
				success : function(data){
					console.log(data);
					check = data.isUsable;
				}
			});
			
			if(check != false){
				$('#updateMemberInfo').submit();
			} else {
				alert("비밀번호를 다시 확인 하세요!");
			}
		});
	</script>
	