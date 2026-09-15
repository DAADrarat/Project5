package lx.project.calendar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.project.calendar.dao.MemberDAO;
import lx.project.calendar.to.MemberTO;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memdao;
	
	public int loginCheck(String userId, String password) {
		MemberTO member = memdao.loginCheck(userId, password);
		int memberId = member.getMemberId();
		
		if (member != null) {
			return memberId;
        } else {
        	System.out.println("입력이 올바르지 않습니다");
        	return 0;
        }
	}

	public MemberTO selectOne(int memberId) {
		return memdao.selectOne(memberId);
	}
	
	public MemberTO updateMember(int memberId) {
		int upval = memdao.updateMember(memberId);
		MemberTO member = memdao.selectOne(memberId);
		if(upval == 1) {
			return member;
		} else {
			return null;
		}
	}
		
		
		
		
	
}
