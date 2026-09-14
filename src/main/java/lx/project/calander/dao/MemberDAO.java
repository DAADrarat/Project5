package lx.project.calander.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lx.project.calander.controller.MainController;
import lx.project.calendar.to.MemberTO;


@Component
public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	public MemberTO loginCheck(String userId, String password) {
		MemberTO member = new MemberTO();
		member.setUserId(userId);
		member.setPassword(password);
		return session.selectOne("login", member);
	}
	
	
	
	
}