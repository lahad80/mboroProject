package com.lahad.beans;

public class MboroForEnglish {
	
	private int id;
	private int likesCount;
	
	public MboroForEnglish(){
		
	}
	public MboroForEnglish(int liskesCount){
		this.likesCount = liskesCount;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getLikesCount() {
		return this.likesCount;
	}

	public void setLikesCount(int likesCount) {
		this.likesCount = likesCount;
	}
}
