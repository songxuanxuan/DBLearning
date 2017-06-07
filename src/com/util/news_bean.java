package com.util;

import java.util.Date;

public class news_bean {
	private int id;
	private String title;
	private String content;
	private Date add_time;
	private String upload_user;
	private int kinds;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public String getUpload_user() {
		return upload_user;
	}
	public void setUpload_user(String upload_user) {
		this.upload_user = upload_user;
	}
	public int getKinds() {
		return kinds;
	}
	public void setKinds(int kinds) {
		this.kinds =kinds ;
	}
	@Override
	public String toString() {
		String a=" id "+this.id+" title"+this.title+" content"+this.content+
				" uploadtime"+this.add_time+" adduser"+this.upload_user+" kind"+this.kinds;
		return a;
	}
	
	
	
	

}
