package com.coderun.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/modifyPassword")
public class MemberModifyPasswordServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginMember");
		String id = loginUser.getId();
		String checkPwd = request.getParameter("checkPwd");
		
		MemberDTO requestMember = new MemberDTO();
		requestMember.setId(id);
		requestMember.setPwd(checkPwd);
		
		String memberPwd = request.getParameter("memberPwd");
		
		int result = new MemberService().modifyPassword(requestMember, memberPwd);
				
		if(result > 0) {
			request.setAttribute("modifyPasswordResult", "success");
		} else {
			request.setAttribute("modifyPasswordResult", "fail");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp").forward(request, response);
	}

}
