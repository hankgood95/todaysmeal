package com.tm.kr.admin.notice.model;

import java.util.Date;

public class Notice {
	private int notice_num;
	private String title;
	private String content;
	private Date date;
	private int member_num;
	
	public Notice() {}
	
	public Notice(int notice_num, String title, String content, Date date, int member_num) {
		super();
		this.notice_num = notice_num;
		this.title = title;
		this.content = content;
		this.date = date;
		this.member_num = member_num;
	}

	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", title=" + title + ", content=" + content + ", date=" + date
				+ ", member_num=" + member_num + "]";
	}
}
