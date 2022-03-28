package com.coderun.jsp.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.member.model.dto.ImageDTO;

public class ImageDAO {

	public String checkProfile(SqlSession session, ImageDTO profileImg) {
		return session.selectOne("ImageDAO.checkProfile", profileImg);
	}
	
	public int modifyProfile(SqlSession session, ImageDTO profileImg) {
		return session.update("ImageDAO.updateProfile", profileImg);
	}


	public int insertProfile(SqlSession session, ImageDTO profileImg) {
		return session.insert("ImageDAO.insertProfile", profileImg);
	}


}
