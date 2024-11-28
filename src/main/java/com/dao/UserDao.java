package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class UserDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	public UserDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	
	public boolean saveuser(User user) {
		boolean f=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			session.save(user);
			tx.commit();
			f=true;
		}
		catch(Exception e)
		{
			if(tx!=null)
			{
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
	
	public User login(String email,String password)
	{
		User u=null;
		session=factory.openSession();
		Query q=session.createQuery("from User where email=:em and password=:ps");
		q.setParameter("em", email);
		q.setParameter("ps", password);
		
		u=(User)q.uniqueResult();
		
		return u;
	}
	
	public int getUser(User user)
	{
		int id=0;
		try {
			session=factory.openSession();
			Query q=session.createQuery("select id from User where user=:user");
			q.setParameter("user",user);
			id=q.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return id;
	}
	
	public User getUserById(int id)
	{
		User user1=null;
		try {
			session=factory.openSession();
			Query q=session.createQuery("from User where id=:id");
			q.setParameter("id", id);
			user1=(User)q.uniqueResult();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user1;
	}
	
	public boolean updateUser(User user1)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(user1);
			
			tx.commit();
			f=true;
		}
		catch(Exception e){
			if(tx!=null)
			{
				f=false;
				e.printStackTrace();
			}
		}
		
		return f;
	}
}
