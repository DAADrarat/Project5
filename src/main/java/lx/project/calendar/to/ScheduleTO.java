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
//세결과물을 통합
	public class ScheduleTO {
	    private String allpcj;      // POLICY / CERT / JOB
	    private String code;
	    private String title;
	    private LocalDate startDate;
<<<<<<< HEAD
=======
	    private LocalDate endDate;
>>>>>>> branch 'main' of https://github.com/DAADrarat/Project5.git
	    private String info;
}
