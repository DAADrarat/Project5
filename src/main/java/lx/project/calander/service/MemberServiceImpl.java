package lx.project.calander.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.project.calander.dao.MemberDAO;
import lx.project.calander.to.MemberTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memdao;
	
	public boolean loginCheck(String userId, String password) {
		MemberTO member = memdao.loginCheck(userId, password);
		
		if (member != null) {
			
			if (member.getUserId() == member.getPassword()) {
				return true;
			} else {
				System.out.println("아이디 혹은 비밀번호가 틀렸습니다");
				return false;
			}
			
        } else {
        	System.out.println("입력이 올바르지 않습니다");
        	return false;
        }
		
		
		
		
	}
	
}
