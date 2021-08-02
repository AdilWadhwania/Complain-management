<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.foodie.complain.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="register.css">
<meta charset="ISO-8859-1">
<title>Raise a Complain</title>
</head>
<body>
 <%
 if(session.getAttribute("username")==null){
	 response.sendRedirect("login.jsp");
 }
 
 %>

 <% if(request.getAttribute("complain")==null){ %>
		<div class="main">
	    <div class="container">
	     <h4>Raise a Complain</h4>
	     <form action="ComplainServlet" method="post" name="form">
	       <label>Title : <input  type="text" name="title" style="margin-left: 11%" required="required"></label><br>
	       <label>Description : <textarea rows="5" cols="15" name="descr" required="required"></textarea></label><br>
	  	   <label> Address : <textarea style="margin-left: 5%;" rows="5" cols="15" name="address" required="required"></textarea></label><br>
	       <label>Mobile No : <input  type="number" name="phone" required="required"></label><br>
	      <input type="submit" value="complain">
	      
	     </form>
	   </div> 
	  </div>
  <%} else{
     Complain complain=(Complain) request.getAttribute("complain");

%>
  		<div class="main">
	    <div class="container">
	     <h4>Update Complain</h4>
	     <form action="ComplainServlet" method="post" name="form">
	       <label>Title : <input  type="text" name="title" value="<%= complain.getTitle() %>"  style="margin-left: 11%" required="required"></label><br>
	       <label>Description : <textarea rows="5" cols="15" name="descr" required="required"><%= complain.getDescription() %></textarea></label><br>
	  	   <label> Address : <textarea style="margin-left: 5%;" rows="5" cols="15" name="address" required="required"><%= complain.getAddress() %></textarea></label><br>
	       <label>Mobile No : <input  type="number" name="phone" value="<%= complain.getMobileNo() %>" required="required"></label><br>
	       <input type="hidden" name="id" value="<%=complain.getId() %>">
	      
	      <input type="submit" value="complain">
	      
	     </form>
	   </div> 
	  </div>
	<%} %>    
  
  




</body>
</html>