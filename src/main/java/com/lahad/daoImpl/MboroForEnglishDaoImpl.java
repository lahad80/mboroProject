package com.lahad.daoImpl;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.lahad.DAO.MboroForEnglishDAO;
import com.lahad.beans.MboroForEnglish;
import com.lahad.singleton.HibernateUtil;

public class MboroForEnglishDaoImpl implements  MboroForEnglishDAO{

	//private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	@Autowired
	MboroForEnglish mboroForEnglish;
	public int getLikesCount() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		int count = 0;
		try{
			tx = session.beginTransaction();
			mboroForEnglish = (MboroForEnglish)session.get(MboroForEnglish.class, 1); // must be registered in the database
			count = mboroForEnglish.getLikesCount();
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}
		
		return count;
	}

	public void incrementLikesCount() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		  
		try{
			tx = session.beginTransaction();
			mboroForEnglish = (MboroForEnglish)session.get(MboroForEnglish.class, 1);
			int number = mboroForEnglish.getLikesCount() + 1;
			mboroForEnglish.setLikesCount(number);
			session.update(mboroForEnglish);
			tx.commit();
		}catch(HibernateException he){
			he.printStackTrace();
		}finally{
			session.close();
		}	
	}
}
