package com.lahad.DAO;

import java.util.List;
import java.util.TreeSet;

import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;

public interface SubjectDAO {

	public Subject findSubject(int id);
	public List<Subject> listSubjects();
	public void addSubject(String title, String description, User author);
	public void updateSubject(int id, String title, String description);
	public void delete(int id);
}
