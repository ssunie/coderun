package com.coderun.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/remove")
public class MemberRemoveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO loginMember = (MemberDTO)request.getSession().getAttribute("loginMember");
		
		String id = loginMember.getId();
		
		int result = new MemberService().removeMember(id);
		
		if(result > 0) {
			request.getSession().invalidate();
			request.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "fail");
			request.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(request, response);
		}
	}

}
