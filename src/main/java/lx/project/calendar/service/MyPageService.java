package lx.project.calendar.service;

import java.util.List;
import lx.project.calendar.to.ScheduleTO;

public interface MyPageService {

    // 내가 신청한 채용공고 일정 조회
    List<ScheduleTO> getMyJobSchedule(int memberId);

    // 선택한 공고들 신청 저장
    void applyJobs(String memberId, List<String> jobPostingCodes);
}