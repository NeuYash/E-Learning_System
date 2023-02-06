<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" href="images/favicon.png" type="image/png">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="js/script.js"></script>
   <title>CSS MenuMaker</title>

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

<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	<link rel="stylesheet" type="text/css" href="engine0/style.css" />
	<script type="text/javascript" src="engine0/jquery.js"></script>
	<!-- End WOWSlider.com HEAD section -->
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	<link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<!--script type="text/javascript" src="engine1/jquery.js"></script-->
	<!-- End WOWSlider.com HEAD section -->
	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	<link rel="stylesheet" type="text/css" href="engine0/style.css" />
	<!--script type="text/javascript" src="engine0/jquery.js"></script-->
	<!-- End WOWSlider.com HEAD section --></head>
	
<link href="http://fonts.googleapis.com/css?family=Tangerine" rel="stylesheet" type="text/css" />
<style>

#main{
color:red;
font-family: 'Tangerine', serif;
font-size: 70px;
align:center;
font-weight: 900;
color:blue;
}
</style>
	
<body>
<div >


</div>

<div id='cssmenu' style="height: 90px;">
<ul style="margin-left: 1000px;"></br>
   <li><a href='#'><span>Home</span></a></li>
   <li class='active has-sub'><a href='#'><span>Operations</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Upload Data</span></a>
          <li class='has-sub'><a href='#'><span>Download Data</span></a>
          <li class='has-sub'><a href='#'><span>Add Category</span></a>
          <li class='has-sub'><a href='#'><span>Delete Data</span></a>
          <li class='has-sub'><a href='#'><span>Grant Permission</span></a>
          <li class='has-sub'><a href='#'><span>Revoke Permission</span></a>
          
          </ul>
   <li class='last'><a href='index.jsp'><span>Logout</span></a></li>

</ul>
</div>
<div style="background-color: skyblue; height: 505px; width: 1350px;">



</div>








</body>
<html>
