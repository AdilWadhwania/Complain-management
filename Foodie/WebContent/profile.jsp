<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.foodie.complain.*" %>
      <%@ page import="com.foodie.user.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
 
<link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/animate.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/owl.theme.default.min.css">
     <link rel="stylesheet" href="css/magnific-popup.css">

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/templatemo-style.css">
 <style type="text/css">
   table {
    margin-left: 10%;
    width: 450px;
    margin-top:3%;
    
   }
  
  table th,td{
   text-align: center;
   padding:1%;
  }
  table th,table td{
   padding:10px;
  }
 </style>

</head>
<body>
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");//http 1.1
	
	response.setHeader("pragma", "no-cache");//http 1.0
	
	response.setHeader("expires", "0");// proxies
	User user=new User();
	if(session.getAttribute("username")==null){
		 response.sendRedirect("login.jsp");
	}else{
		user=(User) session.getAttribute("userData");
	}
%>
 
   <h2 style="text-align: center;">Profile Section</h2>
 
 	      <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                        <li><a href="welcome.jsp" class="smoothScroll">home</a></li>
                         <li><a href="#View Profile table" class="smoothScroll">Your Profile</a></li>
                         <li><a href="editProfile.jsp" class="smoothScroll">Edit profile</a></li>
                        
                    </ul>
               </div>
   
     <div id="View Profile table">
     	<table border="1" >
     	  <tr>
     	   <th> User </th>
     	    <th> Email </th>
     	   <th>Mobile No</th>
     	   <th>Favorite food</th>
     	   <th>City</th>
     	  </tr>
     	 
     	<tr>
     	  <td><c:out value="<%=user.getuserName() %>"></c:out></td>
     	   <td><c:out value="<%=user.getEmail() %>"></c:out></td>
     	   <td><c:out value="<%=user.getMobile() %>"></c:out></td>
     	   <td><c:out value="<%=user.getFood() %>"></c:out></td>
     	   <td><c:out value="<%=user.getCity() %>"></c:out></td>
     	</tr>
     	
     
     	</table>
     
     
     </div>
   

</body>
</html>