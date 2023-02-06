<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>


<style>
.dropbtn {
    background-color: #00000000;
        font-size: 0.75000em;
    font-weight: 700;
    padding: 16px;
    font-size: 16px;
    border: none;
    border-bottom: 1px solid #96e16b;
    color: white !important;
    font-family: "museo-sans", helvetica, sans-serif;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: black;
    min-width: 160px;
    box-shadow: 5px 10px 16px 0px rgba(3, 0, 0, 1);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>

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

    <body  style="width: 100%; height: 100%; background-image: url(images/ed.jpeg); background-repeat: no-repeat; background-size:cover; ">
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
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    
                        <ul class="nav navbar-nav main-nav  clear navbar-right ">
                           <!--   <li><a class="navactive color_animation" href="selectfile.jsp">Upload Data</a></li>-->
                           <li><a class="navactive color_animation" href="viewdownloadfile.jsp">Download Data</a></li>
                           <!--  <li><a class="navactive color_animation" href="deletedata.jsp">Delete Data</a></li>  -->
                           <!--   <li><a class="navactive color_animation" href="viewdata.jsp">View  Data</a></li>  -->
                            <li><a class="navactive color_animation" href="welcome.jsp">Back</a></li> 

                             <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                                                     
                        </ul>    
                   
                    </div><!-- /.navbar-collapse -->
                    
                </div>
            </div><!-- /.container-fluid -->
        </nav>
         
  
   
   </body>
</html>
