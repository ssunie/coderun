package com.coderun.jsp.mentor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.mentor.model.dto.MentorDTO;
import com.coderun.jsp.mentor.model.service.MentorService;

@WebServlet("/mentor/apply2")
public class MentorApply2Servlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("../WEB-INF/views/mentor/mentorApply2.jsp").forward(request, response);
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = ((MemberDTO) request.getSession().getAttribute("loginMember")).getId();
		String nickname = request.getParameter("nickname");
		String introduce = request.getParameter("introduce");
		
		MentorDTO requestMentor = new MentorDTO();
		requestMentor.setMemberId(memberId);
		requestMentor.setNickname(nickname);
		requestMentor.setIntroduce(introduce);
		
		System.out.println("mentorController requestMentor : " + requestMentor);
		
		int result = new MentorService().registMentor(requestMentor);
		
		System.out.println("mentorController result : " + result);
		
		String page = "";
		
		if(result > 0) {
			page = "/WEB-INF/views/mentor/mentorApplySuccess.jsp";
		} else {
			page = "/WEB-INF/views/main/main.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}
	
}
