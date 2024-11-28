package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.InCatDao;
import com.db.HibernateUtil;
import com.entity.Income;
import com.entity.IncomeCategory;
import com.entity.User;

@WebServlet("/addIncomeCategory")
public class addIncomeCat extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category=req.getParameter("category");
		
		 HttpSession session=req.getSession();
	        User user=(User)session.getAttribute("loginUser");
	        
	       IncomeCategory inCat=new IncomeCategory(category,user);
	       
	       InCatDao dao=new InCatDao(HibernateUtil.getSessionFactory());
	       boolean f=dao.saveIncomeCategory(inCat);
			
			if(f)
			{
				session.setAttribute("msg1","Category added Successfully");
				
				resp.sendRedirect("user/Category.jsp");
			}
			else {
				session.setAttribute("msg1","Something wrong on server");
				
				resp.sendRedirect("user/Category.jsp");
			}
	}
	
	

}
