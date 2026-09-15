package lx.project.calendar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lx.project.calendar.to.JobAppHistoryTO;
import lx.project.calendar.to.ScheduleTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession session;
	

    public List<ScheduleTO> selectMyJobSchedule(int memberId) {
        return session.selectList("appHistory.selectMyJobSchedule", memberId);
    }

    
    public int insertJob(JobAppHistoryTO to) {
        return session.insert("appHistory.insertJob", to);
    }
}
