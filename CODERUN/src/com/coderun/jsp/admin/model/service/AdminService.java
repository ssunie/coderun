package com.coderun.jsp.admin.model.service;

import static com.coderun.jsp.common.mybatis.Template.getSqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.common.paging.Pagenation;
import com.coderun.jsp.common.paging.SelectCriteria;
import com.coderun.jsp.member.model.dao.MemberDAO;
import com.coderun.jsp.member.model.dto.MemberDTO;

public class AdminService {
	
	private final MemberDAO memberDAO;
	
	public AdminService() {
		
		memberDAO = new MemberDAO();
	}

//	public List<MemberDTO> selectAllEmp() {
//		
//		SqlSession session = getSqlSession();
//				
//		List<MemberDTO> memList = memberDAO.selectAllMember(session);
//
//		session.close();
//		
//		return memList;
//	}
	
	
	// 검색한 회원 목록 조회용 메소드
	public Map<String, Object> selectMemberList(int pageNo, Map<String, String> searchMap) {
		
		SqlSession session = getSqlSession();
		
		int totalCount = memberDAO.selectTotalCount(session, searchMap);
		System.out.println("totalMemberCount : " + totalCount);
		
		int limit = 10;
		
		int buttonAmount = 5;
		
		SelectCriteria selectCriteria = null;
		
		if(searchMap.get("searchCondition") != null && !"".equals(searchMap.get("searchCondition"))) {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount, searchMap.get("searchCondition"), searchMap.get("searchValue"));
		} else  {
			selectCriteria = Pagenation.getSelectCriteria(pageNo, totalCount, limit, buttonAmount);
		}
		
		System.out.println(selectCriteria);
		
		List<MemberDTO> memList = memberDAO.selectMemberList(session, selectCriteria);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("memList", memList);
		returnMap.put("selectCriteria", selectCriteria);
		
		session.close();
		
		return returnMap;
	}

	

}
