package com.coderun.jsp.member.model.dto;

import java.sql.Date;

public class MemberDTO {

	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date birthday;
	private String gender;
	private String type;
	private String freepassYn;
	
	public MemberDTO() {}

	public MemberDTO(String id, String pwd, String name, String email, Date birthday, String gender, String type,
			String freepassYn) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birthday = birthday;
		this.gender = gender;
		this.type = type;
		this.freepassYn = freepassYn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFreepassYn() {
		return freepassYn;
	}

	public void setFreepassYn(String freepassYn) {
		this.freepassYn = freepassYn;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birthday=" + birthday
				+ ", gender=" + gender + ", type=" + type + ", freepassYn=" + freepassYn + "]";
	}

}
