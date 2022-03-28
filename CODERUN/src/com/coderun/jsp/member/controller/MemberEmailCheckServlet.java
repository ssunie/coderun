package com.coderun.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.coderun.jsp.member.model.service.MemberService;

@WebServlet("/member/emailCheck")
public class MemberEmailCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		System.out.println("email : " + email);
		
		MemberService memberService = new MemberService();
		int result = memberService.memberEmailCheck(email);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("fail");
		} else {
			out.print("success");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String checkCode = request.getParameter("checkCode");
		
		System.out.println("email : " + email);
		System.out.println("checkCode : " + checkCode);
		
		int result = 0;
		
		try {
			String mail_to = "<" + email + ">";
			String mail_from = "admin<rbsla1112@gmail.com>";
			String title = "CODERUN 이메일 인증";
			String contents = "인증 번호는 " + checkCode + "입니다.";
			
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
			
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("success");
		} else {
			out.print("fail");
		}
	}
}
