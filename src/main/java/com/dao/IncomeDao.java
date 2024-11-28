package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.Income;
import com.entity.User;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.servlet.SaveIncome;

public class IncomeDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	public IncomeDao(SessionFactory factory) {
		super();
		this.factory=factory;
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveIncome(Income inc)
	{
		boolean f=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(inc);
			
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
	
	public List<Income> getAllExpenseByUser(User user)
	{
		List<Income> list=new ArrayList<Income>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Income where user=:user");
			q.setParameter("user",user);
			list=q.list();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public int getSumOfIncome(User user)
	{
		List<Income> list=new ArrayList<Income>();
		int sum=0;
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Income where user=:user");
			q.setParameter("user",user);
			list=q.list();
			for(Income inc:list)
			{
				sum=sum+inc.getAmount();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}
	
	public Income getIncomeById(int id)
	{
		Income inc=null;
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Income where id=:id");
			q.setParameter("id", id);
			inc=(Income)q.uniqueResult();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return inc;
	}
	
	public boolean updateIncome(Income inc)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(inc);
			
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
	
	public boolean deleteIncome(int id)
	{
		boolean f=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			Income inc=session.get(Income.class, id);
			session.delete(inc);
			
			tx.commit();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public Multimap<String,Integer> getIncomeByCategory(User user)
	{
		 Multimap<String, Integer> incomeMultimap = ArrayListMultimap.create();
		 Multimap<String, Integer> summedIncomeMultimap = ArrayListMultimap.create();
		 List<Income> list=new ArrayList<Income>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Income where user=:user");
			q.setParameter("user",user);
			list=q.list();
			for(Income inc:list)
			{
				 incomeMultimap.put(inc.getCategory(),inc.getAmount() );
			}
			// Map to store the summed expense amounts per category
//	        Multimap<String, Double> summedExpenseMultimap = ArrayListMultimap.create();

	        // Sum the expense amounts for each category
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return incomeMultimap;
	}
}
