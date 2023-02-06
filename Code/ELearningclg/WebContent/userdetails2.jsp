<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.*"%>
<%@page import="com.DAO.*"%>
<%@page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/#favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    
    
    
    
    
    
    
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>datatable responsive</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">











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
        <link rel="icon" href="favicon-1.ico" type="image/x-icon">
    
<title>Insert title here</title>
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
<body style="background-image: url(images/ed14.jpg); background-repeat: no-repeat; background-size:cover;">
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
                         <li><a class="navactive color_animation" href="adminwelcome.jsp">BACK</a></li>
                           <li><a class="navactive color_animation" href="selectcategories3.jsp">VIEW-GROUP</a></li>
                            <li><a class="navactive color_animation" href="userdetails.jsp">USER-DETAILS</a></li> 
                             <li><a class="navactive color_animation" href="ownerlogin.jsp">LOGOUT</a></li>
                                                     
                        </ul>    
                
                    </div><!-- /.navbar-collapse -->
                    
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        
        
        <%
	String dept=session.getAttribute("dept").toString();
    System.out.println(dept);
	%>
	
	<div style="background-color:white;height:570px;width:1100px;margin-left:200px;margin-top:70px;opacity:1;">
	<h1 style="font-weight: 900; width: 500px; background-color: white; letter-spacing: 0.040em; border: 2px solid #2f2e2f; margin-left: 300px;margin-top:20px;">
		<strong>User Details on Teacher Side</strong>
	</h1><br><br>
	<table style=" width:80vw;background-color:white;"id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
										<tr  style="background: #f8efeff2;    color: black;">
										<th>User Id</th>
											<th>UserName</th>
											<th>Contact</th>
											<th>Email</th>
											<th>Department</th>
											<th>Status</th>
											
										</tr>
									</thead>
									<tbody>
										<%
										
											ArrayList<userModel> al = DataAccessLayer.getuserDetails(dept);
                                           
											for(userModel fd:al){
										%>
										
										<tr>
											<td><%=fd.getId() %></td>
											<td><%=fd.getFirstName()+" "+fd.getLastName() %></td>
											<td><%=fd.getMobileNo()%></td>
											<td><%=fd.getEmailID()%></td>
											<td><%=fd.getdept()%></td>
											<td><%if(fd.getAccess()==1){%>
											<form action="access" method="post">
											
											<input type="submit" value="Deactive" name="btn">
											
											<%}else if(fd.getAccess()==0){ %>
											<form action="access" method="post">
											<input type="submit" value="Active" name="btn">
											<%} %>
											
											</td>
											
											
											<input type="hidden" name="uid" value="<%=fd.getId()%>">
												</form>
												
											
											<%
												}
											%>

										</tr>
									</tbody>

								</table>
</div>
         </div>
          
    </div>

    </div>
     
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
     <script type="text/javascript">
       $(document).ready(function() {

  $('#datatable-responsive').DataTable( {
    
    responsive: true,
    details: false,
    "lengthMenu": [[10, 25, 50,100,-1], [10, 25, 50,100 , " All"]]

  } );
} );
    </script>    
    
</body>
</html>