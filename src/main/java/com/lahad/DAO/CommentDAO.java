package com.lahad.DAO;



import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;

public interface CommentDAO {
	
	public Comment getComment(int id);
	public Comment getComment(String date, Subject subject, User user);
	public void addComment(String commentDate, String text, Subject subject, User user);
	public void modifyComment(int id, String text);
	public void deleteComment(int id);	
}
