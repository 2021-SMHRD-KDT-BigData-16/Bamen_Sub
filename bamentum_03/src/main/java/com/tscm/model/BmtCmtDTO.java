package com.tscm.model;

public class BmtCmtDTO {
	private long c_idx;
	private long p_idx;
	private String c_content;
	private String c_date;
	private String u_email;
	
	BmtCmtDTO() {
		super();
	}

	public BmtCmtDTO(long c_idx, long p_idx, String c_content, String c_date, String u_email) {
		super();
		this.c_idx = c_idx;
		this.p_idx = p_idx;
		this.c_content = c_content;
		this.c_date = c_date;
		this.u_email = u_email;
	}

	public long getC_idx() {
		return c_idx;
	}

	public void setC_idx(long c_idx) {
		this.c_idx = c_idx;
	}

	public long getP_idx() {
		return p_idx;
	}

	public void setP_idx(long p_idx) {
		this.p_idx = p_idx;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
	
}
