package com.foodie.registration;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodie.user.User;
import com.foodie.user.UserManagement;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=new User();
		if(!request.getParameter("city").trim().equals("") && !request.getParameter("email").trim().equals("") && !request.getParameter("food").trim().equals("") && !request.getParameter("phone").trim().equals("") && !request.getParameter("pass").trim().equals("") && !request.getParameter("state").trim().equals("") && !request.getParameter("name").trim().equals(""))
		{		
			user.setCity(request.getParameter("city"));
			user.setEmail(request.getParameter("email"));
			user.setFood(request.getParameter("food"));
			user.setMobile(Long.parseLong(request.getParameter("phone")));
			user.setPassword(request.getParameter("pass"));
			user.setState(request.getParameter("state"));
			user.setuserName(request.getParameter("name"));
		}
		else {
			response.sendRedirect("register.jsp");
		}
		try {
			boolean issuccess=new UserManagement().registerUser(user);
			if(issuccess==true) {
				
				  RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
				  rd.forward(request, response);
			}
			System.out.print("Is data submitted"+issuccess);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
