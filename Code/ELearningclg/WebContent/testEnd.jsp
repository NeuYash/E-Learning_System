<%@page import="com.model.*"%>
<%@page import="com.controller.*"%>
<%@page import="com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%> 
<%@page import="com.utility.*"%>  
<%@page import="java.util.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="icon" href="images/favicon.png" type="image/png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>



table {
  border-collapse: collapse;
  border-spacing: 10;
  width: 100%;
  height:50px;
  border: 30px solid fuchsia;
}

 td {
  text-align: center;
padding:50px;
  
}


 







tr:nth-child(even) {
  background-color: #f2f2f2
}

.fa-check {
  color: green;
}

.fa-remove {
  color: red;
}

  
</style>
<script type="text/javascript">
if ( window.history.replaceState ) {
	  window.history.replaceState( null, null, window.location.href );
	 
	}
</script>
    
</head>

<body style="background-image: url(images/ed6.jpg); background-repeat: no-repeat; background-size:cover;" onkeydown="return (event.keyCode == 154)">


<%

int tid=Integer.parseInt(session.getAttribute("tid").toString());
int uid=Integer.parseInt(session.getAttribute("uid").toString());

//int ans=Integer.parseInt(session.getAttribute("ans").toString());
//int ans=Integer.parseInt(session.getAttribute("ans").toString());
//int ans=6,notans=4;
int ans=Integer.parseInt(session.getAttribute("ans").toString());
System.out.println("Total answercount"+ans);
int notans=Integer.parseInt(session.getAttribute("notans").toString());
System.out.println("TotalUnanswercount"+notans);
Map<Integer, String> answerlist=(Map<Integer, String>)session.getAttribute("answerlist");
System.out.println("Test End"+answerlist);
Map<Integer, UserTestInfo> map =(Map<Integer,UserTestInfo>)session.getAttribute("map");
int marks=MachResult.getResult(answerlist,map);
DBConnnection.setTestInfo(tid,uid,answerlist);
DBConnnection.setTestResult(tid,uid,marks);






%>


<header id="header">
				<div class="header-top">
					<div class="container">
			  		<div class="row align-items-center">
			  			<div class="col-lg-6 col-sm-6 col-6 header-top-left">
			  				<ul>
			  					
			  				</ul>			
			  			</div>
			  			<!-- <div class="col-lg-6 col-sm-6 col-6 header-top-right">
							<div class="header-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-dribbble"></i></a>
								<a href="#"><i class="fa fa-behance"></i></a>
							</div> -->
			  			</div>
			  		</div>			  					
					</div>
				</div>
				
			</header><!-- #header -->
	
	<center>
		<br>
		<a href="welcome.jsp" ><u style="color:white;font-size: 18px;    margin-left: 1110px;"  onclick="un()">HOME</u></a>
 	 <!-- <h1 style="color:black;font-size:67px;margin-top: 174px;">Thank you!!!! </h1> -->
        <%
  	    
  
        ArrayList<userModel> list=DBConnnection.getuser(uid);	

        System.out.print("\n user id in TestEnd ============================================= =>>>"+uid); 
   	
   	   
	  	
  	    %>

 	
		


				<div style="margin-left:150px;margin-right:150px;margin-top:0px;background-color:mediumorchid;height:290px;">
  <h2  style="color:white;margin-top:50px;">Result  Table</h2>
<div style="background-color:white;" >
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th style="text-align:center;">Full Name</th>
        
        <th style="text-align:center;">Department</th>
        <th style="text-align:center;">Marks</th>
        <th style="text-align:center;">Answerd  Quetions</th>
        <th style="text-align:center;"> Not Answerd  Quetions</th>
        <th style="text-align:center;">Result</th>
      </tr>
    </thead>
    
    <% for(userModel obj:list)
          {
        	  
        	 

          %>
            <tr >
            
			        
			         
                                   <td > <%=obj.getFirstName() %> &nbsp;&nbsp;<%=obj.getLastName()%></td>
                                 
                                   <td ><%=obj.getdept()%></td>
                                   <td ><%= marks%>/10</td>
                                   <td ><i class="fa fa-check">&nbsp;&nbsp;<%=ans%> </td>
                                   <td > <i class="fa fa-remove"> &nbsp;&nbsp;<%=notans%> </td>
    
    
                                    <%if(marks>=4){ %>
				                    <td >Pass <i class="fa fa-check">&nbsp;&nbsp;</td> 
				          <%} else { %>
				          
				          <td >&nbsp;&nbsp;Fail <i class="fa fa-remove">&nbsp;&nbsp;</td> 
				          <%} %>
				          
                   </tr>
      <% } %>
 
  </table>
  <div>
</div>

</div>
</div>


</div>
</div>
	<br>
        <br><br><br><br><br><br><br>
       

<%-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <div id="piechart" style="width: 500px;height: 500px;margin-bottom:10px;margin-top:-100px;"></div>
   <script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	   
    	  
    	  var i1=<%=ans %>;
    	  var j1=<%=notans%>;
    	 
    	  
    	  
        var data = google.visualization.arrayToDataTable([
          ['Result', 'Total'],
          ['ANSWERD',     i1],
          ['NOT ANSWERD', j1],
          
        ]);

        var options = {
          title: 'TOTAL RESULT'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      </script>
    
     --%>
    
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
<script type="text/javascript">  
    $(function () {  
        $(document).keydown(function (e) {  
            return (e.which || e.keyCode) != 116;  
        });  
    });  
    
    
</script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">function  un(){
	  localStorage.clear();
}
</script>
</body>

</html>