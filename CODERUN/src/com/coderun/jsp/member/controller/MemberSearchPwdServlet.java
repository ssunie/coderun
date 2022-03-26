package com.coderun.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/searchPwd")
public class MemberSearchPwdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/searchPwd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		
		System.out.println("memberId : " + memberId);
		System.out.println("email : " + email);
		
		// 아이디랑 이메일이 존재하는지 확인
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(memberId);
		requestMember.setEmail(email);
		
		MemberService memberService = new MemberService();
		
		// 비밀번호를 임시 비밀번호로 바꿔줌
		// 임시 비밀번호 메일로 전송해줌
	}

}
