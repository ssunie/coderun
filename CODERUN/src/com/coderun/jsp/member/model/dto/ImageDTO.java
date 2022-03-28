package com.coderun.jsp.member.model.dto;

public class ImageDTO implements java.io.Serializable{
	
	private int no;
	private String origin;
	private String edit;
	private String root;
	private String memberId;

	public ImageDTO() {}

	public ImageDTO(int no, String origin, String edit, String root, String memberId) {
		super();
		this.no = no;
		this.origin = origin;
		this.edit = edit;
		this.root = root;
		this.memberId = memberId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ImageDTO [no=" + no + ", origin=" + origin + ", edit=" + edit + ", root=" + root + ", memberId="
				+ memberId + "]";
	}
}