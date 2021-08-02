package com.foodie.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodie.complain.ComplainManagement;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userData");
		
		if(user!=null) {
		  User newUser=new User();
		
		  newUser.setCity(request.getParameter("city"));
		  newUser.setEmail(request.getParameter("email"));
		  newUser.setFood(request.getParameter("food"));
		  newUser.setMobile(Long.parseLong(request.getParameter("phone")));
		  newUser.setPassword(request.getParameter("password"));
		  newUser.setState(request.getParameter("state"));
		  newUser.setuserName(request.getParameter("username"));
		  newUser.setId(user.getId());
		  try {
				
				boolean ans=new UserManagement().updateUser(newUser);
				
				if(ans) {
					//updating new data in session
					session.setAttribute("userData", newUser);
					request.getRequestDispatcher("profile.jsp").forward(request, response);
				  }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
