package com.tm.kr.member.model;

import java.util.Date;

public class Member {
	private int memberNum;
	private String userId;
	private String usrPwd;
	private String nickName;
	private String email;
	private String name;
	private Date birth;
	
	public Member() {}

	public Member(int memberNum, String userId, String usrPwd, String nickName, String email, String name, Date birth) {
		super();
		this.memberNum = memberNum;
		this.userId = userId;
		this.usrPwd = usrPwd;
		this.nickName = nickName;
		this.email = email;
		this.name = name;
		this.birth = birth;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsrPwd() {
		return usrPwd;
	}

	public void setUsrPwd(String usrPwd) {
		this.usrPwd = usrPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", userId=" + userId + ", usrPwd=" + usrPwd + ", nickName=" + nickName
				+ ", email=" + email + ", name=" + name + ", birth=" + birth + "]";
	}
	
}
