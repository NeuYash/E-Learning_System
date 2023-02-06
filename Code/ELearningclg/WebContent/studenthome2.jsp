<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Testinfo"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DBConnnection"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<html lang="en">

<head>
  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/slitslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
   <link rel="icon" href="images/favicon.png" type="image/png">
  <link href="skins/default.css" rel="stylesheet" />
  	
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
   <link rel="icon" href="images/favicon.png" type="image/png">

  <style>
  table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 2px solid #dddddd;
  text-align: center;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}


.paginate_button {
  border-radius: 0 !important;
} 
  
  
.headnav1 {
    float: right;
    margin: 0px 0 0 0;
    border-bottom: 1px dotted #e6e6e6;
}
.demo-2 .sl-slider h2, .demo-2 .sl-slider blockquote {
    padding: 170px 5px 10px 100px;
    font-family: cursive;
    max-width: 960px;
    color: #fff;
    margin: 0 auto;
    position: relative;
    z-index: 100;
} */
  </style>
  
 <%--  <%
  
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);

      if(session.getAttribute("id")==null)
      {
    	  response.sendRedirect("index.jsp");
    	  return;
      } 
%> --%>

</head><body style="width: 100%; height: 100%; background-image: url(images/ed2.jpeg); background-repeat: no-repeat; background-size:cover; ">

 <%

int id=(int)session.getAttribute("uid");
System.out.print("ID========================>>>>>"+id);
String dept=session.getAttribute("dept").toString();
System.out.println("ala ka Test Madhe"+dept);
 
%> 

  <div id="wrapper">
 <header>
      <div class="container">
          <div class="span12"><div class="headnav1"></div></div>
    
        <div class="row">
          <div class="span4">
            <div class="logo1">
              <a href="#"><img src="img/logo_final.png" style="height:90%;
    width:43%;"alt="" class="logo1" /></a>
              
            </div>
          </div>
         
            
    <section id="bottom">
      <div class="container">
        <div class="row">
          <div class="span12" style="width: 1237px;">
            <div class="aligncenter">
              <div id="twitter-wrapper" style="text-align: center; width: 88%; margin: 0 auto;">
             <!-- <h3 align="left" style="margin-left: -150px;"> All Subjects Assignments:</h3>
                <div id="twitter"> -->
     
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
   
  </div>
 
			<header id="header">
				<div class="header-top">
					<div class="container" >
			  		<div class="row align-items-center">
			  			<div class="col-lg-6 col-sm-6 col-6 header-top-left">
			  				<ul>
			  					
			  				</ul>			
			  			</div>
			  			<div class="col-lg-6 col-sm-6 col-6 header-top-right">
							<div class="header-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-dribbble"></i></a>
								<a href="#"><i class="fa fa-behance"></i></a>
							</div>
			  			</div>
			  		</div>			  					
					</div>
				</div>
  	<div class="container main-menu" >
					<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo">
