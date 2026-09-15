package lx.project.calendar.to;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@Builder
@NoArgsConstructor  
@AllArgsConstructor

public class JobAppHistoryTO {
	
	private String jobAppId;
	private String jobPostingCode;
<<<<<<< HEAD
	private String memberId;
=======
	private int memberId;
>>>>>>> branch 'main' of https://github.com/DAADrarat/Project5.git
	private LocalDate appDate;
	private String appStatus;
	
}

//JOB_APP_ID VARCHAR(200) NOT NULL,
//JOB_POSTING_CODE VARCHAR(200) NOT NULL,
//MEMBER_ID VARCHAR(200) NOT NULL,
//APP_DATE DATE,
//APP_STATUS CHAR(1),
//PRIMARY KEY (JOB_APP_ID)