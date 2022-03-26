package com.coderun.jsp.mentor.model.service;

import org.apache.ibatis.session.SqlSession;


import com.coderun.jsp.mentor.model.dao.MentorDAO;
import com.coderun.jsp.mentor.model.dto.MentorDTO;

import static com.coderun.jsp.common.mybatis.Template.getSqlSession;

public class MentorService {
	
	private final MentorDAO mentorDAO;
	
	public MentorService() {
		mentorDAO = new MentorDAO();
	}
	
	/* 강사 신청용 메소드 */
	public int registMentor(MentorDTO requestMentor) {
		
		SqlSession session = getSqlSession();
		
		int result = mentorDAO.insertMentor(session, requestMentor);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
}
