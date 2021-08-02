<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.foodie.complain.*" %>
       <%@ page import="com.foodie.user.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="register.css">
<meta charset="ISO-8859-1">
<title>Update profile</title>
</head>
<body>
 <%

	User user=new User();
	if(session.getAttribute("username")==null){
		 response.sendRedirect("login.jsp");
	}else{
		user=(User) session.getAttribute("userData");
	}
 
 %>
  		<div class="main">
	    <div class="container">
	     <h4>Edit Profile</h4>
	     <form action="userServlet" method="post" name="form">
	       <label>UserName: <input  type="text" name="username" value="<%= user.getuserName() %>"  style="margin-left: 5%" required="required"></label><br>
	        <label>Password: <input  type="password" name="password"  style="margin-left: 7%" required="required"></label><br>
	       <label>Email : <input  type="text" name="email" style="margin-left:12%;" value="<%= user.getEmail() %>" required="required"></label><br>
	       <label>city: <input  type="text" name="city" style="margin-left:17%;" value="<%= user.getCity() %>" required="required"></label><br>
	       <label>Mobile No : <input  type="number" name="phone" style="margin-left:4%;" value="<%= user.getMobile() %>" required="required"></label><br>
	       <label>Food: <input  type="text" name="food" style="margin-left:15%;" value="<%= user.getFood() %>" required="required"></label><br>
	       <label>State : <input  type="text" name="state" style="margin-left:14%;" value="<%= user.getState()%>" required="required"></label><br>
	      <input type="submit" value="update">
	      
	     </form>
	   </div> 
	  </div>
	  
  
  




</body>
</html>