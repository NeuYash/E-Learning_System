


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ page import="java.util.*"%>
<%@ page import="com.DAO.*"%>
<%@ page import="com.model.*"%>


<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" href="images/favicon.png" type="image/png">
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
    <title>e-learning</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

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

<body style="background-image: url(images/ed8.jpg); background-size: 100%">
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

	%>
	<div id="main">
		

		<!--close menubar-->
		</nav>
		</header>

		<div id="site_content" style="height: 100%;padding-top: 79px;
    padding-left: 200px;">
			<div id="content">

				<div class="content_item" style="text-align: justify; width: 900px">

					<div class="contentdiv" style="background-color:white;">

						<center>
							<h1 style="font-weight: 900;
    width: 455px;
    background-color: white;
    letter-spacing: 0.040em;
    border: 2px solid #2f2e2f;    margin-left: 50px;margin-top:50px;">
								<strong> Group Information</strong>
							</h1><br><br>

							
	<table style=" width:80vw;background-color:white;"id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">

									<thead>
										<tr style="background: #f8efeff2;    color: black;">
											<th>Group Name</th>
											<th>Group Admin</th>
											<th>Group Create Date</th>
											<th>Total Members</th>
											<th>View Group Details</th>
										</tr>
									</thead>
												<tbody style="text-align: center;">
										<%									
											ArrayList<groupmodel> al = DataAccessLayer.allgroupdetails();
											groupmodel list=null;
                                            
											Iterator<groupmodel> itr = al.iterator();
											  
											while (itr.hasNext()) {
												list = itr.next();

										%>
										
										<tr>

											<td><%=list.getGname()%></td>
											<td><%=list.getFname()+" "+list.getLname()%></td>
											<td><%=list.getDate()%></td>
											<td><%=list.getTotalmember()%></td>
											<td><a style="background: #4caf50;
    border-radius: 10px;
    padding: 5px;" href="viewgroupadmin.jsp?gname=<%=list.getGname() %>">&nbsp;&nbsp;View Group&nbsp;&nbsp;</a></td>
											
											
												
											<%
											}
											%>

										</tr>
									</tbody>

								</table>
							</div>

							<div></div>
						</center>

					</div>

				</div>
				<div class="content_item"></div>
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