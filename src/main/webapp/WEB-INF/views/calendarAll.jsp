<<<<<<< HEAD
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
	
	    <div class="sub-title-wrap">
        <div>전체일정</div>
    </div>

    <div class="inner">
        <!-- 상단 탭 -->
        <div class="pc-tab">
            <ul class="tab-ul01">
                <li class="active"><a href="${pageContext.request.contextPath}/calendarAll.do"><span>전체일정</span></a></li>
                <li><a href="${pageContext.request.contextPath}/calendarPolicy.do"><span>정부사업일정</span></a></li>
                <li><a href="${pageContext.request.contextPath}/calendarCertification.do"><span>자격증시험일정</span></a></li>
                <li><a href="${pageContext.request.contextPath}/calendarJob.do"><span>채용공고일정</span></a></li>
            </ul>
        </div>

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
            <!-- 왼쪽: 검색바 -->
            <div class="policy-left">
                <div>
                    <div class="policy-header-flex">
                        <h3>관심 목록 선택</h3>
                        <!-- 검색 기능 -->
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

            <!-- 오른쪽: 장바구니(내가 선택한 정책) 및 확정 버튼 -->
            <div class="policy-right">
                <div>
                    <div class="policy-header-flex">
                        <h3>내가 선택한 목록</h3>
                    </div>
                    <ul id="selected-policies">
                        <li class="empty-msg">선택된 목록이 없습니다. 왼쪽에서 체크해주세요.</li>
                    </ul>
                </div>
                <!-- 하단 파란색 버튼 영역 -->
                <button type="button" class="checkout-btn">선택한 목록 신청하기</button>
            </div>
        </div>

    </div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

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
                    { title: '전액 1차 등록기간', start: '2026-09-01', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '2학기 개강', start: '2026-09-01', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '2차 수강정정, 일반휴학, 조기졸업 신청', start: '2026-09-01', end: '2026-09-06', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '전액 2차 등록 기간', start: '2026-09-09', end: '2026-09-16', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '개교기념일(보강일: 12.10)', start: '2026-09-17', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '수강철회기간', start: '2026-09-22', end: '2026-09-24', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '추석 연휴(보강일:12.9, 12.11)', start: '2026-09-24', end: '2026-09-27', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '축제', start: '2026-09-29', end: '2026-10-02', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '학기시작 30일', start: '2026-09-30', color: '#ffe4e8', textColor: '#d63353' },
                    { title: '개천절(보강일: 12.14)', start: '2026-10-03', color: '#ffe4e8', textColor: '#d63353' },               
                    
                    { title: '[Q-Net] 2026년 정기 기사 3회 실기 원서접수', start: '2026-09-02', end: '2026-09-06', color: '#ffc107', textColor: '#000' },
                    { title: '제80회 한국사능력검정시험일', start: '2026-09-19', color: '#ffc107', textColor: '#000' },
                    { title: '[삼성전자] 2026 하반기 공채 서류접수', start: '2026-09-01', end: '2026-09-11', color: '#e4eeff', textColor: '#1e3a8a' },
                    { title: '[네이버] 신입/경력 온라인 코딩테스트', start: '2026-09-12', color: '#e4eeff', textColor: '#1e3a8a' },
                    { title: '[카카오] 2026 겨울 인턴십 서류접수', start: '2026-09-15', end: '2026-09-26', color: '#e4eeff', textColor: '#1e3a8a' }
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지 - 전체일정</title>

<!-- 1. FullCalendar v6 라이브러리 불러오기 -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/project.css"
	type="text/css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="sub-title-wrap">
		<div>전체일정</div>
	</div>

	<div class="inner">
		<!-- 상단 탭 -->
		<div class="pc-tab">
			<ul class="tab-ul01">
				<li class="active"><a
					href="${pageContext.request.contextPath}/calendarAll.do"><span>전체일정</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/calendarPolicy.do"><span>정부사업일정</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/calendarCertification.do"><span>자격증시험일정</span></a></li>
				<li><a href="${pageContext.request.contextPath}/calendarJob.do"><span>채용공고일정</span></a></li>
			</ul>
		</div>

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
		<form method="post"
			action="${pageContext.request.contextPath}/applyAll.do">
			<div class="policy-section">
				<!-- 왼쪽: 검색바 -->
				<div class="policy-left">
					<div>
						<div class="policy-header-flex">
							<h3>관심 목록 선택</h3>
							<div class="search-box-crappy">
								<input type="text" id="itemKeyword" placeholder="검색어 입력...">
								<button type="button" id="btnItemSearch">조회</button>
							</div>
						</div>
						<ul class="policy-list" id="policyList">
							<c:forEach var="e" items="${events}">
								<li><a href="#" title="${e.info}">${e.title}</a> <!-- name="items" 제거: 제출은 hidden input이 담당 -->
									<input type="checkbox" value="${e.allpcj}~${e.code}"
									data-label="${e.title}"></li>
							</c:forEach>
							<c:if test="${empty events}">
								<li class="empty-msg">등록된 일정이 없습니다.</li>
							</c:if>
							<div id="hiddenSelectedInputs" style="display:none;"></div>
						</ul>
					</div>
				</div>

				<!-- 오른쪽: 장바구니(내가 선택한 정책) 및 확정 버튼 -->
				<div class="policy-right">
					<div>
						<div class="policy-header-flex">
							<h3>내가 선택한 목록</h3>
						</div>
						<ul id="selected-policies">
							<li class="empty-msg">선택된 목록이 없습니다. 왼쪽에서 체크해주세요.</li>
						</ul>
					</div>
					<!-- 하단 파란색 버튼 영역 -->
					<button type="submit" class="checkout-btn">선택한 목록 신청하기</button>
				</div>
			</div>
		</form>

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

                // DB에서 조회한 전체일정 (정책/자격증/채용) - allpcj 로 색 구분
                events: [
                    <c:forEach var="e" items="${events}" varStatus="st">
                    {
                        title: '${e.title}',
                        start: '${e.startDate}'
                        <c:if test="${not empty e.endDate}">, end: '${e.endDate}'</c:if>
                        , color: '${e.allpcj == "POLICY" ? "#ffe4e8" : (e.allpcj == "CERT" ? "#ffc107" : "#e4eeff")}'
                        , textColor: '${e.allpcj == "POLICY" ? "#d63353" : (e.allpcj == "CERT" ? "#000000" : "#1e3a8a")}'
                    }<c:if test="${!st.last}">,</c:if>
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
                    li.textContent = box.dataset.label || box.value;
>>>>>>> branch 'main' of https://github.com/DAADrarat/Project5.git
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

</body>
</html>