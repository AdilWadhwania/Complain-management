package com.foodie.registration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodie.user.User;
import com.foodie.user.UserManagement;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password=request.getParameter("pass");
		String user_name=request.getParameter("name");
		String error_message="";
		try {
			User user=new UserManagement().getUserByUserName(user_name,password);
		 if(user.getuserName()!=null) {	
			RequestDispatcher rd= request.getRequestDispatcher("welcome.jsp");
			request.setAttribute("user", user_name);
			request.setAttribute("food", user.getFood());
			
			
			 HttpSession session=request.getSession();
			 session.setAttribute("userData", user);
			 session.setAttribute("email", user.getEmail());
			 session.setAttribute("username", user.getuserName());
			 session.setAttribute("user_id", user.getId());
			 
			 Cookie cookie=new Cookie("city",user.getCity());
			cookie.setMaxAge(12*60*60);
			response.addCookie(cookie);
			rd.forward(request, response);
		   }
		   else if(user.getuserName()==null){
			   
			   RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
			   error_message="Invalid User Name or Password";
				request.setAttribute("error", error_message);
				rd.forward(request, response);
		   }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
