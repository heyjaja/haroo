# 협업을 위한 그룹웨어 haroo

2022.05 ~ 2022.06 [Spring project] Groupware haroo

<a href="https://drive.google.com/file/d/1VcE-5kMbOcsjEnelRkMJ8tTErBXNjOLC/view?usp=sharing" target="_blank">포트폴리오 전체 문서</a> | <a href="https://drive.google.com/drive/folders/107j7ezf0CbO6cr48o0BtdnIcaUtTSeZc?usp=sharing" target="_blank">시연 영상</a> 

## 소개
- 협업을 위한 그룹웨어
- 로그인, 마이페이지, 뉴스피드, 캘린더, 근태관리, 전자결재, 게시판, 채팅 기능
- 팀 인원 5명 
- 2주 단위 sprint로 진행
- JIRA로 프로젝트 관리, 매일 오전 SCRUM 회의 진행

## 개발환경
- Front-end
  - HTML/CSS
  - JavaScript
  - jQuery 3.x
  - Bootstrap 5.x
  - JSON
  - AJAX
- Back-end
  - Java 11
  - Spring 5.x
  - Maven
  - JSP
  - Apache Tomcat 9.0
  - Oracle xe-11g
  - MyBatis
  - JUnit4
- etc.
  - Git/GitHub
  - JIRA

## 뉴스피드 구현
- REST API
- 최대한 간단하게 구현하려고 했다.
- 로그인 회원이 닉네임을 설정하여 익명으로 올릴 수 있다.
- 트위터 컨셉으로 수정은 불가하고 쓰기/삭제만 가능
- 무한 스크롤
  - 스크롤 이벤트는 데이터 양이 많이질 경우 성능 이슈 발생 + 구현이 상대적으로 까다롭다
  - IntersectionObserver API로 구현
  - target element가 노출되면 다음 데이터를 10개씩 불러오기로 했다.
  - 감시할 target을 어떤 포인트에서 지정해야하는지에 대해 혼란이 있었다.
  - 데이터를 추가할 때 마지막 element를 querySelector로 target 지정
- 아쉬운 점
  - 데이터가 적어 해당사항은 없었지만 성능 최적화를 생각도 못했다.
  - 스크롤을 내리고 삭제 혹은 이벤트 발생했을 때 마지막 위치로 이동하는 것 등 편의성을 고려하지 못했다.
  
## 전자결재 구현
- 많은 그룹웨어를 참고하여 최대한 많은 기능을 넣고자 했다.
- 전자결재 시스템 흐름에 신경을 많이 썼다.
- 상신하기
  - 결재 양식 등록/수정/삭제 -> 양식 선택 -> 결재 작성 -> 결재선 선택 (-> 첨부파일 등록) -> 상신 -> 상신 진행 문서
  - 상신취소 -> 재상신
  - 완료 문서 -> 결재 결과, 의견 확인
- 결재하기
  - 수신 미결재 문서 -> 의견등록 -> 승인/반려 -> 수신 결재 문서
- 메뉴
  - 결재 작성
  - 수신 - 결재/미결재
  - 상신 - 진행/완료/취소
  - 전체문서
- 기능
  - 양식 등록/수정/삭제
  - 휴가신청서/품의서/기안서 작성
  - 결재선 선택(검색)
  - 상신/상신취소/재상신
  - 결재 - 승인/반려/결재의견
  - 첨부파일, 페이징, 검색
- URL은 restful 하게 하고자 노력했다. <a href="https://docs.google.com/spreadsheets/d/1X3yuLrnNn8D2n9_usuCDFkAMnFWxT7KY1CsH5UMs3-Q/edit?usp=sharing" target="_blank">link</a>
- view에 대한 고민
  - 결재목록 + 내용 형식으로 겹치는 부분이 많아서 하나하나 view를 만들어야할지, 아니면 하나의 view를 재사용해서 jsp 태그를 이용하여 해도 되는지에 많은 고민을 했다.
  - view가 너무 많아지면 수정할 때 힘들 것 같아 일단 하나의 view로 넣을 수 있는 것을 다 넣었다.
- DB와 VO에 대한 고민
  - 사원 테이블, 부서 테이블, 직급 테이블을 모두 나눠서 설계를 하여 해당 정보가 필요할 때 join이 많이 발생했다.
  - 데이터의 무결성을 생각하면 전자결재 테이블에 모든 정보를 넣을 수는 없다고 생각했다.
  - VO가 너무 비대해졌다. 조인을 할 때마다 VO를 생성할 수 없어서 전자결재 VO에 모두 때려넣었다.
  - 메모리 낭비, VO의 역할에 대해 고민했지만 VO와 DTO에 대한 이해가 부족했다.
- 아쉬운 점
  - 기술적인 고민이 부족했던 점
  - 배운 것을 최대한 활용했지만 새로운 기술을 적용하지 못한 점
  
