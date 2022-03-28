package com.coderun.jsp.member.model.service;

import static com.coderun.jsp.common.mybatis.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.coderun.jsp.member.model.dao.MemberDAO;
import com.coderun.jsp.member.model.dto.MemberDTO;

public class MemberService {
	
	private final MemberDAO memberDAO;
	
	public MemberService() {
		memberDAO = new MemberDAO();
	}
	
	// 로그인
	public MemberDTO loginCheck(MemberDTO requestMember) {
		SqlSession session = getSqlSession();
		MemberDTO loginMember = null;
		
		String encPwd = memberDAO.selectEncryptedPwd(session, requestMember);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(requestMember.getPwd(), encPwd)) {
			loginMember = memberDAO.selectLoginMember(session, requestMember);
		}
		
		session.close();
		
		return loginMember;
	}

	public int memberIdCheck(String memberId) {
		SqlSession session = getSqlSession();
		
		int result = memberDAO.memberIdCheck(session, memberId);
		
		session.close();
		
		return result;
	}

	public int registMember(MemberDTO requestMember) {
		SqlSession session = getSqlSession();
		
		int result = memberDAO.insertMember(session, requestMember);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public String searchId(MemberDTO requestMember) {
		SqlSession session = getSqlSession();
		String searchMember = null;
		
		searchMember = memberDAO.searchId(session, requestMember);
		
		session.close();
		
		return searchMember;
	}
	
	public MemberDTO modifyMember(MemberDTO requestMember) {
		SqlSession session = getSqlSession();
		MemberDTO changedMemberInfo = null;
		
		int result = memberDAO.updateMember(session, requestMember);
		if(result > 0) {
			session.commit();
			changedMemberInfo = memberDAO.selectChangedMemberInfo(session, requestMember.getId());
		} else {
			session.rollback();
		}
		
		session.close();
		
		return changedMemberInfo;
	}

	public int searchPwdResult(MemberDTO requestMember) {
		SqlSession session = getSqlSession();
		int searchPwdResult = 0;
		
		searchPwdResult = memberDAO.searchPwdResult(session, requestMember);
		
		session.close();
		
		return searchPwdResult;
	}

	public int modifyPassword(MemberDTO requestMember, String memberPwd) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		String encPwd = memberDAO.selectEncryptedPwd(session, requestMember);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		System.out.println(passwordEncoder.matches(requestMember.getPwd(), encPwd));
		
		if(passwordEncoder.matches(requestMember.getPwd(), encPwd)) {
			requestMember.setPwd(memberPwd);
			result = memberDAO.updateMemberPassword(session, requestMember);
		}
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public int removeMember(String id) {
		SqlSession session = getSqlSession();
		
		int result = memberDAO.deleteMember(session, id);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public int searchPwd(MemberDTO requestMember, String changePwd) {
		SqlSession session = getSqlSession();
		int result = 0;
		
		requestMember.setPwd(changePwd);
		result = memberDAO.updateMemberPassword(session, requestMember);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	public int memberEmailCheck(String email) {
		SqlSession session = getSqlSession();
		
		int result = memberDAO.memberEmailCheck(session, email);
		
		session.close();
		
		return result;
	}
	
}
