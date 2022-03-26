package com.coderun.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/searchId")
public class MemberSearchIdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/searchId.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		
		System.out.println("memberName : " + memberName);
		System.out.println("email : " + email);
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setName(memberName);
		requestMember.setEmail(email);
		
		MemberService memberService = new MemberService();
		
		String searchMember = memberService.searchId(requestMember);
		System.out.println(searchMember);
		
		if(searchMember != null) {
			request.setAttribute("searchId", searchMember);
			request.getRequestDispatcher("/WEB-INF/views/member/searchId.jsp").forward(request, response);
		} else {
			request.setAttribute("searchId", "failed");
			request.getRequestDispatcher("/WEB-INF/views/member/searchId.jsp").forward(request, response);
		}
	}

}
