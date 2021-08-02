<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
  <div class="main">
            <div class="main-form">    
               <h4>Login</h4>
                <form action="LoginServlet" method="post" id="my-form"  >
                    <label class="form-label">Username <font color="red">*</font></label><br>
                    <input id="user" type="text" name="name">
                    <p></p><br>
                    <label class="form-label">Password <font color="red">*</font></label><br>
                    <input id="pass" type="password" name="pass">
                    <p></p><br>
                 
                    <p style="color: red;">${error }</p>
                    <input onclick="validate()" type="submit" name="submit-button" value="Login" onclick="check(this.form); return false;" >
                    <%
                      request.setAttribute("error", " ");
                    %>
                </form>
            </div>
        </div>
  <script type="text/javascript">
     function validate(){
    	 var username=document.getElementById("user").value;
    	 var password=document.getElementById("pass").value;
    	 if(username=="" || username.length<=3){
    		 alert("Invalid username ");
    		 console.log("hii")
    		 return false;
    	 }else if(password=="" || password.length<5){
    		 alert("Invalid password");
    		 return false;
    	 }
    	 return true;
     }
   
   </script>
</body>
</html>