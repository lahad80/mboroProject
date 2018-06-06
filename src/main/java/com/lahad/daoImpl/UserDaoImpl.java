package com.lahad.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.lahad.DAO.UserDAO;
import com.lahad.beans.User;
import com.lahad.singleton.HibernateUtil;

public class UserDaoImpl implements UserDAO{

	//private  SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	@Autowired
	User user;

	public void addUser(String email, String userName, String password){

		user.setEmail(email);
		user.setUserName(userName);
		user.setPassword(password);
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		try{
			session.save(user);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}

	public User findUserById(int id){

		Session session = sessionFactory.openSession();
		Transaction tx = null;

		try{
			tx = session.beginTransaction();
			user = (User)session.get(User.class, id);
			tx.commit();
		}catch (HibernateException he) {
			he.printStackTrace();
		}finally{
			session.close();
		}
		return user; 
	}

	public List<User> findUserByEmail(String theEmail){

		Session session = sessionFactory.openSession();
		Transaction tx = null;
		List <User> list = new ArrayList<User>();
		try{
			tx = session.beginTransaction();
			String hql = "FROM User WHERE email = :email";
			list =  session.createQuery(hql).setParameter("email", theEmail).list();
			tx.commit();
		}catch (HibernateException he) {
			he.printStackTrace();
		}finally{
			session.close();
		}
		return list; 
	}
	

	public boolean isEmailAvailable(String email) {

		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Boolean returnedValue = true; 
		try{
			tx = session.beginTransaction();

			String hql = "FROM User WHERE email = :email";
			List <User> list = session.createQuery(hql).setParameter("email", email).list();
			if(list.size() > 0){
				returnedValue = false;
			}
			tx.commit();
		}catch (HibernateException he) {
			he.printStackTrace();
		}finally{
			session.close();
		}
		return returnedValue; 
	}

	public Boolean isUserNameAvailable(String theUserName){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Boolean returnedValue = true; 
		try{
			tx = session.beginTransaction();
			String hql = "FROM User WHERE userName = :userName";
			List <User> list = session.createQuery(hql).setParameter("userName", theUserName).list();
			if(list.size() > 0){
				returnedValue = false;
			}
			tx.commit();
		}catch (HibernateException he) {
			he.printStackTrace();
		}finally{
			session.close();
		}
		return returnedValue; 
	}

	public void updateUser(int id, String email, String userName, String password){
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		try{
			user = (User)session.get(User.class, id);
			user.setEmail(email);
			user.setUserName(userName);
			user.setPassword(password);
			session.update(user);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}

	public void deleteUser(int id){
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		try{
			user = (User)session.get(User.class, id);
			// delete all his subjects and comments first to avoid constraint violation
			String hql = "DELETE Comment WHERE userId = :theUserId";
			session.createQuery(hql).setParameter("theUserId", user.getId());
			hql = "DELETE Subject WHERE userId = :theUserId";
			session.createQuery(hql).setParameter("theUserId", user.getId());
			//then delete the user himself
			session.delete(user);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
	}	
}
