package lx.project.calander.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lx.project.calander.service.MemberService;

@Controller
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
	public String login(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest req) {
		if(userId!=null && userId.equals(password)) {
			HttpSession session = req.getSession();
			session.setAttribute("userId", userId);
			return "redirect:/main.do";
		}
		return "redirect:/login.do";
	}
	
	@RequestMapping("signUp.do")
	public String signUp() {
		return "signUp";
	}
	
	
	@RequestMapping("myPage.do")
	public String myPage() {
		return "myPage";
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
}
