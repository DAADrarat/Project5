package lx.project.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lx.project.calendar.service.MemberService;
import lx.project.calendar.service.MyPageService;
import lx.project.calendar.to.MemberTO;
import lx.project.calendar.to.ScheduleTO;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@Autowired
	@Qualifier("MemberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("MypageServiceImpl")
	private MyPageService myPageService;
	
	@RequestMapping("/main.do")
	public String home() {
		return "main"; 
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public String logincheck(
						@RequestParam("userId") String userId,
						@RequestParam("password") String password,
						HttpServletRequest req) {
		//service에서 logincheck 메서드 호출(login 여부 확인)
		int logincheck = memberService.loginCheck(userId, password);
		if(logincheck > 0) {
			HttpSession session = req.getSession(true); // 기존 세션이 없으면 새로 생성
			//request 아이디와 비번 --> session에 저장
			session.setAttribute("userId", userId);
			session.setAttribute("password", password);
			//logincheck 결과 --> memberId로 session에 저장
			session.setAttribute("memberId", logincheck);
			return "main";
		}
		return "redirect:/login.do";
	}
	
	@RequestMapping("signUp.do")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	
	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session, Model model) {
	    Integer memberId = (Integer) session.getAttribute("memberId");
	    System.out.println(memberId);
	    if(memberId != null && memberId > 0) {
	    	model.addAttribute("events", myPageService.getMyJobSchedule(memberId)); // 객체 그대로
	    	return "myPage";
	    }
	    	return "redirect:/login.do";
	}

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
	
	@RequestMapping("/edit.do")
	public String edit(HttpSession session, HttpServletRequest req) {
		Integer memberId = (Integer) session.getAttribute("memberId");
		MemberTO member = memberService.selectOne(memberId);
		req.setAttribute("member", member);
		return "edit";
	}
	
	@RequestMapping(value = "/edit.do", method=RequestMethod.POST)
	public String editaction(HttpSession session, MemberTO member) {
		Integer memberId = (Integer) session.getAttribute("memberId");

		if (memberId == null || memberId == 0) {
			return "redirect:/login.do";
		}	
		// 세션의 memberId를 set하여 본인 계정이 수정되도록 보장
	    member.setMemberId(memberId);
	    
	    MemberTO newmember = memberService.updateMember(member);
	    
		if (newmember != null) {
			session.setAttribute("member", newmember);
			return "myPage";
		} else {
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "/applyJob.do", method = RequestMethod.POST)
	public String applyJob(@RequestParam(value = "jobPostingCodes", required = false) List<String> codes,
	                       HttpSession session) {
	    String memberId = (String) session.getAttribute("memberId");
	    if (memberId == null) return "redirect:/login.do";

	    myPageService.applyJobs(memberId, codes);
	    return "redirect:/myPage.do";
	}
}
