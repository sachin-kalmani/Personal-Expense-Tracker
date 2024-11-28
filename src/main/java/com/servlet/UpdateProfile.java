package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.dao.IncomeDao;
import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.Income;
import com.entity.User;

@WebServlet("/profile")
public class UpdateProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("mobile");
		String birth=req.getParameter("dob");
		String password=req.getParameter("password");
		 LocalDate currentDate = LocalDate.now();	
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("loginUser");
		User user1=new User(name,email,phone,password,birth);
		user1.setId(id);
		UserDao dao=new UserDao(HibernateUtil.getSessionFactory());
			boolean f=dao.updateUser(user1);
			
			if(f)
			{
				session.setAttribute("msg12","Profile Updated Successfully");
				
				resp.sendRedirect("user/profile.jsp");
			}
			else {
				session.setAttribute("msg12","Something wrong on server");
				
				resp.sendRedirect("user/profile.jsp");
			}
	}
	

}
