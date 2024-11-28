package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExCatDao;
import com.dao.InCatDao;
import com.db.HibernateUtil;
import com.entity.ExpenseCategory;
import com.entity.User;

@WebServlet("/addExpenseCategory")
public class ExpenseCat extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category=req.getParameter("category");
		
		 HttpSession session=req.getSession();
	        User user=(User)session.getAttribute("loginUser");
	        
	       ExpenseCategory exCat=new ExpenseCategory(category,user);
	       
	       ExCatDao dao=new ExCatDao(HibernateUtil.getSessionFactory());
	       boolean f=dao.saveExpenseCategory(exCat);
			
			if(f)
			{
				session.setAttribute("msg2","Category added Successfully");
				
				resp.sendRedirect("user/Category.jsp");
			}
			else {
				session.setAttribute("msg2","Something wrong on server");
				
				resp.sendRedirect("user/Category.jsp");
			}
	}
	
	

}
