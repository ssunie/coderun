package com.coderun.jsp.mentor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mentor/apply1")
public class MentorApply1Servlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "../WEB-INF/views/mentor/mentorApply1.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}
	
}
