package com.lahad.beans;


import java.util.Set;
import java.util.TreeSet;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Subject {


	private int id;
	@NotEmpty(message = "Please enter a title")
	private String title;
	@NotEmpty(message = "Please enter a description")
	private String description;

	@JsonIgnore
	private User user;  // the user writer of the subject

	@JsonIgnore
	private Set<Comment> relatedComments  ;

	@JsonIgnore
	private TreeSet<Comment> sortedComments;

	public Subject(){

	}
	public Subject(String title, String description, User user){
		this.title = title;
		this.description = description;
		this.user = user;
	}

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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Set<Comment> getRelatedComments() {
		return relatedComments;
	}
	public void setRelatedComments(Set<Comment> relatedComments) {
		this.relatedComments = relatedComments;
	}

	public TreeSet<Comment> getSortedComments() {
		return sortedComments;
	}
	public void setSortedComments(TreeSet<Comment> sortedComments) {
		this.sortedComments = sortedComments;
	}

}
