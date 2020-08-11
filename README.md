![image](https://user-images.githubusercontent.com/66008716/89505530-b9638f80-d804-11ea-851e-1b84e76e27a1.png)



## 1. Subject (주제)
- A user-centered restaurant recommendation service that shows a map based on the Kakao Map API. <br/>
 ( Kakao Map API를 통해 지도를 기반으로 보여주는 사용자 중심 맛집추천서비스 )

<br/>

## 2. Development environment (개발 환경)
<table>
 <tr>
   <td>Development tools</td>
   <td>STS</td>
 </tr>
  <tr>
   <td>UI design</td>
   <td>star UML, kakao Oven</td> 
 </tr>
 <tr>
   <td>DBMS</td>
   <td> Oracle -SQL Developer</td> 
 </tr>
 <tr>
   <td>Server</td>
   <td>Apache Tomcat 8.5</td> 
 </tr>
 <tr>
   <td>language</td>
   <td>Java, HTML5, CSS3, javascript, JQuery, Servlet, MyBatis, Spring</td> 
 </tr>
</table>

<br/>

## 3. development schedule(개발일정)
- 2020-06-29(Mon)~ 2020-08-09(Sun) 42 days

<br/>

## 4. Contributors (구성원)
![image](https://user-images.githubusercontent.com/66008716/89735135-5fc8c280-da9b-11ea-826c-609405dc2288.png)

- SungA Cho (sunga0720@naver.com)
- YeJin Ahn 
- ChangHyun Hwang
- EunSung Jo
- HyunMin Jo (johm616@naver.com)
- HaYoung Hwang

<br/>

## 5. Introduction to Services

### 1) Main
#### 1-1) SearchBar
- img
- 설명(조현민)
- 음식점 혹은 게시글을 선택해서 검색하고 싶은 단어를 입력하면 관련된 음식점(혹은 게시글)이 출력된다.
#### 1-2) Popular restaurant Top8 
- img
- 설명(조현민)
- 평균 별점이 제일 높은 순으로 9개의 음식점이 출력된다.
#### 1-3) Influencer's post
- img
- 설명(조현민)
- 사용자 중 팔로워가 가장 많으며 사용자가 작성한 게시글의 좋아요 수가 많은 8개의 게시글이 출력된다.
<br/>

### 2) Member
#### 2-1) Sign
- img
- 설명(황하용)
#### 2-2) Login
- img
- 설명(황하용)
<br/>


### 3) Mypage
#### 3-1) Mypage Main
- img
- 설명(조현민)
- 사용자가 작성한 게시글의 음식점들을 지도에 한번에 보일 수 있게 마커들을 출력하였다.
- 사용자가 작성한 게시글의 음식점들을 기준으로 음식점 카테고리별, 지역별 음식점 통계를 볼 수 있다.
#### 3-2) LikeList
- img
- 설명(조현민)
- 사용자가 다른 사용자의 게시글들을 좋아요 누른 목록을 확인 할 수 있다.
#### 3-3) BookmarkList
- img 
- 설명(조현민)
- 사용자가 북마크 표시를 한 음식점들 목록을 확인할 수 있다.
#### 3-4) Information update
- img
- 설명(황하용)
<br/>

### 4) Post
#### 4-1) Insert Post 
- img
- 설명(안예진)
#### 4-2) Post List
- img
- 설명(안예진)
#### 4-3) Post Detail
- img
- 설명(황창현)
#### 4-4) Post update
![bandicam 2020-08-11 16-58-12-598](https://user-images.githubusercontent.com/66407382/89873612-b0543300-dbf5-11ea-90ee-957a41fb58a4.JPG)
- 사용자가 작성한 게시글을 수정할 수 있도록 한다.
- 게시글을 수정 시 식당의 주소와 식당명, 이미지 파일을 불러와 편의성을 제공한다. 
- 올린 이미지 파일을 '파일 삭제'버튼을 통해 삭제가 가능하도록 한다.
#### 4-5) Post delete
- img
- 설명(안예진)

<br/>

### 5) Restaurant
#### 5-1) Restaurant List
- img
- 설명(안예진)
#### 5-2) Restaurant Detail
![bandicam 2020-08-11 16-27-06-341](https://user-images.githubusercontent.com/66407382/89873650-bba75e80-dbf5-11ea-98f9-a8fcd3b8ee12.JPG)
- 선택한 식당에 대한 상세한 데이터를 불러온다.
- 경로복사하기 버튼 클릭 시 해당 페이지의 URL을 복사한다.
- 리뷰 등록하기 버튼 클릭 시 해당 식당에 대한 리뷰를 등록 할 수 있다.
- 지도 API를 통하여 해당 식당에 위치를 표시하여, 사용자에게 명확한 정보를 제공한다.
- 해당 식당에 대한 리뷰목록을 확인할 수 있다. (식당에 대한 게시글을 간소화 하여 목록으로 구성)
- 해당 식당에 대한 게시글을 등록한 사용자의 성별 및 나이를 차트 및 그래프를 통하여 확인할 수 있다. 
- 주소를 기준으로 주변 인기 식당 목록을 확인할 수 있다.
<br/>

### 6) Gallery
- img
- 설명 (황창현)
<br/>

### 7) Admin
#### 7-1) Member
- img
- 관리자 페이지의 회원관리 탭을 클릭시 보여지는 페이지
- 모든 회원의 정보가 보여지며 회원의 활성화 상태를 관리자가 관리할 수 있다.
  (회원의 활성화상태를 비활성화로 변경시 해당 회원은 로그인이 불가하다.)
#### 7-2) Restaurant
##### (1) Restaurant List
- img
- 관리중인 식당의 데이터를 전부 불러온다.
- 식당의 활성화 상태를 통해 관리자는 폐업한 음식점을 사용자들에게 보이지 않게 할 수 있다.
- 관리자가 아닌 사용자들이 먼저 식당을 등록한 경우 관리자가 확인하였는지 관리자 상태로 구분하여 관리할 수 있다.  <br/>
  ( 등록상태 : R:Register / H:Hold / C:Confirm / A:Admin  ) ※사용자는 C와 A만 볼 수 있음
##### (2) Registration of the restaurant
- img 
- 설명 (황하용)
#### 7-3) Post
- img
- 사용자들이 게시글로 작성한 모든 정보를 출력하여 확인할 수 있다.
- 최신 게시글이 먼저 보이게 되며, 관리자가 부적합하다고 판단 시 해당 게시글의 활성화 상태를 변경하여 사용자들에게 안보이게 할 수 있다.
#### 7-4) Report
- 사용자들은 댓글과 게시글에 신고가 가능하다. 
- 이를 신고당한 댓글이나 게시글의 활성화상태 / 관리자의 확인 상태로 나누어 관리할 수 있도록 하였다.
##### (1) Reported comments List
- img
- 댓글이 신고된 경우, 해당 신고를 관리하기 위한 Report 테이블의 정보와 신고된 댓글의 정보를 함께 확인할 수 있도록 출력한다.
- 관리자가 판단하기에도 부적합하다고 판단될 경우, 댓글의 활성화 상태를 변경하여 사용자들에게는 보이지않게 비게시 처리한다.
- 확인한 신고에 대해서는 신고상태를 R에서 (Registration) C로 (Completion)바꾸어 확인여부를 구분한다.
##### (2) Reported posts List 
- img
- 게시글이 신고된 경우, 해당 신고를 관리하기 위한 Report 테이블의 정보와 신고된 게시글의 정보를 함께 확인할 수 있도록 출력한다.
- 관리자가 판단하기에도 부적합하다고 판단될 경우, 게시글의 활성화 상태를 변경하여 사용자들에게는 보이지않게 비게시 처리한다.
- 확인한 신고에 대해서는 신고상태를 R에서 (Registration) C로 (Completion)바꾸어 확인여부를 구분한다.

<br/>

### 8) WebSocket
- img
- 설명 (조현민)
- 모르겠다.
<hr/>  
