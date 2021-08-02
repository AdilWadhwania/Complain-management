<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome page</title>
<style type="text/css">
 complain a{
  color: black;
 }

</style>
 
<link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/animate.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/owl.theme.default.min.css">
     <link rel="stylesheet" href="css/magnific-popup.css">

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/templatemo-style.css">

</head>
<body>
  <%
     // to prevent back button
  
	   response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");//http 1.1
	   
	   response.setHeader("pragma", "no-cache");//http 1.0
	   
	   response.setHeader("expires", "0");// proxies
	   
   
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("login.jsp");
     }
    
   %>
   
   
   <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                         <li><a href="#" class="smoothScroll">Home</a></li>
                         <li><a href="complain.jsp" class="smoothScroll">Complain</a></li>
                         <li><a href="profile.jsp" class="smoothScroll">Profile</a></li>
                         <li><a href="<%= request.getContextPath() %>/Logout" class="smoothScroll">logout</a></li>
                    </ul>

                   
               </div>
 
        
   <h4 style="text-align: center;">welcome ${username }</h4>
     <p style="text-align: center;">you love ${food } right?</p>
     <p style="text-align: left;">email: ${ email}</p>
      <section id="about" data-stellar-background-ratio="0.5">
          <div class="container">
               <div class="row">
		          <div class="col-md-6 col-sm-12">
		                  <div class="wow fadeInUp about-image" data-wow-delay="0.6s">
		                       <img src="images/about-image.jpg" class="img-responsive" alt="">
		                   </div>
		            </div>
                    <div class="col-md-6 col-sm-12">
                         <div class="about-info">
                              <div class="section-title wow fadeInUp" data-wow-delay="0.2s">
                                   <h4>Read our story</h4>
                                   <h2>We've been Making The Delicious Foods Since 1999</h2>
                              </div>

                              <div class="wow fadeInUp" data-wow-delay="0.4s">
                                   <p>Fusce hendrerit malesuada lacinia. Donec semper semper sem vitae malesuada. Proin scelerisque risus et ipsum semper molestie sed in nisi. Ut rhoncus congue lectus, rhoncus venenatis leo malesuada id.</p>
                                   <p>Sed elementum vel felis sed scelerisque. In arcu diam, sollicitudin eu nibh ac, posuere tristique magna. You can use this template for your cafe or restaurant website. Please tell your friends about <a href="https://plus.google.com/+templatemo" target="_parent">templatemo</a>. Thank you.</p>
                              </div>
                         </div>
                    </div>

     
                    
               </div>
          </div>
     </section>
     
</body>
</html>