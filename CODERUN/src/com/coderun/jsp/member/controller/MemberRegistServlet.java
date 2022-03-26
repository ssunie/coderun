package com.coderun.jsp.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/regist")
public class MemberRegistServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/regist.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		Date birthday = Date.valueOf(request.getParameter("birthday"));
		String gender = request.getParameter("gender");
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(memberId);
		requestMember.setPwd(memberPwd);
		requestMember.setName(memberName);
		requestMember.setEmail(email);
		requestMember.setBirthday(birthday);
		requestMember.setGender(gender);
		
		System.out.println("memberController requestMember : " + requestMember);
		
		int result = new MemberService().registMember(requestMember);
		
		System.out.println("memberController result : " + result);
		
		String page = "";
		
		if(result > 0) {
			page = "/WEB-INF/views/member/registSuccess.jsp";
		} else {
			page = "/WEB-INF/views/main/main.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
