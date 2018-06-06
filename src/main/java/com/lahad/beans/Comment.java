package com.lahad.beans;


import com.fasterxml.jackson.annotation.JsonIgnore;


public class Comment implements Comparable<Comment> {
	
	private int id;
	private String commentDate;
	private String text;
	@JsonIgnore
	private Subject subject; // the subject the comment relates to 
	@JsonIgnore
	private User user;      // the user posting the comment
	
	
	public Comment(){
		
	}
	public Comment(String commentDate, String text, Subject subject, User user){
		this.commentDate = commentDate;
		this.text = text;
		this.subject = subject;
		this.user = user;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public int compareTo(Comment c) {
		// TODO Auto-generated method stub
		int comp = this.commentDate.compareTo(c.commentDate);
		return comp;
	}
}
