package com.tscm.model;

public class BmtUserDTO {
	private String email;
	private String pw;
	private String u_name;
	private String profileimg;
	private String profiletext;

	public BmtUserDTO() {
		super();
	}
	
	public BmtUserDTO(String email, String pw, String u_name, String profileimg, String profiletext) {
		super();
		this.email = email;
		this.pw = pw;
		this.u_name = u_name;
		this.profileimg = profileimg;
		this.profiletext = profiletext;
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

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getProfileimg() {
		return profileimg;
	}

	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}

	public String getProfiletext() {
		return profiletext;
	}

	public void setProfiletext(String profiletext) {
		this.profiletext = profiletext;
	}
	
	
	
}
