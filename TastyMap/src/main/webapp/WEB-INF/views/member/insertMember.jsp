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
		
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	overflow: auto;	
}
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
                <form role="form" name="form" id="form" enctype="multipart/form-data" method="post"  onsubmit="return check()" action="${pageContext.request.contextPath }/member/insertMember.do">
                  <label for="profileId">프로필 사진</label>
                  <div class="wrap-input100 validate-input m-b-23"  data-validate = "Username is reauired">
                    <label for="thumbnailImg" ><img src="/tastyMap/resources/images/intro.png"  id="contentImg" onclick="imgUpload();" class="rounded-circle" style="width: 150px; height: 150px;"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="file" id="test" name="mphoto" onchange="loadImg(this);" multiple style="display:none"/>
                    <div class="form-group">
                    <label style="width: 74%;">
                      <input type="text" class="form-control" id="inputPhoto" name="inputPhoto" style="width: 100%; display:none;" placeholder="프로필 사진을 등록해주세요">
                    </label>
                    </div>
                    
                  </div>
     
                   <div class="form-group" >
                      <label for="inputId0">아이디</label>
                      <input type="text" class="form-control" id="inputId0" name="inputId0" placeholder="아이디를 입력해 주세요" required oninvalid="this.setCustomValidity('아이디를 입력해주세요')">
                      <label id="idCheck" name="idCheck" for="idCheck"></label>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword0" name="inputPassword0" placeholder="비밀번호를 입력해주세요" required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')">
                    <label id="passCheck" name="passCheck" for="passCheck"></label>
                  </div>
                  <div class="form-group">
                    <label for="inputPasswordCheck">비밀번호 확인</label>
                    <input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required oninvalid="this.setCustomValidity('비밀번호 확인을 해주세요')">
                    <label id="passpassCheck" name="passpassCheck" for="passpassCheck"></label>
                  </div>
                  <div class="form-group" >
                      <label for="inputName">성명</label>
                      <input type="text" class="form-control" id="inputName" name="inputName" placeholder="이름을 입력해 주세요" required oninvalid="this.setCustomValidity('이름을 입력해주세요')">
                      <label id="nameCheck" name="nameCheck" for="nameCheck"></label>
                  </div>
                  <div class="form-group" >
                    <label for="inputNicName">닉네임</label>
                    <input type="text" class="form-control" id="inputNicName" name="inputNicName" placeholder="사용할 닉네임을 입력해 주세요" required oninvalid="this.setCustomValidity('닉네임을 입력해주세요')" onchange="this.setCustomValidity('')">
                </div>
                <div class="form-group" >
                  <label for="inputIntro">소개</label>
                  <input type="text" class="form-control" id="inputIntro" name="inputIntro" placeholder="나를 소개하는 글을 적어주세요" >
              </div>
                <div class="form-group" >
                  <label for="inputBirth">생년월일</label>
                  <input type="text" id="yy" name="yy" placeholder="년(4자)" aria-label="년(4자)" class="form-control" maxlength="4" value="" required oninvalid="this.setCustomValidity('태어난 연도를 입력해주세요')">
                  <label id="yyCheck" name="yyCheck" for="yyCheck"></label>
                  <select id="mm" name="mm" class="form-control" aria-label="월" required >
										<option value="100">월</option>
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
                  <input type="text" id="dd" name="dd" placeholder="일" aria-label="일" class="form-control" maxlength="2" required oninvalid="this.setCustomValidity('날짜를 입력해주세요')">
                  <label id="ddCheck" name="ddCheck" for="ddCheck"></label>
                  
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
                      <input type="tel" class="form-control" id="inputMobile" name="inputMobile" placeholder="휴대폰번호를 ('-'하이폰 빼고) 입력해 주세요" required oninvalid="this.setCustomValidity('핸드폰번호를 입력해주세요')">
                      <label id="telCheck" name="telCheck" for="telCheck"></label>
                  </div>
                  <div class="form-group">
                      <!-- <label for="InputEmail">이메일 주소</label> -->
                      <th>이메일 주소</th><br>
                      <tr>
                        <td>
                      <input type="email" class="form-control" id="InputEmail" name="InputEmail" value="" style="width : 87%; display: inline;" placeholder="바로 인증하기를 눌러주세요" readonly />
                      <input type="button" class="btn btn-primary" value="인증하기" style="height: 52px; margin-top: -3px; margin-left: 2px;"onclick="emailAuth();">
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
                        <input type="text" class="form-control" id="roadFullAddr" name="roadFullAddr" value="" style="width : 87%; display: inline;" placeholder="바로 주소검색을 눌러주세요"  readonly>
                        <input type="button" class="btn btn-primary" style="height: 52px; margin-top: -3px; margin-left: 2px;" value="주소검색" onclick="goPopup();" >
                        </div>
                      </td>
                    </tr>
                  </tbody>
                    <br>

                    <div class="form-group">
                    <label>약관 동의</label><br>
                    
                    
                    
                   <input id="agree" type="checkbox" style="width: 23px; height: 23px; " required oninvalid="this.setCustomValidity('회원약관에 동의해주세요!')" onchange="this.setCustomValidity('')"> 
                    <a href="#open">이용약관</a>에 동의해주세요
    <div class="white_content" id="open">
        <div>
            <p align="right"><a href="#close">닫기</a></p>
            <img src="${pageContext.request.contextPath}/resources/images/profileImage/provision.JPG" style="width:100%; height:90%;">
        </div>
    </div>
                    
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary" onclick="form();">
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
    
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("${pageContext.request.contextPath}/member/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	
	function emailAuth(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("${pageContext.request.contextPath}/member/emailAuth.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	  //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	
	function jusoCallBack(roadFullAddr){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			/** 2017년 3월 추가제공 **/
		
	}
	
	function emailCallBack(InputEmail){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.InputEmail.value = InputEmail;
		/** 2017년 3월 추가제공 **/
	
	}
	
	function fileDownload(oName, rName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		
		
	}
	
	// 주소랑 이메일이 입력되었는지 물어보고 submit
	function check() {

		  if(($('#InputEmail').val()) == "") {

		    alert("이메일값을 입력해 주세요.");

		    form.InputEmail.focus();

		    return false;

		  }

		  else if(($('#roadFullAddr').val()) == "") {

		    alert("주소값을 입력해 주세요.");

		    form.roadFullAddr.focus();

		    return false;

		  }

		  else return true;

		}
	
	
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

	
		$(function(){
			
			/* 아이디 유효성체크  */
			 $('#inputId0').change(function(){
			      var reg1 = /^[a-z]+[a-z0-9]{4,19}$/g;
			      var id= $('#inputId0').val();
			      console.log(id);
			      
			      if (!reg1.test($('#inputId0').val())) {
			          $('#idCheck').html("<p style='color:red'>영문자로 시작하는 5자이상 영문자 또는 숫자이어야 합니다.").fadeIn(500);
			       $("#idCheck").delay(2000);
			       $("#idCheck").fadeOut(500);
			       $('#inputId0').val("");
			       $('#inputId0').focus();
			    } else {
			    	$.ajax({
			            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			            data : {memberId:id},
			            dataType: "json",
			            success : function(data){
			                console.log(data);
			                // if(data=="true") //stream 방식
			                if(data.isUsable==true){ //viewName 방식
			                	$('#idCheck').html("<p style='color:blue'>사용할수있는 아이디.").fadeIn(500);
			                	$("#inputId0").setCustomValidity("");
			                } else {
			                	$('#idCheck').html("<p style='color:red'>아이디가 중복됩니다.").fadeIn(500);
			                	$('#inputId0').val("");
			                    
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
			      
			 });
			
			 /* 비밀번호 유효성체크  */
			 $('#inputPassword0').change(function(){
			
			      var reg2 = /^[A-Za-z0-9_-]{6,18}$/;
			  
			      if (!reg2.test($('#inputPassword0').val())) {
			          $('#passCheck').html("<p style='color:red'>영문대소문자+숫자 6~18자리로 작성해주세요.</p>").fadeIn(500);
			       $("#passCheck").delay(2000);
			       $("#passCheck").fadeOut(500);
			          $('#inputPassword0').val('');
			       $('#inputPassword0').focus();
			    }			  
			      this.setCustomValidity('');
			 });
			
			/* 비밀번호와 비밀번호가 같은지 유효성체크  */
			 $('#inputPasswordCheck').change(function(){
			      if ($('#inputPassword0').val() != $('#inputPasswordCheck').val()) {
			          $('#passpassCheck').html("<p style='color:red'>비밀번호가 다릅니다.</p>").fadeIn(500);
			       $("#passpassCheck").delay(2000);
			       $("#passpassCheck").fadeOut(500);
			          $('#inputPasswordCheck').val('');
			       $('#passpassCheck').focus();
			    }else {
			       $('#passpassCheck').html("<p style='color:blue'>비밀번호 확인되었습니다.</p>").fadeIn(500);
			       $("#passpassCheck").delay(2000);
			       $("#passpassCheck").fadeOut(500); 
			    } 
			      this.setCustomValidity('');
			 });
			 
			 /* 이름 유효성체크  */
			 $('#inputName').change(function(){
			
			      var reg3 = /^[가-힝]{2,4}$/;
			  
			      if (!reg3.test($('#inputName').val())) {
			          $('#nameCheck').html("<p style='color:red'>한글 2자이상 4자 이하로 작성해주세요.</p>").fadeIn(500);
			       $("#nameCheck").delay(2000);
			       $("#nameCheck").fadeOut(500);
			          $('#inputName').val('');
			       $('#userName').focus();
			    }			  
			      this.setCustomValidity('');
			 });
			 
			 
			 
			 /* 생년월일 연 유효성체크  */
			 
			 
			 $('#yy').change(function(){
				 var regex= /[^0-9]/g
				 if(!regex.test($('#yy').val())){
			      if (($('#yy').val()) <= 1899 || ($('#yy').val()) >= 2021 ){
			       $('#yyCheck').html("<p style='color:red'>1900 ~ 2020 </p>").fadeIn(500);
			       $("#yyCheck").delay(2000);
			       $("#yyCheck").fadeOut(500);
			       $('#yy').val('');
			       $('#yy').focus();
				  } else {
					  this.setCustomValidity('');
				  }
				 } else {
				      $('#yyCheck').html("<p style='color:red'>숫자로입력해주세요 </p>").fadeIn(500);
				       $("#yyCheck").delay(2000);
				       $("#yyCheck").fadeOut(500);
				       $('#yy').val('');
				       $('#yy').focus();
					  }
			 });
			 
			 /* 생년월일 일 유효성체크 */
			 $('#dd').change(function(){
				if(($('#yy').val() != "")) {
				if($('#mm').val() != "100") {
					if (($('#mm').val()) == "01" || ($('#mm').val()) == "03" || ($('#mm').val()) == "05" || ($('#mm').val()) == "07" || ($('#mm').val()) == "08" || ($('#mm').val()) == 10 || ($('#mm').val()) == 12){
						if(($('#dd').val()) < 1 || ($('#dd').val()) > 31) {
							$('#ddCheck').html("<p style='color:red'>해당 월은 31일까지있습니다</p>").fadeIn(500);
						    $("#ddCheck").delay(2000);
						    $("#ddCheck").fadeOut(500);
						    $('#dd').val('');
						    $('#dd').focus();
						}
							
					} else if (($('#mm').val()) == "04" || ($('#mm').val()) == "06" || ($('#mm').val()) == "09" || ($('#mm').val()) == 11) {
						if(($('#dd').val()) < 1 || ($('#dd').val()) > 30) {
							$('#ddCheck').html("<p style='color:red'>해당 월은 30일까지있습니다</p>").fadeIn(500);
						    $("#ddCheck").delay(2000);
						    $("#ddCheck").fadeOut(500);
						    $('#dd').val('');
						    $('#dd').focus();
						}	
					} else if (($('#mm').val()) == "02"){
						 if(($('#yy').val()) % 4 == 0 && (($('#yy').val()) % 100 != 0 || ($('#yy').val()) % 400 == 0)) {
						   if(($('#dd').val()) < 1 || ($('#dd').val()) > 29) {
						  		$('#ddCheck').html("<p style='color:red'>해당 월은 윤년이라 29일까지있습니다</p>").fadeIn(500);
						  	    $("#ddCheck").delay(2000);
						  	    $("#ddCheck").fadeOut(500);
						  	    $('#dd').val('');
						  	    $('#dd').focus();
							 }
						} else {
							if(($('#dd').val()) < 1 || ($('#dd').val()) > 28) {
						  		$('#ddCheck').html("<p style='color:red'>해당 월은 28일까지있습니다</p>").fadeIn(500);
						  	    $("#ddCheck").delay(2000);
						  	    $("#ddCheck").fadeOut(500);
						  	    $('#dd').val('');
						  	    $('#dd').focus();
							 }
						}
					}
					
				} else {
					$('#ddCheck').html("<p style='color:red'>태어난 월부터 기입해주세요</p>").fadeIn(500);
				    $("#ddCheck").delay(2000);
				    $("#ddCheck").fadeOut(500);
				    $('#dd').val('');
				    $('#dd').focus();
				}
			} else {
				$('#ddCheck').html("<p style='color:red'>태어난 연도부터 기입해주세요</p>").fadeIn(500);
			    $("#ddCheck").delay(2000);
			    $("#ddCheck").fadeOut(500);
			    $('#dd').val('');
			    $('#dd').focus();
			}
				this.setCustomValidity('');
		});
			 		 
			 
			 /* 핸드폰번호 유효성체크  */
			 $('#inputMobile').change(function(){
			
			      var reg4 = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

			      출처: https://suyou.tistory.com/150 [수유산장]
			  
			      if (!reg4.test($('#inputMobile').val())) {
			          $('#telCheck').html("<p style='color:red'>핸드폰 번호를 잘못입력하셧습니다.</p>").fadeIn(500);
			       $("#telCheck").delay(2000);
			       $("#telCheck").fadeOut(500);
			          $('#inputMobile').val('');
			       $('#inputMobile').focus();
			    }
			      this.setCustomValidity('');
			 });
			 
			 

			$('[name=upFile]').on('change',function(){
			    //var fileName = $(this).val();//C:\fakepath\파일명
			    //var fileName = this.files[0].name;//파일명(javascript)
			    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
			    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
				//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
			    console.log($(this).val());
			    $(this).next('.custom-file-label').html(fileName);
			});
		});
			
		
		
		</script>
    
</body>
</html>