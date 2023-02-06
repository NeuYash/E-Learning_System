<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DataAccessLayer"%>
<%@page import="com.model.usrDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="java.util.*" %>
<%@page import ="java.util.stream.Collectors" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>e-learning</title>
<link rel="icon" type="image/png" href="images/techhub.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<style type="text/css">
/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
How To Create a Custom Radio Button
Example
/* Customize the label (the container) */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;

  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 34px;
  height: 25px;
  width: 25px;
  background-color: #d5d5de;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
  top: 9px;
  left: 9px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
}
.btn{
font-size: 16px;  margin-left: 105px;  margin-top: 68px;  border-style: groove;  border-radius: 10px;  background-color: white; width: 52%; padding: 5px;"
}
.btn:hover{
font-size: 16px;  margin-left: 105px;  margin-top: 68px;  border-style: groove;  border-radius: 10px;  background-color: #9cb0d6; width: 52%; padding: 5px;"
}
.btn1{font-size: 16px;  margin-left: 455px;  margin-top: -45px;  border-style: groove;  border-radius: 10px;  background-color: white; width: 16%; padding: 5px;}

.btn1:hover{font-size: 16px;  margin-left: 455px;  margin-top: -45px;  border-style: groove;  border-radius: 10px;  background-color: #9cb0d6; width: 16%; padding: 5px;}

.btn2{font-size: 16px;  margin-left: 150px;  margin-top: 5px;  border-style: groove;  border-radius: 10px;  background-color: white; width: 16%; padding: 5px;}
.btn2:hover{font-size: 16px;  margin-left: 150px;  margin-top: 5px;  border-style: groove;  border-radius: 10px;  background-color: #9cb0d6; width: 16%; padding: 5px;}
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
h1 {
    font-weight: 900;
    width: 300px;
    letter-spacing: 0.040em;
    border: 2px solid #2f2e2f;
    border-radius: 10px;
    background-color: #6495ed69;
}





/*Scroll BARS */


/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}

div.ex1 {
  background-color: lightblue;
  width: 450px;
  height: 200px;
  /* overflow: scroll; */
   overflow: auto;
}

</style>
</head>


<body style="    background-image: url(images/datacenter.jpg);position: fixed;height:1000px;">
<script type="text/javascript">
	function dothat() {
		var div = document.getElementById('fileuploads');
		var field = div.getElementsByTagName('input')[0];

		div.appendChild(document.createElement("br"));
		div.appendChild(field.cloneNode(false));
	}
	
	function toggle(source) {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (checkboxes[i] != source)
	            checkboxes[i].checked = source.checked;
	    }
	}
</script>
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
                            <li><a class=" color_animation" href="opration1.jsp">BACK</a></li>
                             <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li>
                            
                            
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        
<%
        	String cname=session.getAttribute("cname").toString();
                                	    int uid=Integer.parseInt(session.getAttribute("uid").toString()); 
                                	    ArrayList<Integer> al2=new ArrayList<Integer>();
                                	  
        	ArrayList<Integer> al = DataAccessLayer.getcategoryuserid(cname);

        	for (int i = 0; i < al.size(); i++) {
        		if (al.get(i) != uid) {
        			al2.add(al.get(i));

        		}

        	}

        	ArrayList<String> userlist = DataAccessLayer.getuserdetails(al2);

        	/* Set<Integer > userlist = new HashSet<Interger>(userlist1); */
        %>

<div>

	<div id="main" style="height:100px;">
		
		<!--close menubar-->
		</nav>
		</header>
		
			<div align="left" style="padding: 15px;
    margin-top: 141px;margin-bottom:100px;
    font-style: normal;height:1000px;">
		${errorMessage}
		<%-- <h2>
			Welcome
			<%=u.getFirstname()%></h2> --%>
		<br> <br>
			
			
	 <form method="post" action="FileUpload1" enctype="multipart/form-data" style="  margin-left: 135px;
    padding: 20px;">
			
			
			<div  style="height: 500px;    padding-top: 25px;
			 width: 1050px; background-color:#cff2f3b0;  margin-left: 3px;margin-top: -60px;">
             
            <br>
               
            <div  align="left" style="height: 400px;width: 480px;     padding: 20px;background-color: honeydew; margin-left: 32px; text-align: center;" >
			<h2 style="">Select File To Upload</h2>
			<br>
		
			&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black">Select File :</span>
		    <input type="file" name="fileField" id="fileField" /><br><br>
			
			<span>Subject Name :</span>
			<input type="text" name="description" /><br><br>
			<span style="margin-left:-48px;">(Example:-ABC.txt)</span><br>	
			
			</div>
			
			
			
			
			<div style="height: 400px;
    width: 480px;
    background-color: #f0fff0;
    margin-left: 539px;
    margin-top: -400px;
    padding: 20px;">
			<h2 style="text-align: center;">Select User:</h2>
			
			 <h3>&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;
			 Group Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="background-color:lime;"> "<%=cname %>"</font></h3>
			<div class="ex1">
			<% for(int i=0;i<userlist.size();i++)
              {
	           
				
				
				if( userlist.size()==20 )
				{ %>
											
										
				
<center><span style="margin-left: 35px;margin-top:10px;"><h3 style="margin-top:82px;">YOU EXCCED THE LIMIT OF USERS IN GROUP</h3></span></center>
  

   <% break;} else {%>
			
			
			
			
			 <label class="container"><span style="margin-left: 35px;"><%=userlist.get(i)%></span>
   <input type="checkbox" style=" margin-top: -44px;
    margin-left: 484px;" name="names" value="<%=al2.get(i)%>">
   <%-- <input type="hidden" name="names" value="<%=u.getUser_id()%>">
  --%> <span class="checkmark"></span>
   </label>
			
			
			
			
			
			
    <% } %> 
 	<%} %> 		
		
	</div>	<input type="checkbox"  onclick="toggle(this);" />Check all?<br />	
			</div>
				<input  class="btn1" type="submit" value="Save to Cloud" name="upload" id="upload"  style="margin-left:700px;"/>			
			</div>
			
			
			<%-- <table style="margin-left: 100px; background:#ece4e4b5; color: white;" >
				<input type="hidden" name="userid" value=<%=u.getUser_id()%>>
				<tr>
					<td style="color: black">Select File :</td>
					<td><input type="file" name="file" id="file" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="color: black">FileName :</td>
					<td><input type="text" name="description" /> 
					<br>
					(eg,ABC.txt)</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Upload"
						name="upload" id="upload" /></td>
				</tr>
			</table> --%>
			
			
			
			
		</form>
	</div>
		

	</div>
	</div>
</body>


</html>