<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 전체일정</title>

    <!-- 1. FullCalendar v6 라이브러리 불러오기 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project.css" type="text/css" />
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/side.jsp" />

    <div class="sub-title-wrap">
        <div>마이페이지</div>
    </div>

    <div class="inner">       

        <!-- 달력 범례 -->
        <div class="board-calendar-tab">
            <div class="b-cal-cate-box">
                <ul>
                    <li id="b-policy"><span>정부사업일정</span></li>
                    <li id="b-cert"><span>자격증일정</span></li>
                    <li id="b-job"><span>채용공고일정</span></li>
                </ul>
            </div>
        </div>

        <!-- 캘린더 영역 -->
        <div id="calendar"></div>

        <!-- 정책 리스트 영역 -->
        <div class="policy-section">
            <!-- 왼쪽: 관심 정책 선택 및 짜친 검색바 -->
            <div class="policy-left">
                <div>
                    <div class="policy-header-flex">
                        <h3>관심 정책 선택</h3>
                        <!-- 노란색 형관펜 자리에 들어간 짜친 검색 기능 -->
                        <div class="search-box-crappy">
                            <input type="text" placeholder="검색어 입력...">
                            <button type="button">조회</button>
                        </div>
                    </div>
                    <ul class="policy-list">
                        <li>
                            <a href="https://www.example.com/1" target="_blank">정책 1 (청년도약계좌)</a>
                            <input type="checkbox" value="정책 1 (청년도약계좌)">
                        </li>
                        <li>
                            <a href="https://www.example.com/2" target="_blank">정책 2 (국민취업지원제도)</a>
                            <input type="checkbox" value="정책 2 (국민취업지원제도)">
                        </li>
                        <li>
                            <a href="https://www.example.com/3" target="_blank">정책 3 (내일채움공제)</a>
                            <input type="checkbox" value="정책 3 (내일채움공제)">
                        </li>
                        <li>
                            <a href="https://www.example.com/4" target="_blank">정책 4 (청년월세지원)</a>
                            <input type="checkbox" value="정책 4 (청년월세지원)">
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 오른쪽: 장바구니(내가 선택한 정책) 및 구매 확정 버튼 -->
            <div class="policy-right">
                <div>
                    <div class="policy-header-flex">
                        <h3>내가 선택한 목록</h3>
                    </div>
                    <ul id="selected-policies">
                        <li class="empty-msg">선택된 목록이 없습니다. 왼쪽에서 체크해주세요.</li>
                    </ul>
                </div>
                <!-- 하단 파란색 구매(확정) 버튼 느낌의 영역 -->
                <button type="button" class="checkout-btn">선택한 목록 신청하기</button>
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

                displayEventTime: false, 

                events: [
                    <c:forEach var="e" items="${events}" varStatus="st">
                    { title: '${e.title}', start: '${e.startDate}' }
                    <c:if test="${!st.last}">,</c:if>
                	</c:forEach>
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
                selectedList.innerHTML = '<li class="empty-msg">선택된 정책이 없습니다. 왼쪽에서 체크해주세요.</li>';
            }
        }

        checkboxes.forEach(function(box) {
            box.addEventListener('change', updateSelectedPolicies);
        });
    </script>
    
    <jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>