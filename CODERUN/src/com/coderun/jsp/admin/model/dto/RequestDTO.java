package com.coderun.jsp.admin.model.dto;

import java.sql.Date;

import com.coderun.jsp.member.model.dto.MemberDTO;

public class RequestDTO {

	private int reqNo;
	private String approveStatus;
	private Date reqDate;
	private String memberId;
	private MemberDTO member;
	
	public RequestDTO() {}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}

	public String getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "RequestDTO [reqNo=" + reqNo + ", approveStatus=" + approveStatus + ", reqDate=" + reqDate
				+ ", memberId=" + memberId + "]";
	}
	
	
	
	
	
}
