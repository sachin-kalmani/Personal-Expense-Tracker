package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
//import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
//import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class ExpenseDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction tx=null;
	
	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
			//Saving the expense	
	public boolean saveExpense(Expense ex)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.save(ex);
			
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
	
	
				//Getting the expense			
	public List<Expense> getAllExpenseByUser(User user)
	{
		List<Expense> list=new ArrayList<Expense>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expense where user=:user");
			q.setParameter("user",user);
			list=q.list();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
//			Sum of expense
	public int getSumOfExpense(User user)
	{
		List<Expense> list=new ArrayList<Expense>();
		int sum=0;
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expense where user=:user");
			q.setParameter("user",user);
			list=q.list();
			for(Expense ex:list)
			{
				sum=sum+ex.getAmount();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}
	
		//Get the expense by category
	public Multimap<String,Integer> getExpenseByCategory(User user)
	{
		 Multimap<String, Integer> expenseMultimap = ArrayListMultimap.create();
		 Multimap<String, Integer> summedExpenseMultimap = ArrayListMultimap.create();
		 List<Expense> list=new ArrayList<Expense>();
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expense where user=:user");
			q.setParameter("user",user);
			list=q.list();
			for(Expense ex:list)
			{
				 expenseMultimap.put(ex.getCategory(),ex.getAmount() );
			}
			// Map to store the summed expense amounts per category
//	        Multimap<String, Double> summedExpenseMultimap = ArrayListMultimap.create();

	        // Sum the expense amounts for each category
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return expenseMultimap;
	}
	
	public Expense getExpenseById(int id)
	{
		Expense ex=null;
		try {
			session=factory.openSession();
			Query q=session.createQuery("from Expense where id=:id");
			q.setParameter("id", id);
			ex=(Expense)q.uniqueResult();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return ex;
	}
	
	public boolean updateExpense(Expense ex)
	{
		boolean f=false;
		
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(ex);
			
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
	
	public boolean deleteExpense(int id)
	{
		boolean f=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			Expense ex=session.get(Expense.class, id);
			session.delete(ex);
			
			tx.commit();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	//Get the expense by month
}






















//public Map<String,Integer> getExpenseByCategory(User user)
//{
//	List<Expense> list=new ArrayList<Expense>();
//	Map<String,Integer>data=new HashMap<String,Integer>();
//	Map<String,Integer>sumCategory=new HashMap<String,Integer>();
//	try {
//		session=factory.openSession();
//		Query q=session.createQuery("from Expense where user=:user");
//		q.setParameter("user",user);
//		list=q.list();
//		for(Expense ex:list)
//		{
//			data.put(ex.getCategory(), ex.getAmount());
//		}
//		for(Map.Entry<String, Integer>entry:data.entrySet())
//		{
//			String category=entry.getKey();
//			int amount=entry.getValue();
//			sumCategory.put(category,sumCategory.getOrDefault(category, 0)+amount);
//		}
//	}
//	catch(Exception e)
//	{
//		e.printStackTrace();
//	}
//	return sumCategory;
//}