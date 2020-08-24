![image](https://user-images.githubusercontent.com/66008716/89505530-b9638f80-d804-11ea-851e-1b84e76e27a1.png)



# 1. Subject (주제)
- A user-centered restaurant recommendation service that shows a map based on the Kakao Map API. <br/>
 ( Kakao Map API를 통해 지도를 기반으로 보여주는 사용자 중심 맛집추천서비스 )

<br/>

# 2. Development environment (개발 환경)
<table>
 <tr>
   <td><b>Development tools</b></td>
   <td>STS</td>
 </tr>
  <tr>
   <td><b>UI design</b></td>
   <td>star UML, kakao Oven</td> 
 </tr>
 <tr>
   <td><b>DBMS</b></td>
   <td> Oracle -SQL Developer</td> 
 </tr>
 <tr>
   <td><b>Server</b></td>
   <td>Apache Tomcat 8.5</td> 
 </tr>
 <tr>
   <td><b>language</b></td>
   <td>Java, HTML5, CSS3, javascript, JQuery, Servlet, MyBatis, Spring</td> 
 </tr>
 <tr>
  <td><b>Design</b></td>
  <td style="color:blue">Responsive Web</td> 
 </tr>

</table>

<br/>

# 3. development schedule(개발일정)
- 1st : 2020-06-29(Mon) ~ 2020-08-09(Sun) 42 days
- 2nd : 2020-08-10(Mon) ~ Until we like it.

<br/>

# 4. Contributors (구성원)
![image](https://user-images.githubusercontent.com/66008716/89735135-5fc8c280-da9b-11ea-826c-609405dc2288.png)

- SungA Cho (sunga0720@naver.com)
- YeJin Ahn 
- ChangHyun Hwang (eternalkid@naver.com)
- EunSung Jo
- HyunMin Jo (johm616@naver.com)
- HaYoung Hwang

<br/>

# 5. Introduction to Services

## 1) Main
![mainUpload](https://user-images.githubusercontent.com/66008716/91013462-b51bdc80-e622-11ea-883a-3c90a47cb9a6.gif)
### 1-1) SearchBar
![검색바](https://user-images.githubusercontent.com/66407414/89986074-f91ff080-dcb6-11ea-814e-dd3cd3900893.png)
- 음식점 혹은 게시글을 선택해서 검색하고 싶은 단어를 입력하면 관련된 음식점(혹은 게시글)이 출력된다.
- 음식점을 선택 후 '강남'이라고 입력하고 검색하게 된다면 '강남'과 관련된 음식점 목록이 출력된다.
- 게시글을 선택 후 '강남'이라고 입력하고 검색하게 된다면 '강남'과 관련된 게시글 목록이 출력된다.
### 1-2) Popular restaurant Top9 
![음식점9](https://user-images.githubusercontent.com/66407414/89986093-0046fe80-dcb7-11ea-97d7-f19b6cd44029.PNG)
- 평균 별점이 제일 높은 순으로 9개의 음식점이 출력된다.
- 출력된 음식점을 클릭하게 되면 해당 음식점의 상세페이지로 넘어가게 된다.
### 1-3) Influencer's post
![인플루언서8](https://user-images.githubusercontent.com/66407414/89986100-0210c200-dcb7-11ea-86ef-a74dd68af0a6.PNG)
- 사용자 중 팔로워가 가장 많으며 사용자가 작성한 게시글의 좋아요 수가 많은 8개의 게시글이 출력된다.
- 출력된 게시글을 클릭하게 되면 해당 게시글의 상세페이지로 넘어가게 된다.
<br/>

## 2) Member
### 2-1) Sign
- img
- 사용자가 회원 서비스를 이용하고 싶을 시, 회원가입이 필수적으로 요구된다. (좋아요, 신고하기, 댓글달기, 게시글 작성, 북마크, 팔로우 등)
- 회원가입시 아이디, 비밀번호, 닉네임, 이름, 소개글, 주소, 생년월일, 이메일, 연락처, 약관동의여부에 대한 정보를 받는다.

&nbsp;&nbsp;&nbsp;(1) 필수입력 정보 : 회원의 프로필 이미지와 소개글을 제외한 모든 정보는 필수입력사항이다.<br/>
&nbsp;&nbsp;&nbsp;(2) 아이디 중복 체크 : 아이디 입력 input에 작성한 아이디가 이미 존재하는 아이디인지<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ajax를 통해 확인하여 사용가능 여부를 사용자에게 알려준다.<br/>
&nbsp;&nbsp;&nbsp;(3) 정규식 처리 : 아이디, 비밀번호, 이메일은 특정한 규칙이 충족되지 않으면 해당 폼이 submit 되지 않는다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ※ 아이디(영문시작/영문+숫자 5자 이상), 비밀번호(영문+숫자 6~18자)<br/>
&nbsp;&nbsp;&nbsp;(4) 이메일 인증 : 이메일 인증 API를 사용하여 이메일 인증을 진행하여야만 회원가입이 가능하다. <br/>
&nbsp;&nbsp;&nbsp;(5) 주소 입력 : 사용자가 주소를 입력하기 편하도록 주소검색 API를 사용하였다.<br/>
&nbsp;&nbsp;&nbsp;(6) 비밀번호 확인 : 비밀번호 확인 창을 두어 사용자가 비밀번호를 정확하게 작성하였는지 확인을 한 번 더 거친다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 두 창의 값이 동일한 경우만 가입 가능하다.<br/>
&nbsp;&nbsp;&nbsp;(7) 이용약관 : 이용약관을 클릭시 모달창을 띄워서 사용자가 약관의 내용을 확인할 수 있도록 하였다.<br/>

### 2-2) Login
![logingUpload (2)](https://user-images.githubusercontent.com/66008716/91014378-3fb10b80-e624-11ea-87b7-33c015fe4188.gif)
- 회원가입된 아이디에 해당하는 비밀번호를 입력시 회원의 활성화상태가 'Y'인 경우 로그인이 가능하다.<br/>
&nbsp;&nbsp;&nbsp;(회원 활성화상태 : 관리자가 회원의 활동을 막은 경우, 회원이 탈퇴한 경우는 'N'으로 활성화 상태가 변경된다.)
- 관리자 아이디('admin')로 로그인시 상단 메뉴에 관리자 페이지로 접속 가능한 "admin" 버튼이 나타난다.
<br/>


## 3) Mypage
### 3-1) Mypage Main
![마이페이지](https://user-images.githubusercontent.com/66407414/89988139-0db1b800-dcba-11ea-80e0-71937ef396e8.PNG)
- 사용자가 작성한 게시글의 음식점들을 지도에 한번에 보일 수 있게 마커들을 출력하였다.
- 지도에 표시된 마커에 마우스 커서를 올리면 해당 음식점의 정보를 확인할 수 있다.
- 사용자가 작성한 게시글의 음식점들을 기준으로 음식점 카테고리별, 지역별 음식점 통계를 볼 수 있다.
### 3-2) LikeList
![좋아요리스트](https://user-images.githubusercontent.com/66407414/89986116-0c32c080-dcb7-11ea-970a-d95b6d2534fd.PNG)
- 사용자가 다른 사용자의 게시글들을 좋아요 누른 목록을 확인 할 수 있다.
- 출력된 게시글을 클릭하게 되면 해당 게시글의 상세페이지로 넘어가게 된다.
### 3-3) BookmarkList
![북마크리스트](https://user-images.githubusercontent.com/66407414/89986120-0ccb5700-dcb7-11ea-8b9a-7be022e03b29.PNG)
- 사용자가 북마크 표시를 한 음식점들 목록을 확인할 수 있다.
- 출력된 음식점을 클릭하게 되면 해당 음식점의 상세페이지로 넘어가게 된다.
### 3-4) Information update
- img
- 마이페이지>회원정보 수정 메뉴를 통해 접근 가능하다.
&nbsp;&nbsp;&nbsp;(1) 정보보호 강화 : 비밀번호를 입력하여 일치하는 경우에 접근 가능하도록하여, 개인정보보호를 강화하였다.<br/>
&nbsp;&nbsp;&nbsp;(2) 정보수정 : 비밀번호외의 내용을 수정시 비밀번호확인을 다시 입력하지 않아도 되도록 개발하였다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 단, 비밀번호 변경을 원할 시에는 변경할 비밀번호와 비밀번호 확인을 체크하여 수정할 수 있도록 하였다.<br/>
&nbsp;&nbsp;&nbsp;(3) 회원탈퇴 : 회원 탈퇴 버튼 클릭시 회원의 활성화상태가 'N'으로 변경된다. <br/>
<br/>

## 4) Post
### 4-1) Insert Post 
- img
- 사진은 최대 10개까지 첨부할 수 있다.
-주소 검색 시 식당 이름을 조회할 때, 식당이 등록 안 되어있으면 식당을 추가한다.
-식당에 대한 평가를 별점을 통해 점수를 매길 수 있다.
-식당 등록 시 시퀀스를 사용하여 등록된 게시글 번호 다음 번호를 자동으로 가져오고, 사진을 DB에 저장하기 위해 게시글 등록할 때 방금 들어간 번호를 가져온다.


### 4-2) Post List
- img
- 게시글의 대표 사진 하나를 보여준다.
-게시글 상태가 'Y'인 것을 최근 등록된 순으로 게시글 전체를 출력한다.
-내 게시글의 좋아요한 사용자 리스트를 출력하되 존재하는 사용자만 보여주기 위해 멤버 상태가 'Y'인 것만 출력한다.


### 4-3) Post Detail
![postDetail](https://user-images.githubusercontent.com/66407391/90312914-2e407300-df43-11ea-8272-15e75e3563ca.gif)
- 포스트 상세 페이지 : 해당 게시글을 좋아요 누르거나 취소할 수 있습니다. 
- 링크 복사 버튼으로 해당 페이지 링크를 복사할 수 있습니다. 
- 프린트 버튼으로 해당페이지 프린트할 수 있습니다. 
- 포스트 작성자와 로그인사용자가 다를시 신고할수 있고 중복 신고할 수 없습니다.

![comment](https://user-images.githubusercontent.com/66407391/90312918-2f71a000-df43-11ea-87d8-2ca636b78925.gif)
- 댓글을 작성 수정 삭제가 가능합니다.
- 다른사람의 댓글을 신고할 수 있고 중복신고는 불가 합니다.

![recomment](https://user-images.githubusercontent.com/66407391/90312921-30a2cd00-df43-11ea-82cd-d721fdd79936.gif)
- 댓글에 대댓글을 작성할 수 있고 대댓글 역시 수정, 삭제가 가능합니다. 
- 다른사람의 대댓글을 신고할 수 있고 중복신고는 불가 합니다. 

### 4-4) Post update
![게시글수정](https://user-images.githubusercontent.com/66407382/89920485-6a1fc380-dc37-11ea-8a1c-4772f762d0b5.gif)
- 사용자가 작성한 게시글을 수정할 수 있도록 한다.
- 게시글을 수정 시 식당의 주소와 식당명, 이미지 파일을 불러와 편의성을 제공한다. 
- 올린 이미지 파일을 '파일 삭제'버튼을 통해 삭제가 가능하도록 한다.


### 4-5) Post delete
- img
- 게시글 삭제 시 사진, 댓글, 게시글이 동시에 삭제돼야 한다.
-사진, 댓글, 게시글 상태를 'N'으로 돌려, 사용자에겐 보이지 않지만, DB에는 일정 부분 보관하도록 하였다.

<br/>

## 5) Restaurant
### 5-1) Restaurant List
- img
- 식당 게시상태가 'Y'이고, 관리자 상태가 'C'나'A'만 보인다.
-식당의 평균 별점, 조회 수, 게시글의 대표 사진을 보여주고,카테고리별(전체 리스트, 한식, 중식, 일식, 양식, 기타. 디저트) 전체 리스트를 출력한다.
-※(C:confirm A:admin)

### 5-2) Restaurant Detail
![식당디테일](https://user-images.githubusercontent.com/66407382/89920495-6c821d80-dc37-11ea-96a0-aae216ab26aa.gif)
- 선택한 식당에 대한 상세한 데이터를 불러온다.
- 경로복사하기 버튼 클릭 시 해당 페이지의 URL을 복사한다.
- 리뷰 등록하기 버튼 클릭 시 해당 식당에 대한 리뷰를 등록 할 수 있다.
- 지도 API를 통하여 해당 식당에 위치를 표시하여, 사용자에게 명확한 정보를 제공한다.
- 해당 식당에 대한 리뷰목록을 확인할 수 있다. (식당에 대한 게시글을 간소화 하여 목록으로 구성)
- 해당 식당에 대한 게시글을 등록한 사용자의 성별 및 나이를 차트 및 그래프를 통하여 확인할 수 있다. 
- 주소를 기준으로 주변 인기 식당 목록을 확인할 수 있다.
<br/>

## 6) Gallery
![myGallery](https://user-images.githubusercontent.com/66407391/90312911-2c76af80-df43-11ea-9f2d-f5c2194e880b.gif)
- 비회원 상태에서 상단 mygallery 클릭시 로그인 창 띄움
- myGallery에 해당 member의 정보 가져오기 (포스트, 팔로워, 팔로잉 개수 가져오기 등등)
- 해당 유저의 포스트 대표사진 리스트로 가져와서 아래 출력하기
- 팔로우 버튼은 로그인한 아이디와 gallery의 아이디가 다를때 클릭 확인 가능하다.
<br/>

## 7) Admin
### 7-1) Member
- img
- 관리자 페이지의 회원관리 탭을 클릭시 보여지는 페이지
- 모든 회원의 정보가 보여지며 회원의 활성화 상태를 관리자가 관리할 수 있다.
  (회원의 활성화상태를 비활성화로 변경시 해당 회원은 로그인이 불가하다.)
### 7-2) Restaurant
#### (1) Restaurant List
- img
- 관리중인 식당의 데이터를 전부 불러온다.
- 식당의 활성화 상태를 통해 관리자는 폐업한 음식점을 사용자들에게 보이지 않게 할 수 있다.
- 관리자가 아닌 사용자들이 먼저 식당을 등록한 경우 관리자가 확인하였는지 관리자 상태로 구분하여 관리할 수 있다.  <br/>
  ( 등록상태 : R:Register / H:Hold / C:Confirm / A:Admin  ) ※사용자는 C와 A만 볼 수 있음
#### (2) Registration of the restaurant
- img 
- 설명 (황하용)
### 7-3) Post
- img
- 사용자들이 게시글로 작성한 모든 정보를 출력하여 확인할 수 있다.
- 최신 게시글이 먼저 보이게 되며, 관리자가 부적합하다고 판단 시 해당 게시글의 활성화 상태를 변경하여 사용자들에게 안보이게 할 수 있다.
### 7-4) Report
- 사용자들은 댓글과 게시글에 신고가 가능하다. 
- 이를 신고당한 댓글이나 게시글의 활성화상태 / 관리자의 확인 상태로 나누어 관리할 수 있도록 하였다.
#### (1) Reported comments List
- img
- 댓글이 신고된 경우, 해당 신고를 관리하기 위한 Report 테이블의 정보와 신고된 댓글의 정보를 함께 확인할 수 있도록 출력한다.
- 관리자가 판단하기에도 부적합하다고 판단될 경우, 댓글의 활성화 상태를 변경하여 사용자들에게는 보이지않게 비게시 처리한다.
- 확인한 신고에 대해서는 신고상태를 R에서 (Registration) C로 (Completion)바꾸어 확인여부를 구분한다.
#### (2) Reported posts List 
- img
- 게시글이 신고된 경우, 해당 신고를 관리하기 위한 Report 테이블의 정보와 신고된 게시글의 정보를 함께 확인할 수 있도록 출력한다.
- 관리자가 판단하기에도 부적합하다고 판단될 경우, 게시글의 활성화 상태를 변경하여 사용자들에게는 보이지않게 비게시 처리한다.
- 확인한 신고에 대해서는 신고상태를 R에서 (Registration) C로 (Completion)바꾸어 확인여부를 구분한다.

<br/>

## 8) WebSocket
![알람](https://user-images.githubusercontent.com/66407414/89990046-bfea7f00-dcbc-11ea-97b2-c9df2c441fb9.PNG)
- 다른 사용자가 본인의 게시글에 좋아요나 댓글을 달았을 시에 알람을 받을 수 있도록 구현하였다.
<hr/>  
