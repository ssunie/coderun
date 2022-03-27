package com.coderun.jsp.admin.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.admin.model.dto.RequestDTO;

public class RequestDAO {

	public static int insertRequest(SqlSession session, RequestDTO requestCall) {
		return session.insert("RequestDAO.insertRequest", requestCall);
	}

	
	
	
}
