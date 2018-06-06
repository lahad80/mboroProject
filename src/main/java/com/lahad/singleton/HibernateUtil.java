package com.lahad.singleton;



import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory(){
/*		
		final StandardServiceRegistry registry  = new StandardServiceRegistryBuilder().configure().build();
		try{
			sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		}catch(Exception ex){
			StandardServiceRegistryBuilder.destroy(registry);
		}
		return sessionFactory;
*/

		//or 

		Configuration configuration = new Configuration();
		sessionFactory = configuration.configure().buildSessionFactory();

		return sessionFactory;	
	}
	
}
  