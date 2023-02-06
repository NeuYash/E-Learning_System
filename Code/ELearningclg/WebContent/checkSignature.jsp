
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ page import="java.util.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="com.model.*"%>


<!-- link
	href="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"
	rel="stylesheet" type="text/css" />
<link href="https://code.jquery.com/jquery-1.12.4.js" rel="stylesheet"
	type="text/css" />

<script>
	$(document).ready(function() {
		$('table.display').DataTable();
	});
</script>
 -->

<style>
.class1{
background-color: #292929bd;
    background-size: 500px;
    margin-top: 112px;
    height: 300px;
}
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}

tableformat {
	width: 524px;
	padding-top: 8px;
	padding-bottom: 15px;
	margin: 0 auto 20px auto;
	background-color: #446bb3;
	border-radius: 15px;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
	color: #446bb3;
	padding: 10px;
}

table {
	background-color: #fff;
	color: #453
}

thead {
	background-color: #446bb3;
	color: #fff;
	padding: 4px;
	line-height: 30px
}

tbody tr:nth-child(even) {
	background: #CCC
}

tbody tr:nth-child(odd) {
	background: #FFF
}

.col-md-offset-33 {
    margin-left: 20%;
}
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
        
       <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		<link rel="stylesheet" href="./Sky Forms_files/demo.css">
		<link rel="stylesheet" href="./Sky Forms_files/sky-forms.css">
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

<body style="width: 100%; height: 100%;background-image: url(images/ed11.jpg); background-repeat: no-repeat; background-size:cover; ">
   <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container" style="">
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
                           <li><a class="navactive color_animation" href="viewdownloadfile.jsp">Back</a></li> 
                             <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                                                     
                        </ul>    
                
                    </div><!-- /.navbar-collapse -->
                    
                </div>
            </div><!-- /.container-fluid -->
        </nav>
	
	<div id="main">
		

		<!--close menubar-->
		</nav>
		</header>

		<div id="site_content" style="height: 100%;padding-top: 79px;
    padding-left: 200px; " >
			<div id="content">

				     
            
                <div class="col-md-6 col-md-offset-33">
                 <div style="background-color: #292929bd;
    background-size: 500px;
    margin-top: 112px;
    height: 300px;padding: 20px;
">
                <br>
                   <form name="Reg" action="verifysign" class="sky-form" method="post">
				 <h1 style="    color: white;
    margin-left: 109px;
    border-color: white;">Verify signature</h1>
			<fieldset>	
				
					
					<section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
						 
							 <h2 style="    color: #78a9f1;    margin-top: 35px; margin-left: 170px; ">Enter Signature</h1>
						</label>
					</section>
					
					
				</fieldset>
				<fieldset>	
				
					
					<section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
						 <input type="password" name="signature" id="pass" placeholder=" Signature"   required="true" style="    background: #fbf5fac7;
    width: 221px;
    margin-top: 10px;
    margin-left: 154px;
    height: 36px;
    padding: 10px;
    font-size: larger;
    width: 221px; ">
							
						</label>
					</section>
					
					
				</fieldset>
				
				<footer>
				
					<button type="submit" name="submit" value="submit" class="button" id="submit"  style="margin-left: 41%; color: white;    margin-top:20px;">Submit</button>
					
				</footer>
			</form>	
					<br>
                </div>
                </div>
            </div>
        </div>
			</div>
		</div>
	</div>
	
</body>
</html>