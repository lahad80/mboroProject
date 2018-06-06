package com.lahad.daoImpl;

import java.util.ArrayList;

import java.util.LinkedList;
import java.util.List;
import java.util.TreeSet;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.lahad.DAO.SubjectDAO;
import com.lahad.beans.Comment;
import com.lahad.beans.Subject;
import com.lahad.beans.User;
import com.lahad.singleton.HibernateUtil;




public class SubjectDaoImpl implements SubjectDAO {
	

	@Autowired
	UserDaoImpl udi;
	@Autowired
	CommentDaoImpl cdi;
	//private  SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public Subject findSubject(int id) {
		
		Session session = sessionFactory.openSession();
		Subject subject = null;
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			subject = (Subject) session.get(Subject.class, id);
			Hibernate.initialize(subject.getRelatedComments());
			Hibernate.initialize(subject.getUser());
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		return subject ;
	}
	
	public List <Subject> listSubjects(){
		Session session = sessionFactory.openSession();
		List <Subject> subjectsList = new ArrayList<Subject>();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			subjectsList  = session.createQuery("FROM Subject").list();
			
			for(Subject sub: subjectsList){
				Hibernate.initialize(sub.getUser());   // to avoid hibernate lazyinitializationexception
				TreeSet<Comment> tree = new TreeSet<Comment>(sub.getRelatedComments());
				sub.setSortedComments(tree);
				Hibernate.initialize(sub.getSortedComments());
				for(Comment com: sub.getSortedComments()){
					Hibernate.initialize(com.getUser());
				}
			}

			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();                        
		}
	
		return subjectsList;
	}

	public void addSubject(String title, String description, User author){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			User user = udi.findUserById(author.getId());
			Subject subject = new Subject(title, description, user);
			tx = session.beginTransaction();
			session.save(subject);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		
	}
	
	public int countCommentsNumber (Subject subject){
		
		Session session = sessionFactory.openSession();
		Transaction tx  = null;
		List<Comment> list = new LinkedList<Comment>();
		try{
			tx = session.beginTransaction();		
			String hql = "FROM Comment WHERE subjectId = :theSubjectId";
			list = session.createQuery(hql).setParameter("theSubjectId", subject.getId()).list();
			tx.commit();
			
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();          
		}
		
		return list.size();
	}
	
	public void updateSubject(int id, String title, String description){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Subject subject = session.get(Subject.class, id);
			subject.setTitle(title);
			subject.setDescription(description);
			session.update(subject);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}

	public void delete(int id) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Subject subject ;
		try{
			tx = session.beginTransaction();
			 subject = session.get(Subject.class, id);
			session.delete(subject);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}
}
