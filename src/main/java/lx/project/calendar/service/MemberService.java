package lx.project.calendar.service;

import lx.project.calendar.to.MemberTO;

public interface MemberService {
	
	public int loginCheck(String userId, String password);
	
	public MemberTO selectOne(int memberId);
	
	public MemberTO updateMember(MemberTO member);
	
}
