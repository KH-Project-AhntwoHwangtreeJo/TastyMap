<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<c:import url="/views/common/header.jsp"/>
<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		/*중복아이디체크관련*/
		div#userId-container{position:relative; padding:0px;}
		div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		div#userId-container span.ok{color:green;}
		div#userId-container span.error, span.invalid{color:red;}
	</style>

</head>
<body>

	<section class="ftco-section">

    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	
            <h2 class="mb-2">Tasty Map</h2>
          </div>
        </div>


        


                <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3  " style="margin-left : 17%;">
                <h3>회원가입</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3" style="margin: auto; max-width: 60%;" >
                <form role="form" name="form" id="form" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/member/updateMember.do">
                  <label for="inputId">프로필 사진</label>
                  <div class="wrap-input100 validate-input m-b-23"  data-validate = "Username is reauired">
                    <label for="thumbnailImg" ><img src="/tastyMap/resources/images/intro.png"  id="contentImg" onclick="imgUpload();" class="rounded-circle" style="width: 150px;"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="file" id="test" name="mphoto" onchange="loadImg(this);" multiple style="display:none"/>
                    <div class="form-group">
                    <label style="width: 74%;">
                      <input type="text" class="form-control" id="inputPhoto" name="inputPhoto" style="width: 100%; display:none;" placeholder="프로필 사진을 등록해주세요">
                    </label>
                    </div>
                    
                  </div>
                  <div class="form-group">
                  <div id="userId-container">
                    <label for="inputId">아이디</label>
                    <input type="text" class="form-control" id="inputId" name="inputId" placeholder="아이디를 입력해주세요">
                    <!-- 아이디중복검사 코멘트추가 -->
					<span class="guide ok">사용 가능</span>
				    <span class="guide error">사용 불가</span>
				    <span class="guide invalid">4글자 미만</span>
				    <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				   </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword0" name="inputPassword" placeholder="비밀번호를 입력해주세요">
                  </div>
                  <div class="form-group">
                    <label for="inputPasswordCheck">비밀번호 확인</label>
                    <input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                  </div>
                  <div class="form-group" >
                      <label for="inputName">성명</label>
                      <input type="text" class="form-control" id="inputName" name="inputName" placeholder="이름을 입력해 주세요">
                  </div>
                  <div class="form-group" >
                    <label for="inputNicName">닉네임</label>
                    <input type="text" class="form-control" id="inputNicName" name="inputNicName" placeholder="사용할 닉네임을 입력해 주세요">
                </div>
                <div class="form-group" >
                  <label for="inputIntro">소개</label>
                  <input type="text" class="form-control" id="inputIntro" name="inputIntro" placeholder="나를 소개하는 글을 적어주세요">
              </div>
                <div class="form-group" >
                  <label for="inputBirth">생년월일</label>
                  <input type="text" id="yy" name="yy" placeholder="년(4자)" aria-label="년(4자)" class="form-control" maxlength="4">
                  <select id="mm" name="mm" class="form-control" aria-label="월">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
                  </select>
                  <input type="text" id="dd" name="dd" placeholder="일" aria-label="일" class="form-control" maxlength="2">
                  
              </div>
              <div class="form-group" >
                <label for="inputGender">성별</label>
                <select id="inputGender" name="inputGender" class="form-control" aria-label="월 ">
                             <option value="M">
                                                          남자
                                                      </option>
                             <option value="F">
                                                          여자
                                                      </option>
                </select>
            </div>
                  <div class="form-group">
                      <label for="inputMobile">휴대폰 번호</label>
                      <input type="tel" class="form-control" id="inputMobile" name="inputMobile" placeholder="휴대폰번호를 ('-'하이폰 빼고) 입력해 주세요">
                  </div>
                  <div class="form-group">
                      <!-- <label for="InputEmail">이메일 주소</label> -->
                      <th>이메일 주소</th><br>
                      <tr>
                        <td>
                      <input type="email" class="form-control" id="InputEmail" name="InputEmail" style="width : 87%; display: inline;" placeholder="이메일 주소를 입력해주세요">
                      <input type="button" class="btn btn-primary" value="인증하기" style="height: 52px; margin-top: -3px; margin-left: 2px;"onclick="goPopup();">
                        </td>
                    </tr>
                  </div>
                  <tbody>
                    <tr>
                      <th>도로명주소</th><br>
                    </tr>
                    <tr>
                      <td>
                      <div id="callBackDiv">
                        <input type="text" class="form-control" id="roadFullAddr" name="roadFullAddr" style="width : 87%; display: inline;" placeholder="주소검색을 눌러주세요">
                        <input type="button" class="btn btn-primary" style="height: 52px; margin-top: -3px; margin-left: 2px;" value="주소검색" onclick="goPopup();">
                        </div>
                      </td>
                    </tr>
                  </tbody>
                    <br>

                    <div class="form-group">
                    <label>약관 동의</label><br>
                    
                    
                    
                    <input id="agree" type="checkbox" style="width: 23px; height: 23px; ">
                  
                    <a href="#">이용약관</a>에 동의합니다.
                    
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="reset" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
       <!--          <form name="form" id="form" method="post">

	<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>

		</table>
	</div>

