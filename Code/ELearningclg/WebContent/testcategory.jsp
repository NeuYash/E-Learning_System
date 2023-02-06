<!DOCTYPE html>
<%@page import="com.model.*"%>
<%@page import="com.DAO.*"%>

<%@page import="com.utility.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>

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
  
  <link href="skins/default.css" rel="stylesheet" />
  	
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="icon" href="images/favicon.png" type="image/png">

  <style>
  
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
}
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

</head><body background="img/edu3.jpg" style="background-size: cover;    margin-top: 41px;">


  <div id="wrapper">
 <header>
      <div class="container">
          <div class="span12"><div class="headnav1"></div></div>
    
        <div class="row">
          <div class="span4">
            <div class="logo1">
              
            </div>
          </div>
         
              <!-- end navigation -->
              
                   <!--  <p class="aligncenter margintop20">
                      Forgot password? <a href="#myReset" data-dismiss="modal" aria-hidden="true" data-toggle="modal">Reset</a><br><br>
                      <a href="#teacherSignin" data-dismiss="modal" aria-hidden="true" data-toggle="modal" ></a> 
                   <a href="#companySignin" data-dismiss="modal" aria-hidden="true" data-toggle="modal"></a>
                    </p> -->
                  </div>
                </form>
              </div>
            </div>
            
            </div>
          </div>
        </div>
      </div>
    </header> 
   
   
             
                
              

 <%
  	    
	  	List<TeacherInfo> list=DBConnnection.gettestdata();

  	    %>      
  	          
  	<table id="example" class="display" style="width:68%; margin-left: 195px;margin-top: 61px;color: black; font-family: serif; font-size: 17px;">
        <thead style="background-color: beige;color: black; font-family: serif; font-size: 18px;">
            <tr style="text-align: center;background:#a7a5a4;">
                             <!-- <th>Id</th>-->
							<th>ID</th>
							<th>Teacher Name</th>
							<th>Start</th>
							
            </tr>
        </thead>
        <tbody>
        
          <% for(TeacherInfo obj:list)
          {
          %>
            <tr style="background-color:white;color: black;">
            
			         <td align="center"><span><%=obj.getTid()%></span></td>
			         <td align="center"><span><%=obj.getTeacherfname()%>&nbsp;&nbsp;<%=obj.getTeacherlname()%></span></td>
			         

					
					<form action="TestCategoryController" method="post"> 
					<td align="center">
					<button style="width: 88px;height: 36px; background-color: lavender; border-radius: 10px;    font-size: 16px; color: black; font-family: auto;" type="submit" name="teacherid" value="<%=obj.getTid()%>">Start</button></td>
				    </form>
                   </tr>
					            
          <% 
          System.out.print("\nTestID==========>>>"+obj.getTid());
          }%>
            
        </tbody>
        <tfoot>
           
        </tfoot>
    </table>
  
 	          
                
  </div>
              
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
  	
  	
  	
   
  
  <script>


function populate1(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Diploma"){
		var optionArray = ["|Select Stream|Select Stream","Computer Science|Computer Science","Civil|Civil","ENTC|ENTC","Electrical|Electrical,Mechanical|Mechanical","Mechanical Design|Mechanical Design","Information Technologies|Information Technologies"];
	} else if(s1.value == "BE"){
		var optionArray = ["|Select Stream|Select Stream","Computer Science|Computer Science","Civil|Civil","Electronics & Telicummunication|Electronics & Telicummunication","Electrical|Electrical,Mechanical|Mechanical","Mechanical Design|Mechanical Design","Information Technologies|Information Technologies"];
	} 
	else if(s1.value == "ME"){
		var optionArray = ["|Select Stream|Select Stream","Computer Application|Computer Application","Civil Specialization|Civil Specialization","Electronics & Telicummunication|Electronics & Telicummunication","Electrical Specialization|Electrical Specialization,Mechanical Specialization|Mechanical Specialization","Mechanical Design|Mechanical Design","Information Technologies|Information Technologies"];
	}
	else if(s1.value == "BCA"){
		var optionArray = ["|Select Stream|Select Stream","Computer Graphics|Computer Graphics","Computer Application Design|Computer Application Design","Mechanical|Mechanical","Mechanical Design|Mechanical Design","Information Technologies|Information Technologies"];
	}
	else if(s1.value == "MCA"){
		var optionArray = ["|Select Stream|Select Stream","Computer Science|Computer Science","Civil|Civil","Electronics & Telicummunication|Electronics & Telicummunication","Electrical|Electrical,Mechanical|Mechanical","Mechanical Design|Mechanical Design","Information Technologies|Information Technologies"];
	}
	for(var option in optionArray){
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}


function populate2(s1,s2){
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Information Technologies"){
		var optionArray = ["|C Programing|C Programing","CPP|CPP","JAVA|JAVA","PHP|PHP","HTML|HTML","CSS|CSS","Python|Python",];
	} else if(s1.value == "Computer Science"){
		var optionArray = ["|C Programing|C Programing","CPP|CPP","DotNet|DotNet","Computer Fundamental|Computer Fundamental","JAVA|JAVA","PHP|PHP","HTML|HTML","CSS|CSS","Python|Python",];
	} 
	else if(s1.value == "ENTC"){
		var optionArray = ["|C Programing|C Programing","Embeded Programing|Embeded Programing","Microprocesor|Microprocesor","Digital Electronics|Digital Electronics",];
	} 
	
	else if(s1.value == "Civil"){
		var optionArray = ["|Option1|Option1","Option2|Option2","Option3|Option3","Option4|Option4",];
	} 
	for(var option in optionArray){
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}

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