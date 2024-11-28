package com.db; 

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.entity.Expense;
import com.entity.ExpenseCategory;
import com.entity.Income;
import com.entity.IncomeCategory;
import com.entity.User;


public class HibernateUtil {
	private static SessionFactory sessionfactory;
	
	public static org.hibernate.SessionFactory getSessionFactory() {
		if(sessionfactory==null)
		{
			Configuration configuration =new Configuration();
			
			Properties properties =new Properties();
			
			properties.put(Environment.DRIVER,"com.mysql.cj.jdbc.Driver");
			properties.put(Environment.URL,"jdbc:mysql://localhost:3306/delightexpense");
			properties.put(Environment.USER,"root");
			properties.put(Environment.PASS,"sachinadmin");
			properties.put(Environment.DIALECT,"org.hibernate.dialect.MySQL8Dialect");
			properties.put(Environment.HBM2DDL_AUTO,"update");
			properties.put(Environment.SHOW_SQL,true);
			
			configuration.setProperties(properties);
			configuration.addAnnotatedClass(User.class);
			configuration.addAnnotatedClass(Expense.class);
			configuration.addAnnotatedClass(Income.class);
			configuration.addAnnotatedClass(IncomeCategory.class);
			configuration.addAnnotatedClass(ExpenseCategory.class);
			
			ServiceRegistry serviceRegistry=new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			sessionfactory=configuration.buildSessionFactory(serviceRegistry);
			
			
		}
		return sessionfactory;
	}
}