</form> -->
            </div>

        </article>
       
      <!-- // container -->
  
    </section>
    <c:import url="/views/common/footer.jsp"/>
 <script>
        $(function(){
			
			$("#inputPasswordCheck").blur(function(){
				var p1=$("#inputPassword0").val();
				var p2=$("#inputPasswordCheck").val();
				if(p1!=p2){
					console.log("p1: " + p1)
					console.log("p2: " + p2)
					alert("패스워드가 일치하지 않습니다.");
					$("#inputPassword0").focus();
				
					
				}
			});
			
			/* 아이디 중복검사 이벤트 추가 */
			$("#inputId").on("keyup", function(){
		        var memberId = $(this).val().trim();
		        
		        if(memberId.length<4) {
		        	$(".guide.error").hide();
		        	$(".guide.ok").hide();
		        	$(".guide.invalid").show();
		        	return;
		        	
		        } else {
		        	
			        $.ajax({
			            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			            data : {memberId:memberId},
			            dataType: "json",
			            success : function(data){
			                console.log(data);
			                // if(data=="true") //stream 방식
			                if(data.isUsable==true){ //viewName 방식
			                    $(".guide.error").hide();
			                    $(".guide.invalid").hide();
			                    $(".guide.ok").show();
			                    $("#idDuplicateCheck").val(1);
			                } else {
			                    $(".guide.error").show();
			                    $(".guide.invalid").hide();
			                    $(".guide.ok").hide();
			                    $("#idDuplicateCheck").val(0);
			                }
			            }, error : function(jqxhr, textStatus, errorThrown){
			                console.log("ajax 처리 실패");
			                //에러로그
			                console.log(jqxhr);
			                console.log(textStatus);
			                console.log(errorThrown);
			            }
		        	});
		     	}
		     //console.log(userId);
			});
		});
		
		function validate(){
			var userId = $("#inputId");
			if(userId.val().trim().length<4){
				alert("아이디는 최소 4자리이상이어야 합니다.");
				userId.focus();
				return false;
			}
			
			//아이디중복체크여부
		    if($("#idDuplicateCheck").val()==0){
		        alert("사용가능한 아이디를 입력해주세요.");
		        return false();
		    }
			
			return true;
		}
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath}/member/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		/** 2017년 3월 추가제공 **/
	
}

$(function(){
	$('[name=upFile]').on('change',function(){
	    //var fileName = $(this).val();//C:\fakepath\파일명
	    //var fileName = this.files[0].name;//파일명(javascript)
	    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
	    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
		//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
	    console.log($(this).val());
	    $(this).next('.custom-file-label').html(fileName);
	})
});

function fileDownload(oName, rName){
	//한글파일명이 있을 수 있으므로, 명시적으로 encoding
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
	
	
}




/* function changeImg(){
	$('[name=contentImg]').onclick('change',function(){
	    //var fileName = $(this).val();//C:\fakepath\파일명
	    //var fileName = this.files[0].name;//파일명(javascript)
	    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
	    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
		//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
	    console.log($(this).val());
	    $(this).next('.inputPhoto').html(fileName);
})
 */

function imgUpload(){
	$('#test').click();
}
 
function loadImg(value){
	
	if(value.files && value.files[0])  {
		
		var reader = new FileReader();
		
		reader.onload = function(e){

			$('#contentImg').attr('src', e.target.result);
			$('#inputPhoto').val($('#test').val());
		}
		
		reader.readAsDataURL(value.files[0]);
	}
}
</script>
    
</body>
</html>