
<%@page import="com.DAO.DataAccessLayer"%>
<%@page import="com.DAO.Database_con"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>

<!-- Favicons -->

 <link rel="icon" href="images/favicon.png" type="image/png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style4.css">
 <link rel="icon" href="images/favicon.png" type="image/png">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  

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
.select {
	font-size: 16px;
	position: relative;
	display: inline-block;
}

.select select {
	outline: none;
	-webkit-appearance: none;
	display: block;
	padding: 1.2em 3em 1.3em 1.5em;
	margin: 0;
	transition: border-color 0.2s;
	border: 5px solid #51ebdd0f;
	border-radius: 5px;
	background: #fff;
	color: #555;
	line-height: normal;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
	width: 170px;
}

.select .arr {
	background: #fff;
	bottom: 5px;
	position: absolute;
	right: 5px;
	top: 5px;
	width: 50px;
	pointer-events: none;
}

.select .arr:before {
	content: '';
	position: absolute;
	top: 50%;
	right: 24px;
	margin-top: -5px;
	pointer-events: none;
	border-top: 10px solid #EB5168;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
}

.select .arr:after {
	content: '';
	position: absolute;
	top: 50%;
	right: 28px;
	margin-top: -5px;
	pointer-events: none;
	border-top: 6px solid #fff;
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
}

input[type=submit] {
	padding: 15px 25px;
	font-size: 17px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	
	align: center;
	margin-left: 296%;
	margin-top: 18%;
	width: 79%;
}

input[type=submit]:hover {
	background-color: #3e8e41
}

input[type=submit]:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

#main {
	color: red;
	font-family: 'Tangerine', serif;
	font-size: 50px;
	align: center;
	font-weight: 900;
	color: fff;
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







<style type="text/css">

body {
  margin: 2rem;
}

th {
  background-color: white;
}

th, td {
  padding: 0.5rem;
}


.paginate_button {
  border-radius: 0 !important;
}
</style>
<body style="background-image: url(images/ed7.jpg); background-repeat: no-repeat; background-size:cover;height:700px;">
<%

int userid = Integer.parseInt(session.getAttribute("uid").toString());
System.out.println("useridddd==="+userid);
 	
	
		List<String> catList = DataAccessLayer.getAllGroup(userid);

		
	%>
	


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
                            <li><a class="navactive color_animation" href="welcome.jsp">BACK</a></li>
                             <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                            
                            
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        

	
	
               <div class="panel panel-default" style=" background-color:skyblue; margin-top: 140px; height: 66%;opacity: 0.8;">
				
                 <br><br>
				<div class="panel-heading" style="text-align: center;">
	            <strong style=" width:50px; color:black; font-size:20px;font-family:"Times New Roman", Times, serif; ">SELECT YOUR GROUP FOR OPRATION! </strong>
				</div>
				
				
            
			    <div class="row">
						
				 <form action="ViewGroup" method="post">
		<div id="main">
			
			
			<div>
			<table>
				<tr>
					<td><div class="select" style="margin-left:600px; margin-top: -35px; width:12vw;">
							<span class="arr"></span> <select  id="categoryName"
								 name="categoryName"
								onfocus="document.form2.input.value=this.value;">
								<%
									for (String c : catList) {
								%>
								<option value="<%=c%>">
									<%=c%></option>
								<%
									}
								%>	
							</select>
						</div></td>
				</tr>
				<tr>
					<%-- <td><input type="hidden" name="aid" value="<%=admin_id%>" /></td> --%>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<br>
				</tr>
				<tr>
					<td align="center"><input type="submit" name="submit"
						value="SUBMIT" style="margin-left: 600px; margin-top: 15px; background-color: #0000009e;    font-size: 14px; width:9.3vw"></td>
				</tr>
				<tr></tr>

			</table>
			</div>
			<div>
	</form>
			</div>
			</div>
			
			
	
    </header>

  

</body>
</html>