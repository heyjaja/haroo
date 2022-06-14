<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet'/>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <!--kakao map -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b89e623fa5a7450da9e317c87329cb31&libraries=services"></script>
    <link rel="stylesheet" href="/resources/css/kakao-map.css"/>

    <style>
        /* body 스타일 */
        html, body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
        .fc-sat { color:blue; }
        .fc-sun { color:red;  }
    </style>
</head>
<body style="padding:30px;">
<!--공통 header-->
<header class="p-1 bg-light">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-start">
            <a href="/haroo" class="d-flex align-items-center mb-2 mb-lg-0 text-secondary text-decoration-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                     class="bi bi-cloud-fill" viewBox="0 0 16 16">
                    <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link px-2 text-secondary dropdown-toggle" href="#" id="dropdown01"
                       data-bs-toggle="dropdown" aria-expanded="false">haroo</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown01">
                        <li><a class="dropdown-item" href="#">인사정보</a></li>
                        <li><a class="dropdown-item" href="#">근태관리</a></li>
                        <li><a class="dropdown-item" href="#">캘린더</a></li>
                        <li><a class="dropdown-item" href="#">게시판</a></li>
                        <li><a class="dropdown-item" href="#">설문조사</a></li>
                        <li><a class="dropdown-item" href="#">전자결재</a></li>
                        <li><a class="dropdown-item" href="#">채팅</a></li>
                    </ul>
                </li>
            </ul>
            <div class="text-end">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li class="nav-item"><a class="nav-link link-secondary">${employee.em_name}님 환영합니다 :)</a></li>
                    <li class="nav-item">
                        <a class="nav-link link-secondary" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                                <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                            </svg>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link-secondary" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-heart" viewBox="0 0 16 16">
                                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                            </svg>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link-secondary" href="/haroo/mypage">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            </svg>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<nav>
    <ul class="nav justify-content-center alert-info" style="padding-top: 15px;">
        <li class="nav-item"><a class="nav-link link-dark text-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-smile"
                 viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
            </svg>
            <p>인사정보</p></a></li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-briefcase"
                 viewBox="0 0 16 16">
                <path d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z"/>
            </svg>
            <p>근태관리</p></a></li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="/haroo/task">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                 class="bi bi-calendar4-event" viewBox="0 0 16 16">
                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
                <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
            </svg>
            <p>캘린더</p></a>
        </li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="/haroo/board/listAction.do">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                 class="bi bi-layout-text-window-reverse" viewBox="0 0 16 16">
                <path d="M13 6.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm0 3a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5z"/>
                <path d="M14 0a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12zM2 1a1 1 0 0 0-1 1v1h14V2a1 1 0 0 0-1-1H2zM1 4v10a1 1 0 0 0 1 1h2V4H1zm4 0v11h9a1 1 0 0 0 1-1V4H5z"/>
            </svg>
            <p>게시판</p></a></li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bar-chart"
                 viewBox="0 0 16 16">
                <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
            </svg>
            <p>설문조사</p></a></li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="/haroo/ap/main">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                 class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
            </svg>
            <p>전자결재</p></a></li>
        <li class="nav-item"><a class="nav-link link-dark text-center" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots"
                 viewBox="0 0 16 16">
                <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
            </svg>
            <p>채팅</p></a>
        </li>
    </ul>
</nav>

<!--일정 추가 Modal -->
<div id="bookingModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" style="width:80%;height:100%;border-radius:0;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">일정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                일정 명 : <input type="text" class="form-control" id="title" value=""><br>
                일정 내용 : <input type="text" class="form-control" id="content" value=""><br>
                <input type="button" id="markBtn" onclick="showMarker()" value="저장 위치 표시"><br>
                일정 장소 :
                <div class="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:center;overflow:hidden;"></div>
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div>
                                <form onsubmit="searchPlaces(); return false;">
                                    키워드 : <input type="text" value="구일역" id="keyword" size="15">
                                    <button type="submit">검색하기</button>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="addBtn" class="btn btn-primary">추가하기</button>
                    <!--없는 일정 클릭시 수정하기 안 보이기-->
                    <button type="button" id="modBtn" class="btn btn-primary">수정하기</button>
                    <!--없는 일정 클릭시 삭제하기 안 보이기-->
                    <button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 확인창 Modal -->
<div id="checkModal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Check Status</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>완료되었습니다 :)</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeCheckModal" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<!-- calendar 태그 -->
<div id='calendar-container'>
    <div id='calendar'></div>
