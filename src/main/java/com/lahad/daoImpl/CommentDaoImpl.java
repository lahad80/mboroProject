package com.lahad.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.lahad.DAO.CommentDAO;
import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;
import com.lahad.singleton.HibernateUtil;

public class CommentDaoImpl implements CommentDAO {

	@Autowired
	Comment comment;
	//private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	public Comment getComment(int id){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			comment = (Comment)session.get(Comment.class, id);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		return comment;
	}

	public Comment getComment(String commentDate, Subject subject, User user){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			int userId = user.getId();
			int subjectId = subject.getId(); 
			
			List list = session.createQuery("FROM Comment WHERE commentDate =:commentDate AND subjectId =:subjectId AND userId =:userId")
				.setParameter("commentDate", commentDate)
				.setParameter("subjectId", subjectId)
				.setParameter("userId", userId).list();
			Iterator <Comment>it = list.iterator();
			
			ArrayList<Comment> arrayList = new ArrayList<Comment>();
			while(it.hasNext()){
				arrayList.add(it.next());
			}
			comment=arrayList.get(0);
		
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		return comment;
	}
	
	public void addComment(String commentDate, String text, Subject subject, User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Comment comment = new Comment(commentDate, text, subject, user);	
		try{
			tx = session.beginTransaction();
			session.save(comment);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public void modifyComment(int id, String text) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Comment comment;	
		try{
			tx = session.beginTransaction();
			comment = (Comment)session.get(Comment.class, id);
			comment.setText(text);
			session.save(comment);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		
	}

	public void deleteComment(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Comment comment = null ;
		try{
			tx = session.beginTransaction();
			comment = session.get(Comment.class, id);
			if(comment != null){
				session.delete(comment);
				tx.commit();
			}
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}
}
