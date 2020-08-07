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

            </div>

        </article>
       
  
    </section>
    <c:import url="/views/common/footer.jsp"/>
    <div class="white_content" id="open">
        <div>
            <p align="right"><a href="#close">닫기</a></p>
            <p>('http://tastyMap.com/'이하 'tastymap')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br>

('tastymap') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br>

○ 본 방침은부터 2020년 8월 6일부터 시행됩니다.<br>


1. 개인정보의 처리 목적 ('http://tastyMap.com/'이하 'tastymap')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.<br>

가. 홈페이지 회원가입 및 관리<br>

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지 등을 목적으로 개인정보를 처리합니다.<br>


2. 개인정보 파일 현황<br>

1. 개인정보 파일명 : tastymap<br>
개인정보 항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름<br>
수집방법 : 홈페이지, 생성정보 수집 툴을 통한 수집<br>
보유근거 : tastymap<br>
보유기간 : 1년<br>
관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월<br>


3. 개인정보의 처리 및 보유 기간<br>

① ('tastymap')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.<br>

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>

1.<홈페이지 회원가입 및 관리><br>
<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<1년>까지 위 이용목적을 위하여 보유.이용됩니다.<br>
보유근거 : tastymap<br>
관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년<br>
2) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
3) 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br>
4) 계약 또는 청약철회 등에 관한 기록 : 5년<br>
5) 표시/광고에 관한 기록 : 6개월<br>
예외사유 :<br>


4. 개인정보의 제3자 제공에 관한 사항<br>

① ('http://tastyMap.com/'이하 'tastymap')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>

② ('http://tastyMap.com/')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>

1.
개인정보를 제공받는 자 : tastymap<br>
제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름<br>
제공받는 자의 보유.이용기간: 1년<br>


5. 개인정보처리 위탁<br>

① ('tastymap')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>

1.
위탁받는 자 (수탁자) :<br>
위탁하는 업무의 내용 :<br>
위탁기간 :<br>
② ('http://tastyMap.com/'이하 'tastymap')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>

6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.<br>

① 정보주체는 tastymap에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.<br>

② 제1항에 따른 권리 행사는tastymap에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 tastymap은(는) 이에 대해 지체 없이 조치하겠습니다.<br>

③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>

④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>

⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>

⑥ tastymap은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>



7. 처리하는 개인정보의 항목 작성<br>

① ('http://tastyMap.com/'이하 'tastymap')은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br>

1<홈페이지 회원가입 및 관리><br>
필수항목 : 이메일, 휴대전화번호, 자택주소, 자택전화번호, 비밀번호, 로그인ID, 성별, 생년월일, 이름<br>
- 선택항목 :<br>


8. 개인정보의 파기('tastymap')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br>

-파기절차<br>
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br>

-파기기한<br>
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br>

-파기방법<br>

전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다<br>



9. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항<br>

tastymap 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.<br>

10. 개인정보 보호책임자 작성<br>

① tastymap(‘http://tastyMap.com/’이하 ‘tastymap) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>

▶ 개인정보 보호책임자<br>
성명 :황하용<br>
직책 :일개사원<br>
직급 :말단<br>
연락처 :010-1234-5678, fpdlqm123@naver.com,<br>
※ 개인정보 보호 담당부서로 연결됩니다.<br>

▶ 개인정보 보호 담당부서<br>
부서명 :보안담당<br>
담당자 :황하용<br>
연락처 :01011111222, fpdlqm123@naver.com,<br>
② 정보주체께서는 tastymap(‘http://tastyMap.com/’이하 ‘tastymap) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. tastymap(‘http://tastyMap.com/’이하 ‘tastymap) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>

11. 개인정보 처리방침 변경<br>

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.<br>



12. 개인정보의 안전성 확보 조치 ('tastymap')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br>

1. 정기적인 자체 감사 실시<br>
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br>

2. 개인정보 취급 직원의 최소화 및 교육<br>
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br>

3. 내부관리계획의 수립 및 시행<br>
개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br>

4. 해킹 등에 대비한 기술적 대책<br>
<tastymap>('tastymap')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.<br>

5. 개인정보의 암호화<br>
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br>

6. 접속기록의 보관 및 위변조 방지<br>
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.<br>

7. 개인정보에 대한 접근 제한<br>
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br>

8. 문서보안을 위한 잠금장치 사용<br>
개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.<br>

9. 비인가자에 대한 출입 통제<br>
개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.<br></p><br><br>
		<a href="#close">
         <button type="button" id="join-submit" class="btn btn-primary" style="; width:100%; height:50px; display: flex;
  align-items: center;
  justify-content: center;">
                            확인<i class="fa fa-check spaceLeft"></i>
                        </button>
        </a>   
              <br><br>       
        </div>
    </div>
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
	
	
	// 이미지 업로드 전용 function
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
			 
			 
		// 프로필 사진 파일 업로드용 function
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