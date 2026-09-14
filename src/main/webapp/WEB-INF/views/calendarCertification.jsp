<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 자격증시험일정</title>

    <!-- 1. FullCalendar v6 라이브러리 불러오기 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project.css" type="text/css" />
   
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
    <div class="sub-title-wrap">
        <div>자격증시험일정</div>
    </div>

    <div class="inner">
        <!-- 상단 탭 -->
        <div class="pc-tab">
            <ul class="tab-ul01">
                <li><a href="${pageContext.request.contextPath}/calendarAll.do"><span>전체일정</span></a></li>
                <li><a href="${pageContext.request.contextPath}/calendarPolicy.do"><span>정부사업일정</span></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/calendarCertification.do"><span>자격증시험일정</span></a></li>
                <li><a href="${pageContext.request.contextPath}/calendarJob.do"><span>채용공고일정</span></a></li>
            </ul>
        </div>

        <!-- 달력 범례 -->
        <div class="board-calendar-tab">
            <div class="b-cal-cate-box">
                <ul>
                    <li class="b-bachelor" id="b-bachelor-1"><span>자격증일정</span></li>                    
                </ul>
            </div>
        </div>

        <div id="calendar"></div>

        <!-- 자격증 리스트 영역 -->
        <div class="policy-section">
            <div class="policy-left">
                <div>
                    <div class="policy-header-flex">
                        <h3>관심 자격증 선택</h3>
                        <div class="search-box-crappy">
                            <input type="text" placeholder="자격증 검색...">
                            <button type="button">조회</button>
                        </div>
                    </div>
                    <ul class="policy-list">
                        <li>
                            <a href="https://www.example.com/cert1" target="_blank">[Q-Net] 정기 기사 3회 실기</a>
                            <input type="checkbox" value="[Q-Net] 정기 기사 3회 실기">
                        </li>
                        <li>
                            <a href="https://www.example.com/cert2" target="_blank">제80회 한국사능력검정시험</a>
                            <input type="checkbox" value="제80회 한국사능력검정시험">
                        </li>
                        <li>
                            <a href="https://www.example.com/cert3" target="_blank">제512회 TOEIC 정기시험</a>
                            <input type="checkbox" value="제512회 TOEIC 정기시험">
                        </li>
                    </ul>
                </div>
            </div>

            <div class="policy-right">
                <div>
                    <div class="policy-header-flex">
                        <h3>내가 선택한 자격증</h3>
                    </div>
                    <ul id="selected-policies">
                        <li class="empty-msg">선택된 자격증이 없습니다. 왼쪽에서 체크해주세요.</li>
                    </ul>
                </div>
                <button type="button" class="checkout-btn">선택한 자격증 접수하기</button>
            </div>
        </div>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const calendarEl = document.getElementById('calendar');

            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                initialDate: '2026-09-01',
                locale: 'ko',
                
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },

                eventBackgroundColor: '#ffe4e8', 
                eventTextColor: '#d63353',       
                displayEventTime: false, 

                events: [
                    { title: '[Q-Net] 2026년 정기 기사 3회 실기 원서접수', start: '2026-09-02', end: '2026-09-06', color: '#ffc107', textColor: '#000' },
                    { title: '제80회 한국사능력검정시험일', start: '2026-09-19', color: '#ffc107', textColor: '#000' },
                    { title: '제512회 TOEIC 정기시험', start: '2026-09-27', color: '#ffc107', textColor: '#000' }
                ]
            });

            calendar.render();
        });

        const checkboxes = document.querySelectorAll('.policy-list input[type="checkbox"]');
        const selectedList = document.getElementById('selected-policies');

        function updateSelectedPolicies() {
            selectedList.innerHTML = '';
            let isChecked = false; 

            checkboxes.forEach(function(box) {
                if (box.checked) {
                    isChecked = true;
                    const li = document.createElement('li');
                    li.textContent = box.value;
                    selectedList.appendChild(li);
                }
            });

            if (!isChecked) {
                selectedList.innerHTML = '<li class="empty-msg">선택된 자격증이 없습니다. 왼쪽에서 체크해주세요.</li>';
            }
        }

        checkboxes.forEach(function(box) {
            box.addEventListener('change', updateSelectedPolicies);
        });
    </script>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>