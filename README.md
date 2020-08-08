![image](https://user-images.githubusercontent.com/66008716/89505530-b9638f80-d804-11ea-851e-1b84e76e27a1.png)



## 1. Subject (주제)
- A user-centered restaurant recommendation service that shows a map based on the Kakao Map API.
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
   <td>Java, HTML5, CSS3, javascript, JQuery, Servlet</td> 
 </tr>
</table>

<br/>

## 3. development schedule(개발일정)
- 2020-06-29(Mon)~ 2020-08-09(Sun) 42 days

<br/>

## 4. Contributors (구성원)
- SungA Cho (sunga0720@naver.com)
- YeJin Ahn 
- ChangHyun Hwang
- EunSung Jo
- HyunMin Jo
- HaYoung Hwang

<br/>

## 5. Introduction to Services

### 1) Main
#### 1-1) Popular restaurant Top8
- img
- 설명(조현민)
#### 1-2) Influencer's post
- img
- 설명(조현민)
#### 1-3) SearchBar
- img
- 설명(조현민)
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
#### 3-2) LikeList
- img
- 설명(조현민)
#### 3-3) BookmarkList
- img 
- 설명(조현민)
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
- img
- 설명(조은성)
#### 4-5) Post delete
- img
- 설명(안예진)

<br/>

### 5) Restaurant
#### 5-1) Restaurant List
- img
- 설명(안예진)
#### 5-2) Restaurant Detail
- img
- 설명(조은성)
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
- 관리자가 아닌 사용자들이 먼저 식당을 등록한 경우 관리자가 확인하였는지 관리자 상태로 구분하여 관리할 수 있다. 
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
<hr/>  
