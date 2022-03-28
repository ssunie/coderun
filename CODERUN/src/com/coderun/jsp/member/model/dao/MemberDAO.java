package com.coderun.jsp.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.coderun.jsp.common.paging.SelectCriteria;
import com.coderun.jsp.member.model.dto.MemberDTO;

public class MemberDAO {

	public String selectEncryptedPwd(SqlSession session, MemberDTO requestMember) {
		return session.selectOne("MemberDAO.selectEncryptedPwd", requestMember);
	}

	public MemberDTO selectLoginMember(SqlSession session, MemberDTO requestMember) {
		return session.selectOne("MemberDAO.selectLoginMember", requestMember);
	}

	public int memberIdCheck(SqlSession session, String memberId) {
		return session.selectOne("MemberDAO.memberIdCheck", memberId);
	}

	public int insertMember(SqlSession session, MemberDTO requestMember) {
		return session.insert("MemberDAO.insertMember", requestMember);
	}

	public String searchId(SqlSession session, MemberDTO requestMember) {
		return session.selectOne("MemberDAO.searchId", requestMember);
	}

	public int updateMember(SqlSession session, MemberDTO requestMember) {
		return session.update("MemberDAO.updateMember", requestMember);
	}

	public MemberDTO selectChangedMemberInfo(SqlSession session, String id) {
		return session.selectOne("MemberDAO.selectChangedMemberInfo", id);
	}

//	public List<MemberDTO> selectAllMember(SqlSession session) {
//
//		return session.selectList("MemberDAO.selectAllMemberList");
//	}

	public int selectTotalCount(SqlSession session, Map<String, String> searchMap) {
		
		return session.selectOne("MemberDAO.selectTotalCount", searchMap);
	}

	public List<MemberDTO> selectMemberList(SqlSession session, SelectCriteria selectCriteria) {
		
		return session.selectList("MemberDAO.selectMemberList", selectCriteria);
	}

	


}
