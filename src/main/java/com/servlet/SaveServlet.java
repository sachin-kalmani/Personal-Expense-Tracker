package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/saveExpense")
public class SaveServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		
		String description=req.getParameter("description");
		
		int amount=Integer.parseInt(req.getParameter("amount"));
		
		String category=req.getParameter("category");
		 LocalDate currentDate = LocalDate.now();	
		 int currentYear = currentDate.getYear();		 
		 String currentMonth = currentDate.format(DateTimeFormatter.ofPattern("MMMM"));
	        
	        HttpSession session=req.getSession();
	        User user=(User)session.getAttribute("loginUser");
	        
	        Expense ex=new Expense(title, description, category,amount, currentYear,currentMonth ,user);
	        
	        ExpenseDao dao=new ExpenseDao(HibernateUtil.getSessionFactory());
	        boolean f=dao.saveExpense(ex);
			
			if(f)
			{
				session.setAttribute("msg","Expense added Successfully");
				
				resp.sendRedirect("user/addexpense.jsp");
			}
			else {
				session.setAttribute("msg","Something wrong on server");
				
				resp.sendRedirect("user/addexpense.jsp");
			}
	}
	        
	}

