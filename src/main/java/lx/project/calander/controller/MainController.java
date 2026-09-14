package lx.project.calander.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lx.project.calander.service.MemberService;
import lx.project.calendar.to.ScheduleTO;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@RequestMapping("/main.do")
	public String home() {
		return "main"; 
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public String login(
						@RequestParam("userId") String userId,
						@RequestParam("password") String password,
						HttpServletRequest req,
						MemberService service) {
		//service에서 logincheck 메서드 호출
		boolean logincheck = service.loginCheck(userId, password);
		if(logincheck == true) {
			HttpSession session = req.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("password", password);
			System.out.println(session.getAttribute(userId));
			System.out.println(session.getAttribute(password));
			return "redirect:/main.do";
		}
		return "redirect:/login.do";
	}
	
	@RequestMapping("signUp.do")
	public String signUp() {
		return "signUp";
	}
	
	
	//@RequestMapping("/myPage.do")
	//public String myPage(HttpSession session, Model model) {
	//    String memberId = (String) session.getAttribute("memberId");

	//    List<ScheduleTO> events = jobDAO.selectMyJobSchedule(memberId);

	//    model.addAttribute("eventsJson", new Gson().toJson(events));
	//    return "myPage";
	//}
	
	@RequestMapping("calendarAll.do")
	public String calendarAll() {
		return "calendarAll";
	}
	
	@RequestMapping("/calendarPolicy.do")
	public String calendarPolicy() { 
		return "calendarPolicy";
	}

	@RequestMapping("/calendarCertification.do")
	public String calendarCertification() { 
		return "calendarCertification"; 
	}

	@RequestMapping("/calendarJob.do")
	public String calendarJob() { 
		return "calendarJob"; 
	}
	
	@RequestMapping(value="/applyJob.do", method=RequestMethod.POST)
    public String applyJob(@RequestParam(value="jobIds", required=false) List<String> jobIds,
                           HttpSession session) {
        session.setAttribute("myJobIds", jobIds);
        return "redirect:/myPage.do";
    }
}