<!-- 				        <a href="index.html"><img src="img/logo4.png" alt="" title="" /></a>
 -->				        
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          
				          <!-- <li class="#"><a href="">Blog</a>
				            <ul>
				              <li><a href="#">Blog Home</a></li>
				              <li><a href="#">Blog Single</a></li>
				            </ul>
				          </li> -->	
				          <!-- <li class="#"><a href="">Pages</a>
				            <ul>
				            	  <li><a href="#">Elements</a></li>
						          <li class="#"><a href="">Level 2 </a>
						            <ul>
						              <li><a href="#">Item One</a></li>
						              <li><a href="#">Item Two</a></li>
						            </ul>
						          </li>					                		
				            </ul>
				          </li>					          					          		          
				          <li><a href="contact.html">Contact</a></li> -->
				        </ul>
				      </nav><!-- #nav-menu-container -->					      		  
					</div>
				</div>
			</header><!-- #header -->	          
  	          
  	    <%
  	    
  //	ArrayList<Testinfo> list=DBConnection.getTestName(Integer.parseInt(session.getAttribute("tlid").toString()));
  	  /* int teachid=Integer.parseInt(session.getAttribute("teacherid").toString());
   	   System.out.print("\nteacher id in studenthome============================================= =>>>"+teachid); */
   	ArrayList<Testinfo> list=DBConnnection.gettestdata5();
   	   
   	   
	  	
  	    %>      <a href="welcome.jsp">	<button style="width: 88px;height: 36px; background-color: lavender; border-radius: 10px;    font-size: 16px; color: black; font-family: auto;" type="submit" name="back" >Back</button></a>
			       	            <a href="index.jsp"><button style="width: 88px;height: 36px; margin-left:960px;background-color: lavender; border-radius: 10px;    font-size: 16px; color: black; font-family: auto;" type="submit" name="back" >Logout</button></td></a>
			     
  	           <h1 style="margin-left:440px; margin-top: -15px;color: black;" >Welcome To Exam</h1>
  	 <table id="example" class="display" style="width:70%; margin-left: 180px;margin-top: 90px;opacity: 0.8;color: black; font-family: serif; font-size: 19px;">
        <thead style="background-color: beige;color: black; font-family: serif; font-size: 20px;">
            <tr style="text-align: center;background:#a7a5a4;">
                             <!-- <th>Id</th>-->
							<th>Test Name</th>
							<!-- <th>Create Timing</th>
							<th>Create Date</th> -->
							<th>Start</th>
							
            </tr>
        </thead>
        <tbody>
        
          <% for(Testinfo obj:list)
          {
        	  
        	  int Count=DBConnnection.getTestCount1(id,obj.getTestid());
    		  System.out.print("\ncount========"+Count+"\n"+obj.getTestid() );
    		 

          %>
           <% if(dept.equals(obj.getDept())) {%>
            <tr style="background-color:white;color: black;">
            
			         <!--<td align="center"><span><%=obj.getTestid()%></span></td>-->
			         <td align="center"><span><%=obj.getTname()%></span></td>
			        <%--  <td align="center"><span><%=obj.getCtime()%></span></td>
			         <td align="center"><span><%=obj.getCdate()%></span></td> --%>
			         

					<% if(Count==3)
								{
							%>
					<form action="InfoController" method="post"> 
					<td align="center">
					<button disabled style="width: 92px;height: 45px; background-color: lavender; border-radius: 10px;    font-size: 16px; color: black; font-family: auto;" type="submit" name="stest" value="<%=obj.getTestid()%>">Attempts Are Over </button></td>
				    </form>
				    <%
								}
							else{
							%>
				    
				    
				    
				    <form action="InfoController" method="post"> 
					<td align="center">
					<button style="width: 88px;height: 36px; background-color:lime; border-radius: 10px;    font-size: 16px; color: black; font-family: auto;" type="submit" name="stest" value="<%=obj.getTestid()%>">Start</button></td>
				    </form>
				    
				   <% } %>
				     <% } %>
				    
				    
                   </tr>
					            
          <% 
          System.out.print("\nTestID==========>>>"+obj.getTestid());
          
          
          
          
          }%>
            
        </tbody>
        <tfoot>
           
        </tfoot>
    </table>
		          
  	          
  	          
                
  
              
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
  
  
  
  <script>





</script>



  
  
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="js/jquery.fancybox.pack.js"></script>
  <script src="js/jquery.fancybox-media.js"></script>
  <script src="js/google-code-prettify/prettify.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>
  <script src="js/jquery.flexslider.js"></script>
  <script src="js/jquery.nivo.slider.js"></script>
  <script src="js/modernizr.custom.js"></script>
  <script src="js/jquery.ba-cond.min.js"></script>
  <script src="js/jquery.slitslider.js"></script>
  <script src="js/animate.js"></script>

  <script src="js/custom.js"></script>

</body>
</html>






