package lx.project.calendar.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.project.calendar.dao.MyPageDAO;
import lx.project.calendar.to.JobAppHistoryTO;
import lx.project.calendar.to.ScheduleTO;

@Service("MypageServiceImpl")
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    MyPageDAO myPageDAO;

    @Override
    public List<ScheduleTO> getMyJobSchedule(int memberId) {
        return myPageDAO.selectMyJobSchedule(memberId);
    }

    @Override
    public void applyJobs(String memberId, List<String> codes) {
        if (codes == null) return;

        for (String code : codes) {
            JobAppHistoryTO to = JobAppHistoryTO.builder()
                    .jobAppId(UUID.randomUUID().toString())
                    .jobPostingCode(code)
                    .memberId(memberId)
                    .build();
            myPageDAO.insertJob(to);
        }
    }
}