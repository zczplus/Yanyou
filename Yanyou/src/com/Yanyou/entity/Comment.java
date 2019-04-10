package com.Yanyou.entity;

public class Comment {

	private String id;
	private String content;
	private String author;
	private String date;
	private String postId;

	public Comment() {
		super();
	}

	public Comment(String id, String content, String author, String date, String postId) {
		super();
		this.id = id;
		this.content = content;
		this.author = author;
		this.date = date;
		this.postId = postId;
	}

	public Comment(String content, String author, String date, String postId) {
		super();
		this.content = content;
		this.author = author;
		this.date = date;
		this.postId = postId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
