<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
 <div class="col-md-3-stretch d-flex">
            <br><br>
            <ul class="list-group" style="width: auto; text-align:center">
              <li class="list-group-item" >
              	<img class="rounded-circle"src="/tastyMap/resources/images/person_1.jpg" style="width:auto; height:100px"/><br />
              	<b>닉네임</b><br />
              	사용자소개
              </li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/member/myGallery.do?memberId=${member.memberId}">마이 갤러리</a></li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/love/iHaveLoveList.do?member_Id=${member.memberId}">좋아요 리스트</a></li>
              <li class="list-group-item"><a href="${pageContext.request.contextPath}/bookmark/iHaveBookmarkList.do?member_Id=${member.memberId}">북마크 리스트</a></li>
              <li class="list-group-item"><a href="#">회원수정/회원탈퇴</a></li>
              <li class="list-group-item"><a href="#">나의 활동로그</a></li>
            </ul>
          </div>