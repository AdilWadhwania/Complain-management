package com.foodie.complain;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ComplainServlet
 */
@WebServlet("/ComplainServlet")
public class ComplainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DELETE_ACTION="delete";
	private static final String UPDATE_ACTION = "update";   
   
	
	


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String action=req.getParameter("action");
		switch(action) {
		   case DELETE_ACTION:
			   if(id>0) {
				   try {
					boolean isSuccess= new ComplainManagement().removeComplainById(id);
					if(isSuccess) {
						req.getRequestDispatcher("complain.jsp").forward(req, resp);
					}else {
						System.out.println("failed");
					}
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			    }
			     break;
		   case UPDATE_ACTION:
		     HttpSession session=req.getSession();
		    int userId=(int)session.getAttribute("user_id");
		  
			 try {
				Complain complain=new ComplainManagement().getComplainById(id, userId);
				req.setAttribute("complain", complain);
				req.getRequestDispatcher("/raiseComplain.jsp").forward(req, resp);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
			   
		}
		
		
		
	}





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Complain complain=new Complain();
		complain.setAddress(request.getParameter("address"));
		complain.setDescription(request.getParameter("descr"));
		complain.setMobileNo(Long.parseLong(request.getParameter("phone")));
		complain.setTitle(request.getParameter("title"));
		
		HttpSession session=request.getSession();
		int user_id=(int) session.getAttribute("user_id");
		
		complain.setUserId(user_id);
		
		boolean ans=false;
			try {
				if(request.getParameter("id")!=null) {
					complain.setId(Integer.parseInt(request.getParameter("id")));
					 ans=new ComplainManagement().updateComplain(complain);
				}
				else {
				 ans=new ComplainManagement().addComplain(complain,user_id);
				
				}
				if(ans==true) {
					RequestDispatcher rd=request.getRequestDispatcher("complain.jsp");
					rd.forward(request, response);
				  }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
