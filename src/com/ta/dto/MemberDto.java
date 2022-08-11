package com.ta.dto;

public class MemberDto {
	private String name;
	private int point;
	private String id;
	private String pw;
	public MemberDto(String name, int point) {
		this.name = name;
		this.point = point;
	}
	public MemberDto(String name, int point, String id, String pw) {
		this.name = name;
		this.point = point;
		this.id = id;
		this.pw = pw;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
