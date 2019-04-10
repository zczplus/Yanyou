package com.Yanyou.entity;

import java.util.ArrayList;

public class Post {
	private String id;
	private String title;
	private String content;
	private String date;
	private String author;
	private ArrayList comment;
	
	public Post() {
		super();
	}

	public Post(String id, String title, String content, String date, String author) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.author = author;
	}

	public Post(String title, String content, String date, String author) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
		this.author = author;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ArrayList getComment() {
		return comment;
	}

	public void setComment(ArrayList comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + ", author=" + author
				+ "]";
	}

}
