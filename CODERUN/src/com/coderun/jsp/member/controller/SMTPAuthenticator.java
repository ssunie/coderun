package com.coderun.jsp.member.controller;

import javax.mail.*;

public class SMTPAuthenticator extends Authenticator {
	public SMTPAuthenticator() {
		super();
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		String username = "rbsla1112@gmail.com";
		String password = "oixgxmequhtfuovd";
		return new PasswordAuthentication(username, password);
	}
}
