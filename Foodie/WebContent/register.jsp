<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="register.css">
<meta charset="ISO-8859-1">
<title>Registration</title>
 
</head>
<body>
   <div class="main">
    <div class="container">
     <h4>Registration</h4>
     <form action="RegisterServlet" method="post" name="form">
       <label>Enter UserName : <input  type="text" name="name" required="required"></label><br>
       <label>Enter Email : <input style="margin-left:8%;"type="text" name="email" required="required"></label>       <br>
       <label>Enter Mobile : <input style="margin-left:6%;" type="number" name="phone" required="required"></label><br>
       <label>Favorite Food : <input style="margin-left:5%;" type="text" name="food" required="required"> </label><br>
       <label>Enter City : <input style="margin-left:11%;" type="text" name="city" required="required"></label><br>
       <label>Enter State : <input style="margin-left:10%;" type="text" name="state" required="required"></label><br>
       <label>Enter Password : <input style="margin-left:3%;" type="password" name="pass" required="required"></label><br>
       <p id="result" style="color: red;"></p>
      <input type="submit" value="Register" onclick="validate()">
      
     </form>
   </div> 
  </div>
  
   <script type="text/javascript">
      
     function validate(){
    	
    	 var user=form.name.value;
    	 var email=form.email.value;
    	 var mobile=form.phone.value;
    	 var food=form.food.value;
    	 var city=form.city.value;
    	 var state=form.state.value;
    	 var password=form.pass.value;
    	
	    	
    	 if(user.length<3 || user.length>30){
    		
    		 document.getElementById("result").innerHTML="Invalid username";
	    }else if(email.length<12 || email.length>45){
	    	 document.getElementById("result").innerHTML="Invalid email";
	    }else if(mobile.length<10 || mobile.length>10){
	    	document.getElementById("result").innerHTML="Invalid Mobile number";
	    }else if(food.length<5 || food.length>30){
	    	document.getElementById("result").innerHTML="Invalid food";
	    }else if(city.length<3 || city.length>30){
	    	document.getElementById("result").innerHTML="Invalid city";
	    }else if(state.length<6 	|| city.length>45){
	    	document.getElementById("result").innerHTML="Invalid state";
	    }else if(password.length<12 || city.length>45){
	    	document.getElementById("result").innerHTML="password should be in between 12 to 16 characters";
	    }
    	 
	 
     }
   
   
   
   </script>
  
</body>
</html>