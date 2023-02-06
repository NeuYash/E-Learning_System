
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

<body style="background-image: url(images/ab.jpg); background-size: 100%">
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
                        <a class="navbar-brand" href="#">Share-Tech</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    
                        <ul class="nav navbar-nav main-nav  clear navbar-right ">
                           <li><a class="navactive color_animation" href="opration.jsp">Back</a></li> 
                             <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                                                     
                        </ul>    
                
                    </div><!-- /.navbar-collapse -->
                    
                </div>
            </div><!-- /.container-fluid -->
        </nav>
	<%
		//int cat_id = Integer.parseInt(session.getAttribute("catid").toString());
		int uid = Integer.parseInt(session.getAttribute("uid").toString());
		String cname = (String) session.getAttribute("cname");
		/* out.println(cat_id);
		out.println(uid); */
		FileInfomation fd = null;
	%>
	<div id="main">
		

		<!--close menubar-->
		</nav>
		</header>

		<div id="site_content" style="height: 100%;padding-top: 79px;
    padding-left: 200px;">
			<div id="content">

				<div class="content_item" style="text-align: justify; width: 900px">

					<div class="contentdiv">

						<center>
							<h1>
								<strong>File Information</strong>
							</h1>

							<div class="tableformat">

								<table>
									<thead>
										<tr>
											<!-- <th>UserName</th> -->
											<th>UploadDate</th>
											<th>UploadTime</th>
											<th>FileName</th>
											<!-- <th>Delete_Here</th>-->
										</tr>
									</thead>
									<tbody>
										<%
										System.out.println(uid);
										System.out.println("group name="+cname);
										
											ArrayList<FileInfomation> al = DataAccessLayer.getFileDetailsList(uid,cname);
                                            String uname=DataAccessLayer.getusername(uid);
											Iterator<FileInfomation> itr = al.iterator();
											//traversing elements of ArrayList object  
											while (itr.hasNext()) {

												fd = itr.next();
										%>
										<form action="#" method="post">
										<tr>

											<%-- <td><%=uname%></td> --%>
											<td><%=fd.getDate()%></td>
											<td><%=fd.getTime()%></td>
											<td><%=fd.getFilename()%></td>
											
											<td><input type="hidden"
												name="fid" value="<%=fd.getFid()%>"> <input
												type="hidden" name="file_name" value="<%=fd.getFilename()%>"> 
												
												
												
											</form>
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
	
</body>
</html>