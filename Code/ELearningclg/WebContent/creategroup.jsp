<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>

 <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css" media="screen" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style-portfolio.css">
        <link rel="stylesheet" href="css/picto-foundry-food.css" />
        <link rel="stylesheet" href="css/jquery-ui.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/font-awesome.min.css" rel="stylesheet">
         <link rel="icon" href="images/favicon.png" type="image/png">


<style>
.button {
	position: relative;
	background-color: #f4511e;
	border: none;
	font-size: 16px;
	color: #171715;
	padding: 13px;
	width: 87px;
	text-align: center;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	text-decoration: none;
	overflow: hidden;
	cursor: pointer;
	height: 7px;
	border-radius: 10px;
	padding-bottom: 29px; padding-top : 15px;
	margin-left: 84px;
	padding-top: 15px;
}

.button:after {
	content: "";
	background: #90EE90;
	display: block;
	position: absolute;
	padding-top: 300%;
	padding-left: 350%;
	margin-left: -20px !important;
	margin-top: -120%;
	opacity: 0;
	transition: all 0.8s
}

.button:active:after {
	padding: 0;
	margin: 0;
	opacity: 1;
	transition: 0s
}

#main {
	color: #55F24D;
	font-family: 'Tangerine', serif;
	font-size: 30px;
	align: center;
	font-weight: 900;
}
</style>
 <%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

      if(session.getAttribute("uid")==null)
      {
    	  response.sendRedirect("index.jsp");
    	  return;
      }
%>

</head>
<body style="background-color: skyblue;">




<!-- LOGO HEADER END-->
	 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="row">
                <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">e-learning</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    
                        <ul class="nav navbar-nav main-nav  clear navbar-right ">
                            <!-- <li><a class="navactive color_animation" href="#top">WELCOME</a></li>-->
                             <li><a class=" color_animation" href="welcome.jsp">BACK</a></li>
                            <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                            
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    
                </div>
              
             
          
            </div><!-- /.container-fluid -->
        </nav>
        
        
    
	<div style="height:656px; background-image: url('images/ed12.jpg');background-position: center;  background-repeat: no-repeat; background-size: cover;">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br><br>
	<div style="width: 500px; height: 300px;background-color: #87ceebc4; margin-left: 370px;border-radius: 25px;margin-top:-60px;">
	<br>
	<br>
	<center>
		<label style="font-family: serif; font-size: 25px; background-color: #020e3a; border-radius: 25px; width: 280px; height: 35px; margin-left: 5px;">
			
			<b  style="color: white;">Enter Group Name</b>
		</label>

	</center>
	<div style="border: 1px solid grey; background-color:; align =center; padding: 30px; margin-left: 23%; margin-top: 5%; border-radius: 25px; width: 270px; height: 150px">
		<form action="CreateGroupcontroller2" method="post">
			<div id="main" style="margin-top: -19px;">

				<input type="text" name="gname"style="width: 200px; height: 40px; margin-left: 5px; margin-top: 40px;"> <br>
				<input class="button" type="submit" name="submit" value="SUBMIT"  style="margin-left: 55px; margin-top: 45px;">

				<br>

				
			</div>
		</form>
	</div>

</div>
</div>

</body>
</html>