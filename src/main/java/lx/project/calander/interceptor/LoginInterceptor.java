package lx.project.calander.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


// Controller가 실행되기 전에 사용자가 로그인했는지 확인하기
public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	//preHandle()은 Controller가 실행되기 전에 호출
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println("session userId=" + userId);
		if(userId!=null && userId.length()>0) {
			return true;
		}
		return false;
	}
	
	
}
