package com.coderun.jsp.mentor.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.mentor.model.dto.MentorDTO;

public class MentorDAO {

	public int insertMentor(SqlSession session, MentorDTO requestMentor) {
		return session.insert("MentorDAO.insertMentor", requestMentor);
	}
	
}
