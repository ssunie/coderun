package com.coderun.jsp.mentor.model.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.coderun.jsp.member.model.dto.MemberDTO;

public class MentorDTO {

	private String memberId;
	private MemberDTO member;
	private String nickname;
	private String introduce;
	private String language;
	
	public MentorDTO() {}

	public MentorDTO(String memberId, MemberDTO member, String nickname, String introduce, String language) {
		super();
		this.memberId = memberId;
		this.member = member;
		this.nickname = nickname;
		this.introduce = introduce;
		this.language = language;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public MemberDTO getMember() {
		return member;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "MentorDTO [memberId=" + memberId + ", member=" + member + ", nickname=" + nickname + ", introduce="
				+ introduce + ", language=" + language + "]";
	}
}
