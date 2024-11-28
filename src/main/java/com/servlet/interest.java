package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/interest")
public class interest extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		double principal=Double.parseDouble(req.getParameter("principal"));
		double rate=Double.parseDouble(req.getParameter("rate"));
		double time=Double.parseDouble(req.getParameter("time"));
		String duration=req.getParameter("duration");
		 double simpleInterest=0;
		if(duration.equals("Year"))
		{
			 simpleInterest = (principal * rate * time) / 100;
		}
		else
		{
			 simpleInterest = (principal * rate * time) / 1200;
		}
		
		resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<p>Principal Amount: $" + principal + "</p>");
        out.println("<p>Rate of Interest: " + rate + "%</p>");
        out.println("<p>Time (in years): " + time + "</p>");
        out.println("<p>Simple Interest: $" + simpleInterest + "</p>");
        out.close();
	}

	
	
}
