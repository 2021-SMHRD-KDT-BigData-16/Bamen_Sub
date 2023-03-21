package com.tscm.model;

public class MemberDTO {
	
	// 1. 필드
	// 	-> DTO를 설계할때는 테이블 단위로 설계!
	
	private String email;
	private String pw;
	private String tel;
	private String address;
	
	// 2. 메소드
	//  -> 기본 생성자, 모든 필드 값 받아서 초기화 하는 생성자.
	//	-> getter, setter 메소드
	
	public MemberDTO() {
	}
	
	public MemberDTO(String email, String pw, String tel, String address) {
		this.email = email;
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
