package com.coderun.jsp.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
		
		int searchPwdResult = memberService.searchPwdResult(requestMember);
		System.out.println(searchPwdResult);
		
		String changePwd = request.getParameter("memberPwd");
		String checkChangePwd = request.getParameter("checkPwd");
		
		System.out.println("changePwd : " + changePwd);
		System.out.println("바뀐 비밀번호 : " + checkChangePwd);
				
		// 비밀번호를 임시 비밀번호로 바꿔줌
		int result = new MemberService().searchPwd(requestMember, changePwd);
		
		if(result <= 0) {
			request.setAttribute("searchPwdResult", "fail");
			request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp").forward(request, response);
		}
		
		// 임시 비밀번호 메일로 전송해줌
		if(searchPwdResult == 1) {
			try {
				String mail_to = memberId + "<" + email + ">";
				String mail_from = "admin<rbsla1112@gmail.com>";
				String title = "CODERUN 임시 비밀번호 전송";
				String contents = "임시 비밀번호는 " + checkChangePwd + "입니다.";
				
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "465");
	            props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.socketFactory.port", "465");
	            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.socketFactory.fallback", "false");
	            props.put("mail.smtp.auth", "true");
				
				Authenticator auth = new SMTPAuthenticator();
				
				Session sess = Session.getDefaultInstance(props, auth);
				
				MimeMessage msg = new MimeMessage(sess);
				
				msg.setFrom(new InternetAddress(mail_from));
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
				msg.setSubject(title, "UTF-8");
				msg.setContent(contents, "text/html; charset=UTF-8");
				msg.setHeader("Content-type", "text/html; charset=UTF-8");
				
				Transport.send(msg);
				
				request.setAttribute("searchPwdResult", "success");
				request.getRequestDispatcher("/WEB-INF/views/member/searchPwd.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("searchPwdResult", "fail");
			request.getRequestDispatcher("/WEB-INF/views/member/searchPwd.jsp").forward(request, response);
		}
	}

}