</div>
<script>
    var myLat = 33.450701;
    var myLng = 126.570667;

    document.addEventListener('DOMContentLoaded', function () {
        let calendarEl = document.getElementById('calendar'); // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
        let calendar = new FullCalendar.Calendar(calendarEl, {
            contentHeight: 600,
            expandRows: true, // 화면에 맞게 높이 재설정
            locale: 'ko',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectMirror: true, // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..

            //없는 일정 부를 때
            select: function (arg) {
                //모달 띄우기
                $('#bookingModal').modal('toggle');

                //내용 비우기
                $('input[id=title]').attr("value", "");
                $('input[id=content]').attr("value", "");

                //버튼 할당 방식
                $('#addBtn').show();
                $('#modBtn').hide();
                $('#delBtn').hide();
                $('#markBtn').hide();

                myLat = 33.450701;
                myLng = 126.570667;

                console.log("위도 : " + myLat + " 경도 : " + myLng);

                map.relayout();

                //추가하기 버튼을 눌렀을 시
                $('#addBtn').off().on('click', function () {
                    let title = $('#title').val();
                    let content = $('#content').val();

                    if (title) {
                        //달력 출력
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            backgroundColor: "#B464EB",
                            textColor: "#000000"
                        })
                        //일정 추가[DB에 저장]
                        //하루면 YYYY/MM/DD hh:mm
                        //이틀 이상이면 YYYY/MM/DD
                        let start, end;
                        if (arg.allDay) { // 이틀 이상
                            start = moment(arg.start).format('YYYY/MM/DD');
                            end = moment(arg.end).format('YYYY/MM/DD');
                        } else {
                            start = moment(arg.start).format('YYYY/MM/DD hh:mm');
                            end = moment(arg.end).format('YYYY/MM/DD hh:mm');
                        }

                        let data = {
                            "title": title,
                            "start": start,
                            "end": end,
                            "allDay": arg.allDay,
                            "content": content,
                            "backgroundColor": "#B464EB",
                            "textColor": "#000000",
                            "writer": '${employee.em_name}',
                            "emNo": '${employee.em_no}',
                            "location": $('#keyword').val(),
                            "latitude": (latlng.getLat()).toString(),
                            "longitude": (latlng.getLng()).toString()
                        };

                        $.ajax({
                            url: '/haroo/task/new',
                            method: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            data: JSON.stringify(data),
                            success: function (result) {
                                if (result === "success") {
                                    $('#checkModal').modal('show');
                                }
                            },
                            error: function (error) {
                                console.log(error);
                            }
                        })

                    } else {
                        alert('일정 명을 입력해주세요.');
                        return;
                    }
                    $('#bookingModal').modal('hide');
                })
                calendar.unselect();
            },

            // 있는 일정 클릭시, 수정, 삭제
            eventClick: function (arg) {
                $('#bookingModal').modal('toggle');

                $('input[id=title]').attr("value", arg.event.title);
                $('input[id=content]').attr("value", arg.event.extendedProps.content);

                //화면 버튼 활성화
                $('#addBtn').hide();
                $('#modBtn').show();
                $('#delBtn').show();
                $('#markBtn').show();

                //검색어 넣기
                $('input[id=keyword]').attr('value',arg.event.extendedProps.location);

                //위도, 경도 재설정
                myLat = parseFloat(arg.event.extendedProps.latitude);
                myLng = parseFloat(arg.event.extendedProps.longitude);

                console.log("위도 : " + myLat + " 경도 : " + myLng);

                map.relayout();

                //일정 id 가져오기
                let id = arg.event.id;

                //수정 버튼 클릭시
                $('#modBtn').off().on('click', function () {
                    let title = $('#title').val();
                    let content = $('#content').val();

                    if (title) {
                        //달력 출력
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            backgroundColor: "#B464EB",
                            textColor: "#000000"
                        })
                        //일정 추가[DB에 저장]
                        //하루면 YYYY/MM/DD hh:mm
                        //이틀 이상이면 YYYY/MM/DD

                        let data = {
                            "id": id,
                            "title": title,
                            "content": content,
                            "location": $('#keyword').val(),
                            "latitude": (latlng.getLat()).toString(),
                            "longitude": (latlng.getLng()).toString()
                        };

                        $.ajax({
                            url: '/haroo/task',
                            method: 'PATCH',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            data: JSON.stringify(data),
                            success: function (result) {
                                if (result === "success") {
                                    $('#checkModal').modal('show');
                                    setTimeout(function () {
                                        location.reload();
                                    }, 500);
                                }
                            },
                            error: function (error) {
                                console.log(error);
                            }
                        })
                    }
                    $('#bookingModal').modal('hide');
                });

                //삭제 버튼 클릭시
                $('#delBtn').off().on('click', function () {
                    if (id) {
                        //달력 출력
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            backgroundColor: "#B464EB",
                            textColor: "#000000"
                        })

                        let data = {
                            "id": id
                        };

                        $.ajax({
                            url: '/haroo/task/' + id,
                            method: 'DELETE',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            data: JSON.stringify(data),
                            success: function (result) {
                                if (result === "success") {
                                    $('#checkModal').modal('show');
                                    setTimeout(function () {
                                        location.reload();
                                    }, 500);
                                }
                            },
                            error: function (error) {
                                console.log(error);
                            }
                        })
                    }
                    $('#bookingModal').modal('hide');
                });
                calendar.unselect();
            },

            editable: true,
            dayMaxEvents: true, // allow "more" link when too many events

            //일정들을 json으로 받는다.
            events: ${json}
        });

        calendar.render();
    });
</script>

<!--kakao map js-->
<script>
    // 마커를 담을 배열입니다
    var markers = [];

    //위도 경도 표현
    var latlng;

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.539922, 127.070609), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    var myPosition = new kakao.maps.LatLng(myLat, myLng);

    var marker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: myPosition
    });

    // 지도에 마커를 표시합니다
    marker.setMap(map);

    function showMarker() {
        marker.setMap(null);
        map.setLevel(3);

        myPosition = new kakao.maps.LatLng(myLat, myLng);

        marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다
            position: myPosition
        });

        // 지도에 마커를 표시합니다
        marker.setMap(map);
        panTo(myPosition);
    }

    function panTo(myPosition) {
        // 이동할 위도 경도 위치를 생성합니다
        // var moveLatLon = new kakao.maps.LatLng(myLat, myLng);

        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(myPosition);
    }


    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

        // 클릭한 위도, 경도 정보를 가져옵니다
        latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';

        console.log(message);
    });



    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex: 1});


    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function () {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                itemEl.onmouseover = function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout = function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' + places.address_name + '</span>';
        } else {
            itemStr += '    <span>' + places.address_name + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }
</script>
</body>
</html>