package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			String name=req.getParameter("name");
			
			String email=req.getParameter("email");
			
			String phone=req.getParameter("phone");
			
			String password=req.getParameter("password");
			
			String birth=req.getParameter("birth");
			User u=new User(name, email, phone, password,birth);
			
			UserDao ud = new UserDao(HibernateUtil.getSessionFactory());
			boolean f=ud.saveuser(u);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("msg","Valid Email & Password");
				resp.sendRedirect("user/dashboard.jsp");
			}
			else
				System.out.print("Something wrog on server");
	}
}
