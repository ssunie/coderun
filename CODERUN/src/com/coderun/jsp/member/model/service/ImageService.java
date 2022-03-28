package com.coderun.jsp.member.model.service;

import static com.coderun.jsp.common.mybatis.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.member.model.dao.ImageDAO;
import com.coderun.jsp.member.model.dto.ImageDTO;
import com.coderun.jsp.member.model.dto.MemberDTO;

public class ImageService {
	
	private final ImageDAO imageDAO;
	
	public ImageService() {
		imageDAO = new ImageDAO();
	}

	public String modifyProfile(ImageDTO profileImg) {
		
		SqlSession session = getSqlSession();
		
		String editName = imageDAO.checkProfile(session, profileImg);
		
		int result = 0;
		
		if(editName != null) {
			result = imageDAO.modifyProfile(session, profileImg);
		} else {
			result = imageDAO.insertProfile(session, profileImg);
			editName = "new";
		}
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return editName;
	}

}
