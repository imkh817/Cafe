# ☕️ Cafe-Project
컨셉에 따라 카페를 추천해주는 웹사이트

> 페이지 단위로 나누어 프론트와 백을 모두 다루었으며, 다양한 온라인 쇼핑몰의 레이아웃과 기능을 참고하여 기획하였습니다.

## 🎨 개발 환경
Java 11  
Javascript  
Spring 5.3.20<br> 
Oracle DB<br>
Maven

## 👨🏻‍💻 사용 기술
- Mybatis : DB CRUD 기능, SQL 문 사용 및 mapper 이용하여 DB 관리
- Spring boot Security : PasswordEncoder 를 활용하여 암호를 BCrtypt방식으로 원본 비밀번호를 해싱하여 저장
- REST API : 카카오맵, 카카오로그인, 네이버로그인, 다음 주소 API
- Script API : Geolocation API, 길찾기 API
- Bootstrap : 메인 배너 이미지란에 부트스트랩 프레임워크 사용

## 🗓 프로젝트 기간
2023.11.20 ~ 2023.12.15  

## 📌 주요 기능
회원가입
- 새로운 사용자를 위한 회원가입 기능 제공
  
로그인/로그아웃
- 가입한 회원이 로그인하거나 로그아웃
- 회원의 아이디 찾기
- 회원이 가입시 등록한 회원의 이메일로 임시 비밀번호 발송

마이 페이지
- 찜목록
- 내리뷰 확인후 삭제 가능
- 정보 수정
- 회원이 탈퇴
- 1대1 문의

주변 카페 찾기
- 사용자의 현재 위치를 인증하여 주변 카페 추천

메인 페이지
- 카페의 컨셉 카테고리 별로 확인

장소 등록
- 관리자의 마이페이지에서 접근 가능
- 카테고리를 선택하여 분리 가능
- kakao api를 통해 주소를 검색하여 등록 가능
- 파일 업로드로 카페 이미지를 삽입 가능

장소 수정
- 상세 페이지에서 접근 가능
- 수정이 없이 등록할 시에 기존 등록된 정보들이 재등록
- kakao api를 통해 주소를 검색하여 등록 가능
- 파일 선택을 안할 시에 기존 파일을 등록

카페 상세 페이지
- 찜 기능
- 댓글 작성 시 해시태그 및 별점 선택 가능
- 댓글 작성시 선택한 별점 기준으로 프로세스 바 표시
- 주소 기반 지도 표시
- 길 찾기 버튼으로 카카오맵 api 불러오기

사장님 홍보 게시판
- 상품의 상세 정보를 확인하고 수정, 삭제 기능
- 주소 기반 지도 표시
- 길 찾기 버튼으로 카카오맵 api 불러오기
- 댓글 작성 및 삭제 기능

1:1 문의 게시판
- 마이페이지 내에서 접근 가능
- 파일 업로드로 사진을 추가할 수 있음
- 타인에게 게시물 공개 없이 관리자와 1:1로 게시물 공유 가능
- 답변 여부를 확인이 가능
- 

## erd
![Market_erd](https://github.com/imkh817/cafe_project/assets/142951589/541b11c6-2772-4f58-89c5-e70145cc864a)



