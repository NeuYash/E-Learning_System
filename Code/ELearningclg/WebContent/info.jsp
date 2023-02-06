<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>

<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		 <link rel="icon" href="images/favicon.png" type="image/png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Exam-Tech</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/jquery-ui.css">				
			<link rel="stylesheet" href="css/nice-select.css">							
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">				
			<link rel="stylesheet" href="css/main4.css">
			



<%

HttpSession session1=request.getSession(false);  
//String n=(String)session.getAttribute("tid"); 
int n=Integer.parseInt(session.getAttribute("tid").toString());
System.out.println("Test Id in Info===========>>>"+n);

%>


</script>


</head>
<body style="width: 100%; height: 100%; background-image: url(images/ed4.jpg); background-repeat: no-repeat; background-size:cover;">


				          		          
				  
				





<script>
<!--
timer(); // call timer() after page is loaded
//-->
</script>




 
<!-- <div  style="width: 1363px;background-color:#ff5b0073; margin-left:-7px; height: 800px;" >
 --> 
 <br><br><br><br><br><br><br><br>
<div style="width: 800px;  height: 410px; margin-left: 130px; ">
<!-- <input type="submit" value="Test Direction" style=" margin-left: 310px; width: 160px; height: 45px; margin-top: -106px; background-color: #00ffc1b0; border-radius:20px; font-size:15px;">
 -->

<div style=" height:2px; width: 780px; background-color: black; margin-left:10px;margin-top:-10px;"></div>
<p style="font-size:18px; margin-left: 50px; font-style:bold; color: black; font-size:18px;"><b>Instructions:</b> </br></br>

1.Each module has a fixed number of questions .</br></br>
2.You may tack an emergency break at any other time.however time will not stop in such cases.</br></br>
3.Be at your seat until the completion of the exam.Don't talk and do not indulge any cheating. your condiature may be canceled for any infractions.</br></br>
4.In case of any problem with the question please. note down it for share it with us with email after you finish your test.</br>
5.Only Three Attempts are allowed per test.</br>
</p>



</div>
<form action="StartTestController">

<input type="submit" value="Proceed" onclick="un()"  style="margin-left: 450px; width: 160px; height: 45px; margin-top: -61px; background-color: #0000009c; border-radius:20px; color: white; font-size:15px;">
 </form>
 </div>
 <br>
 <div style=" height:2px; width: 780px; background-color: black; margin-left:130px;margin-top:-129px;"></div>
</div>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">function  un(){
	  localStorage.clear();
}
</script>

</body>
</html>