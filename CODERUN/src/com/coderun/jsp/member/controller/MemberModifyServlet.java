package com.coderun.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/modify")
public class MemberModifyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = ((MemberDTO)request.getSession().getAttribute("loginMember")).getId();
		String name = request.getParameter("memberName");
		String email = request.getParameter("email");
		java.sql.Date birthday = java.sql.Date.valueOf(request.getParameter("birthday"));
		String gender = request.getParameter("gender");
		
		MemberDTO requestMember = new MemberDTO();
		// id 설정 안 들어가 있었음
		requestMember.setId(id);
		requestMember.setName(name);
		requestMember.setEmail(email);
		requestMember.setBirthday(birthday);
		requestMember.setGender(gender);
		
		System.out.println("memberController requestMember : " + requestMember);
		
		MemberDTO changedMemberInfo = new MemberService().modifyMember(requestMember);
		
		System.out.println("memberController changedMemberInfo : " + changedMemberInfo);
		
		String page = "";
		
		if(changedMemberInfo != null) {
			request.getSession().setAttribute("loginMember", changedMemberInfo);
//			request.setAttribute("modifyResult", "success");
			request.setAttribute("successCode", "updateMember");
			request.getRequestDispatcher("/WEB-INF/views/common/success.jsp").forward(request, response);
		} else {
			page = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("modifyResult", "fail");
//			request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp").forward(request, response);
			request.setAttribute("message", "회원 비밀번호 수정 실패!");
		}
	}

}
