package com.coderun.jsp.mentor.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.admin.model.dto.RequestDTO;
import com.coderun.jsp.admin.model.service.RequestService;
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
		
		
		
		/* requestDTO에 담을 날짜 형변환 */
		Date now = new Date();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		
		String sqlDate = formatter.format(now);
		/* java.sql.Date로 변환 */
		java.sql.Date reqDate = java.sql.Date.valueOf(sqlDate);
		System.out.println("sql.date로 변환 된 날짜 : " + sqlDate);
		
		/* requestDTO에 담기 */
		RequestDTO requestCall = new RequestDTO();
		requestCall.setMemberId(requestMentor.getMemberId());
		requestCall.setReqDate(reqDate);
		
		
		
		System.out.println("mentorController requestMentor : " + requestMentor);
		System.out.println("requestTableController request : " + requestCall);
		
		int result = new MentorService().registMentor(requestMentor);
		int requestResult = new RequestService().registRequest(requestCall);
		
		System.out.println("mentorController result : " + result);
		System.out.println("requestController result : " + requestResult);
		
		String page = "";
		
		if(result > 0 && requestResult > 0) {
			page = "/WEB-INF/views/mentor/mentorApplySuccess.jsp";
		} else {
			page = "/WEB-INF/views/main/main.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}
	
}
