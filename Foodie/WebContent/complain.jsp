<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.foodie.complain.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complain</title>
 
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

	List<Complain> complainList=new ArrayList<Complain>();
	if(session.getAttribute("user_id")==null){
		 response.sendRedirect("login.jsp");
	}else{
		int user_id=(int) session.getAttribute("user_id");
		complainList= new ComplainManagement().getAllComplainByUserId(user_id);
	}
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");//http 1.1
	
	response.setHeader("pragma", "no-cache");//http 1.0
	
	response.setHeader("expires", "0");// proxies
%>
 
   <h2 style="text-align: center;">Complain Section</h2>
 
 	      <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                        <li><a href="welcome.jsp" class="smoothScroll">home</a></li>
                         <li><a href="raiseComplain.jsp" class="smoothScroll">Raise a Complain</a></li>
                         <li><a href="#show complain table" class="smoothScroll">Show Complain</a></li>
                        
                    </ul>
               </div>
   
     <div id="show complain table">
     	<table border="1" >
     	  <tr>
     	   <th> id </th>
     	    <th> Title </th>
     	   <th>Description</th>
     	   <th>Address</th>
     	   <th>Mobile No</th>
     	   <th colspan="2">Action</th>
     	  </tr>
     	  <% int count=1; %>
     	<c:forEach var="complain" items="<%=complainList %>">
     	<tr>
     	  <td><c:out value="<%= count++ %>"></c:out></td>
     	  <td><c:out value="${complain.title}"></c:out></td>
     	   <td><c:out value="${complain.description}"></c:out></td>
     	   <td><c:out value="${complain.address}"></c:out></td>
     	   <td><c:out value="${complain.mobileNo}"></c:out></td>
     	   <td><a href="<%= request.getContextPath() %>/ComplainServlet?id=${ complain.id}&action=update">update</a></td>
     	   <td><a href="<%= request.getContextPath() %>/ComplainServlet?id=${ complain.id}&action=delete">delete</a></td>
     	</tr>
     	</c:forEach>
     
     	</table>
     
     
     </div>
   

</body>
</html>