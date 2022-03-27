package com.coderun.jsp.admin.model.service;

import org.apache.ibatis.session.SqlSession;
import static com.coderun.jsp.common.mybatis.Template.getSqlSession;

import com.coderun.jsp.admin.model.dao.RequestDAO;
import com.coderun.jsp.admin.model.dto.RequestDTO;

public class RequestService {

	
	/* 강사 신청하면 TB_REQ에 요청 들어가는 메소드 */
	public int registRequest(RequestDTO requestCall) {
		
		SqlSession session = getSqlSession();
		int result = RequestDAO.insertRequest(session, requestCall);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
}
