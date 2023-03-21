package com.tscm.model;

public class BmtPostDTO {
	private long postId;
	private long boardId;
	private String email;
	private String title;
	private String p_content;
	private String imgPath;
	
	public BmtPostDTO() {
		super();
	}
	
	public BmtPostDTO(long postId, long boardId, String email, String title, String p_content, String imgPath) {
		super();
		this.postId = postId;
		this.boardId = boardId;
		this.email = email;
		this.title = title;
		this.p_content = p_content;
		this.imgPath = imgPath;
	}

	public long getPostId() {
		return postId;
	}

	public void setPostId(long postId) {
		this.postId = postId;
	}

	public long getBoardId() {
		return boardId;
	}

	public void setBoardId(long boardId) {
		this.boardId = boardId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
	
}
