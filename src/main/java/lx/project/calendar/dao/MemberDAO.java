package lx.project.calendar.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lx.project.calendar.controller.MainController;
import lx.project.calendar.to.MemberTO;


@Component
public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	//로그인여부 확인
	public MemberTO loginCheck(String userId, String password) {
		MemberTO member = new MemberTO();
		member.setUserId(userId);
		member.setPassword(password);
		return session.selectOne("login", member);
	}
	
	public MemberTO selectOne(int memberId) {
		return session.selectOne("selectOne", memberId);
	}
	
	//회원정보 수정
	public int updateMember(MemberTO member) {
		int result = session.update("update", member);
		return result;
	}

	
	
}