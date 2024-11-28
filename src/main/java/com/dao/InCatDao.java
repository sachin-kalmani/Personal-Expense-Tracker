package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.IncomeCategory;
import com.entity.User;

public class InCatDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	public InCatDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	
	public boolean saveIncomeCategory(IncomeCategory incat)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(incat);
			
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
	
	public List<IncomeCategory> getAllCategoryByUser(User user)
	{
		List<IncomeCategory> list=new ArrayList<IncomeCategory>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from IncomeCategory where user=:user");
			q.setParameter("user",user);
			list=q.list();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
