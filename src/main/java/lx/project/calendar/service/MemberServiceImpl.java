package lx.project.calendar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.project.calendar.dao.MemberDAO;
import lx.project.calendar.to.MemberTO;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memdao;
	
	public int loginCheck(String userId, String password) {
		MemberTO member = memdao.loginCheck(userId, password);
		
		if (member != null) {
			int memberId = member.getMemberId();
			return memberId;
        } else {
        	System.out.println("입력이 올바르지 않습니다");
        	return 0;
        }
	}

	public MemberTO selectOne(int memberId) {
		return memdao.selectOne(memberId);
	}
	
	public MemberTO updateMember(MemberTO member) {
		int upval = memdao.updateMember(member);
		int memberId = member.getMemberId();
		MemberTO memberlist = memdao.selectOne(memberId);
		if(upval == 1) {
			return memberlist;
		} else {
			return null;
		}
	}
		
		
		
		
	
}
