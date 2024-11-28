package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.ExpenseCategory;
import com.entity.IncomeCategory;
import com.entity.User;

public class ExCatDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	public ExCatDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	
	public boolean saveExpenseCategory(ExpenseCategory excat)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(excat);
			
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
	
	public List<ExpenseCategory> getAllCategoryByUser(User user)
	{
		List<ExpenseCategory> list=new ArrayList<ExpenseCategory>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from ExpenseCategory where user=:user");
			q.setParameter("user",user);
			list=q.list();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
