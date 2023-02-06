<%@page import="com.model.UserTestInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
    
 <%@page import="java.util.Collections" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
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
			<link rel="stylesheet" href="css/main.css">

<style>
.white1{

color:black;
    font-size: 20px;
}

textarea.Whiteboard{
  resize: none;
  background-color: violet;
  border: none;
  height: 80px;
  width: 870px;
  font-size: 19px;
  color:black;
  font-family: sans-serif;
  white-space:inherit;
 text-align: auto;
  -moz-text-align-last: center;
  text-align-last: auto;
  margin-left: 20px;
   margin-top: 20px;
    padding: 20px;
}

radio{
  font-family: "Times New Roman", Times, serif;
}

* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
  
  flex: 50%;
  padding: 10px;
  height: auto; /* Should be removed. Only for demonstration */
}


.row {
  display: flex;
}

.myclass{
  background-color:green !important;
}

</style>
<script type="text/javascript">
var clicks = 0;
function onClick() {
    clicks += 1;
    document.getElementById("clicks").innerHTML = clicks;
};


		</script>	 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">





 
 
 
 
</script>


</head>




<body style="width: 100%; height: 100%; background-image: url(images/ed5.jpg); background-repeat: no-repeat; background-size:cover;">


<% 

Map<Integer, UserTestInfo> map =(Map<Integer,UserTestInfo>)session.getAttribute("map");

//this ArrayList is for question link		
ArrayList<Integer> questionids=new ArrayList<>(map.keySet());

System.out.println("outids"+questionids);


//Map.Entry<Integer, String> entry = map.entrySet().iterator().next();

int keyid=(int)session.getAttribute("keyset");

Map<Integer, String> answerlist=(Map<Integer, String>)session.getAttribute("answerlist");



/*This code is For Null Count*/

int count1 = Collections.frequency(answerlist.values(),"NA"); 
System.out.println("null Count"+count1);
int tot=count1;
System.out.println("Total Unanswer count"+tot);
int an=10;
int count2 = an-tot;
System.out.println("Total Ans Count"+count2);


/*Session For Count */
session.setAttribute("ans",count2);

session.setAttribute("notans",tot);



/*This is For Quetion NO */



int qnumber=(int)session.getAttribute("qestionnumber");
System.out.println("out"+answerlist+"qnumber"+qnumber);

%>
		


	
			
			
		
	
          <br><br><br><br> <br><br>
        
       <!----------MCQ ------------------------ -->
             <div class="row" style="margin-bottom:30px;margin-top: -50px;">
                   <div class="column" >
                       <div style="height: 450px;background:white; width: 900px; margin-left: 420px; margin-top: 20px" align="left">   
		                     <form action="StartTestController" method="post">
		                           <input type="hidden" value="<%=keyid%>" name="qid">

			
			
                       <!-- this is for Question -->
             <% UserTestInfo obj=(UserTestInfo)map.get(keyid);
            	
            		  
            		  
             %>
			<!--  <input type="text"  value="Q<%=qnumber%>.<%=obj.getQname()%>" name="question" disabled="disabled" style="width: 843px; height: 70px; margin-left: 30px; font-size: 20px; color: black; background-color: lightblue; margin-top: 30px;"></br>-->
			
			<textarea class="Whiteboard"  name="question"  disabled="disabled">
            Q<%=qnumber%>.<%=obj.getQname()%></textarea>
			
			<div class="white1">
			
          <%  if(qnumber==1) { %>
          
          
          
         
          
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save();color1()" id="option1" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input  onclick="save();color1()" type="radio" name="option"  id="option2" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save();color1()" type="radio" name="option"  id="option3" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save();color1()"  type="radio" name="option"  id="option4" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			 <!--  <button type="button" onclick="save()" >save</button>-->
			<!--  <input onclick="save()"  type="submit" value="Save & Next" name="submit" style="width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 180px; right: -300px; border-radius: 7px; background-color: lightblue; font-weight: bold; font-size: 16px;">-->
			
			
<!-- 			<input onclick="save()"  type="submit" value="Save" name="submit" style="width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 180px; right: -300px; border-radius: 7px; background-color: lightblue; font-weight: bold; font-size: 16px;"> 
 -->			<input   type="submit" value="Next" name="submit" style="width: 120px; height: 40px; position: relative; top: 70px; left: 200px; right: -300px;  border-radius: 26px; font-size: 16px;background-color:wheat;color:black;">
			
			<% } %>
			
			 <%if(qnumber==2) {%>
			
			
			
			
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save1();color2()"  id="option11" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save1();color2()" type="radio" name="option"  id="option12" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save1();color2()" type="radio" name="option"  id="option13" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save1();color2()" type="radio" name="option"  id="option14" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			<input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			<% } %>
			
			
			 <%  if(qnumber==3) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input  onclick="save2();color3()" id="option21" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input  onclick="save2();color3()" type="radio" name="option"  id="option22" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input  onclick="save2();color3()" type="radio" name="option"  id="option23" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save2();color3()" type="radio" name="option"  id="option24" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			 <input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			<% } %>
			
			
			 <%  if(qnumber==4) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save3();color4()"  id="option31" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save3();color4()" type="radio" name="option"  id="option32" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save3();color4()" type="radio" name="option"  id="option33" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save3();color4()" type="radio" name="option"  id="option34" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			<input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color: wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			<% } %>
			
			 <%  if(qnumber==5) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save4();color5()" id="option41" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save4();color5()" type="radio" name="option"  id="option42" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save4();color5()" type="radio" name="option"  id="option43" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input onclick="save4();color5()"  type="radio" name="option"  id="option44" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			 <input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			 
			<% } %>
			
			 <%  if(qnumber==6) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save5();color6()" id="option51" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save5();color6()" type="radio" name="option"  id="option52" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save5();color6()" type="radio" name="option"  id="option53" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
            
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save5();color6()" type="radio" name="option"  id="option54" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			
			 <input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			
			<% } %>
			
			
			
			 <%  if(qnumber==7) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save6();color7()" id="option61" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save6();color7()" type="radio" name="option"  id="option62" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save6();color7()" type="radio" name="option"  id="option63" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save6();color7()"  type="radio" name="option"  id="option64" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			 
			<input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			
			<% } %>
			
			
			
			 <%  if(qnumber==8) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save7();color8()"  id="option71" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save7();color8()" type="radio" name="option"  id="option72" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save7();color8()" type="radio" name="option"  id="option73" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input onclick="save7();color8()" type="radio" name="option"  id="option74" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			 <input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			<% } %>
			
			
			<%  if(qnumber==9) {%>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input onclick="save8();color9()" id="option81" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input onclick="save8();color9()" type="radio" name="option"  id="option82" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input onclick="save8();color9()" type="radio" name="option"  id="option83" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input  onclick="save8();color9()"  type="radio" name="option"  id="option84" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			<input   type="submit" value="Next" name="submit" style="border-radius: 26px; font-size: 16px;background-color:wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px;">
			
			<% } %>
			
			
			
	    	<%  if(qnumber==10) {%>
				
		<!-- <form method="get" action="lastquetioncontroller">-->
			
			
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
              
              <input  id="option91" onclick="save9();color10()" type="radio" name="option"  value="<%=obj.getOption1()%>" >  &nbsp;&nbsp;<%=obj.getOption1()%><br><br>
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
             <input  type="radio"    onclick="save9();color10()"  name="option"  id="option92" value="<%=obj.getOption2()%>"> &nbsp;&nbsp;<%=obj.getOption2()%> <br><br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input  type="radio"   onclick="save9();color10()" name="option"  id="option93" value="<%=obj.getOption3()%>"> &nbsp;&nbsp;<%=obj.getOption3()%> <br>  <br>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input   type="radio"  onclick="save9();color10()"   name="option"  id="option94" value="<%=obj.getOption4()%>"> &nbsp;&nbsp;<%=obj.getOption4()%> <br> 
			
			
			  <input   type="submit" value="Next" name="submit"  disabled="disabled" style="border-radius: 26px; font-size: 16px;background-color: 	wheat;color:black;width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 200px; right: -300px; ">
			 
	<input type="submit" value="Save Test"  name="submit"  style="width: 130px; height: 40px; position: relative; transition: .5s ease; top:70px; left: 230px; right: -300px; border-radius: 7px; font-size: 16px;background-color: wheat;
    border-radius: 20px;
    color: black;
    font-size: 15px;">
			
			<% } %>
			
			
			
			</div>
			

			<!-- This is for Answer -->
			<!--<textarea rows="2" cols="50" name="answer" style="width: 839px; height: 350px; margin-left: 30px; background: darkslategray;color: white;  ">
             <%=answerlist.get(keyid)%></textarea>-->
               
           

			<!-- This is for Next Button -->
			
			
			
			<!--  <input  onclick="save()"  type="submit" value="Save & Next" name="submit" style="width: 120px; height: 40px; position: relative; transition: .5s ease; top: 70px; left: 180px; right: -300px; border-radius: 7px; background-color: lightblue; font-weight: bold; font-size: 16px;">-->
		    </form> 
		
		<!-- Mark -->
		 <form action="StartTestController" method="post">
		
	   
	     <!-- PREV -->
	     
	    
		
			<input type="hidden" value="<%=keyid%>" name="qid">
			<input type="hidden" name="question" value="<%=map.get(keyid)%>">
            <input type="hidden" name="answer" value="<%=answerlist.get(keyid)%>">
          
			 <%  if(qnumber <=1)
          {
        	 
 	        
          }
         else 
         {
        
         }
         %>
	 <input type="submit" value="Submit Test"  name="submit"  style="width: 130px; height: 40px; position: relative; transition: .5s ease; top:30px; left: 520px; right: -300px; border-radius: 7px; font-size: 16px;background-color: wheat;
    border-radius: 20px;
    color: black;
    font-size: 15px;">
    
	</form>
	<form>
	   
	    
	    </form>
	    
	   
	    
	     
	    
	    </div>
	
	</div>
	
	
	
		
<!--  <h3 style="margin-left:50px;"> Answered Quetions</h3><input type="submit" value="${TotalAnsCount}" style="background-color: green; color: white; width: 50px; height: 30px; border-radius:7px; margin-left:290px;margin-top:-45px">	
 <h3 style="margin-left:50px;" >UnAnswered Quetions</h3><input type="submit" name="ok" value="${TotalUnanswercount}" style="background-color: red; color: white; width: 50px; height: 30px; border-radius:7px; margin-left:320px;margin-top:-45px">	
  -->
  
   <!--   <input type="radio" id="one">op</input>
   <button type="button" onclick="save()" >save</button>-->

  </div>
	
   
	
	
  </div>
  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  
  
  <script type="text/javascript">
 
 
  
  function save()
  {
 	  
 	 //this is for   Quetion1 
 	  var radio=document.getElementById("option1");
 	  localStorage.setItem("option1",radio.checked);
 	  
 	 var radio=document.getElementById("option2");
  	  localStorage.setItem("option2",radio.checked);
  	  
  	 var radio=document.getElementById("option3");
 	  localStorage.setItem("option3",radio.checked);
 	  
 	 var radio=document.getElementById("option4");
	  localStorage.setItem("option4",radio.checked);
 	 
	 /* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	  
	  
     
  }
  
  
  
  
  
  
  //Quetion 1
  var checked=JSON.parse(localStorage.getItem("option1"));
    document.getElementById("option1").checked=checked;
    
      
    var checked=JSON.parse(localStorage.getItem("option2"));
      document.getElementById("option2").checked=checked;
     
      
    
      var checked=JSON.parse(localStorage.getItem("option3"));
      document.getElementById("option3").checked=checked;
      
     
      
      var checked=JSON.parse(localStorage.getItem("option4"));
      document.getElementById("option4").checked=checked;

      
    
  /*
          
    */      
          
          //this funtion  for   clear   option button
        
function uncheck() {
			
			//localStorage.removeItem(keyname);
			
//Q1)
		var option1 = document.getElementById("option1");
		var option2 = document.getElementById("option2");
		var option3 = document.getElementById("option3");
		var option4 = document.getElementById("option4");
		var btn1 = document.getElementById("btn1");
		if(option1 && option2 && option3 && option4 && btn1 )
			{
			 
			localStorage.removeItem("option1");
			localStorage.removeItem("option2");
			localStorage.removeItem("option3");
			localStorage.removeItem("option4");
			localStorage.removeItem("btn1");
		 }
			
//Q2)
		var option11 = document.getElementById("option11");
		var option12 = document.getElementById("option12");
		var option13 = document.getElementById("option13");
		var option14 = document.getElementById("option14");
		var btn2 = document.getElementById("btn2");
		if(option11 && option12 && option13 && option14 && btn2)
			{
			 
			localStorage.removeItem("option11");
			localStorage.removeItem("option12");
			localStorage.removeItem("option13");
			localStorage.removeItem("option14");
			localStorage.removeItem("btn2");
		 }
		
		
//Q3)
		var option21 = document.getElementById("option21");
		var option22 = document.getElementById("option22");
		var option23 = document.getElementById("option23");
		var option24 = document.getElementById("option24");
		var btn3 = document.getElementById("btn3");
		if(option21 && option22 && option23 && option24 && btn3 )
			{
			 
			localStorage.removeItem("option21");
			localStorage.removeItem("option22");
			localStorage.removeItem("option23");
			localStorage.removeItem("option24");
			localStorage.removeItem("btn3");
		 }
		
//Q4)
		var option31 = document.getElementById("option31");
		var option32 = document.getElementById("option32");
		var option33 = document.getElementById("option33");
		var option34 = document.getElementById("option34");
		var btn4 = document.getElementById("btn4");
		if(option31 && option32 && option33 && option34 && btn4)
			{
			 
			localStorage.removeItem("option31");
			localStorage.removeItem("option32");
			localStorage.removeItem("option33");
			localStorage.removeItem("option34");
			localStorage.removeItem("btn4");
		 }	
		
//Q5)
		var option41 = document.getElementById("option41");
		var option42 = document.getElementById("option42");
		var option43 = document.getElementById("option43");
		var option44 = document.getElementById("option44");
		var btn5 = document.getElementById("btn5");
		if(option41 && option42 && option43 && option44 && btn5)
			{
			 
			localStorage.removeItem("option41");
			localStorage.removeItem("option42");
			localStorage.removeItem("option43");
			localStorage.removeItem("option44");
			localStorage.removeItem("btn5");
		 }	
			
//Q6)
		var option51 = document.getElementById("option51");
		var option52 = document.getElementById("option52");
		var option53 = document.getElementById("option53");
		var option54 = document.getElementById("option54");
		var btn6 = document.getElementById("btn6");
		if(option51 && option52 && option53 && option54 && btn6)
			{
			 
			localStorage.removeItem("option51");
			localStorage.removeItem("option52");
			localStorage.removeItem("option53");
			localStorage.removeItem("option54");
			localStorage.removeItem("btn6");
		 }		
	
		
//Q7)
		var option61 = document.getElementById("option61");
		var option62 = document.getElementById("option62");
		var option63 = document.getElementById("option63");
		var option64 = document.getElementById("option64");
		var btn7 = document.getElementById("btn7");
		if(option61 && option62 && option63 && option64 && btn7)
			{
			 
			localStorage.removeItem("option61");
			localStorage.removeItem("option62");
			localStorage.removeItem("option63");
			localStorage.removeItem("option64");
			localStorage.removeItem("btn7");
		 }	
		
		
//Q8)
		var option71 = document.getElementById("option71");
		var option72 = document.getElementById("option72");
		var option73 = document.getElementById("option73");
		var option74 = document.getElementById("option74");
		var btn8 = document.getElementById("btn8");
		if(option71 && option72 && option73 && option74 && btn8)
			{
			 
			localStorage.removeItem("option71");
			localStorage.removeItem("option72");
			localStorage.removeItem("option73");
			localStorage.removeItem("option74");
			localStorage.removeItem("btn8");
		 }				
		
		
//Q9)
		var option81 = document.getElementById("option81");
		var option82 = document.getElementById("option82");
		var option83 = document.getElementById("option83");
		var option84 = document.getElementById("option84");
		var btn9 = document.getElementById("btn9");
		if(option81 && option82 && option83 && option84 && btn9)
			{
			 
			localStorage.removeItem("option81");
			localStorage.removeItem("option82");
			localStorage.removeItem("option83");
			localStorage.removeItem("option84");
			localStorage.removeItem("btn9");
		 }	
		
		
		
//Q10)
		var option91 = document.getElementById("option91");
		var option92 = document.getElementById("option92");
		var option93 = document.getElementById("option93");
		var option94 = document.getElementById("option94");
		var btn10 = document.getElementById("btn10");
		if(option91 && option92 && option93 && option94 && btn10 )
			{
			 
			localStorage.removeItem("option91");
			localStorage.removeItem("option92");
			localStorage.removeItem("option93");
			localStorage.removeItem("option94");
			localStorage.removeItem("btn10");
		 }		
		
		
}

          
	  function  un(){
		  localStorage.clear();
	  }
	  
	  
	</script>	
	
	
	 
  <script type="text/javascript">
  function save1()
  {
	  var radio=document.getElementById("option11");
 	  localStorage.setItem("option11",radio.checked);
 	  
 	 var radio=document.getElementById("option12");
  	  localStorage.setItem("option12",radio.checked);
  	  
  	 var radio=document.getElementById("option13");
 	  localStorage.setItem("option13",radio.checked);
 	  
 	 var radio=document.getElementById("option14");
	  localStorage.setItem("option14",radio.checked);
	  
	  
	 
  } 
  
  
  //Quetion 2
  var checked=JSON.parse(localStorage.getItem("option11"));
    document.getElementById("option11").checked=checked;
    
      
    var checked=JSON.parse(localStorage.getItem("option12"));
      document.getElementById("option12").checked=checked;
     
      
    
      var checked=JSON.parse(localStorage.getItem("option13"));
      document.getElementById("option13").checked=checked;
      
     
      
      var checked=JSON.parse(localStorage.getItem("option14"));
      document.getElementById("option14").checked=checked;
  
  </script>
  
  <script type="text/javascript">
  function save2()
  {
	//this is for   Quetion3
	   var radio=document.getElementById("option21");
	  localStorage.setItem("option21",radio.checked);
	  
	 var radio=document.getElementById("option22");
 	  localStorage.setItem("option22",radio.checked);
 	  
 	 var radio=document.getElementById("option23");
	  localStorage.setItem("option23",radio.checked);
	  
	 var radio=document.getElementById("option24");
	  localStorage.setItem("option24",radio.checked);
	  
	 
  } 
  
  
//Quetion 3
  
  var checked=JSON.parse(localStorage.getItem("option21"));
document.getElementById("option21").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option22"));
  document.getElementById("option22").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option23"));
  document.getElementById("option23").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option24"));
  document.getElementById("option24").checked=checked;
  
  
  </script>
  
  <script type="text/javascript">
  function save3()
  {
	//this is for   Quetion4
	  
	   var radio=document.getElementById("option31");
	  localStorage.setItem("option31",radio.checked);
	  
	 var radio=document.getElementById("option32");
 	  localStorage.setItem("option32",radio.checked);
 	  
 	 var radio=document.getElementById("option33");
	  localStorage.setItem("option33",radio.checked);
	  
	 var radio=document.getElementById("option34");
	  localStorage.setItem("option34",radio.checked);
	  
	  
	 
  } 
  
  //Quetion 4
          
          var checked=JSON.parse(localStorage.getItem("option31"));
        document.getElementById("option31").checked=checked;
        
          
        var checked=JSON.parse(localStorage.getItem("option32"));
          document.getElementById("option32").checked=checked;
         
          
        
          var checked=JSON.parse(localStorage.getItem("option33"));
          document.getElementById("option33").checked=checked;
          
         
          
          var checked=JSON.parse(localStorage.getItem("option34"));
          document.getElementById("option34").checked=checked;
          
 </script>
  
  <script type="text/javascript">
  function save4()
  {
	  //this is for   Quetion5
	  
	   var radio=document.getElementById("option41");
	  localStorage.setItem("option41",radio.checked);
	  
	 var radio=document.getElementById("option42");
 	  localStorage.setItem("option42",radio.checked);
 	  
 	 var radio=document.getElementById("option43");
	  localStorage.setItem("option43",radio.checked);
	  
	 var radio=document.getElementById("option44");
	  localStorage.setItem("option44",radio.checked);
	  
	 
  } 
  
  //Quetion 5
  
  var checked=JSON.parse(localStorage.getItem("option41"));
document.getElementById("option41").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option42"));
  document.getElementById("option42").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option43"));
  document.getElementById("option43").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option44"));
  document.getElementById("option44").checked=checked;
  
          
 </script>
  
  
  
  
  <script type="text/javascript">
  function save5()
  {
	  //this is for   Quetion6
	  
	   var radio=document.getElementById("option51");
	  localStorage.setItem("option51",radio.checked);
	  
	 var radio=document.getElementById("option52");
 	  localStorage.setItem("option52",radio.checked);
 	  
 	 var radio=document.getElementById("option53");
	  localStorage.setItem("option53",radio.checked);
	  
	 var radio=document.getElementById("option54");
	  localStorage.setItem("option54",radio.checked);
	  
	 
  } 
  
  //Quetion 6
  
  var checked=JSON.parse(localStorage.getItem("option51"));
document.getElementById("option51").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option52"));
  document.getElementById("option52").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option53"));
  document.getElementById("option53").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option54"));
  document.getElementById("option54").checked=checked;
  
          
 </script>
  
  
  
  <script type="text/javascript">
  function save6()
  {

	    //this is for   Quetion7
	  
	   var radio=document.getElementById("option61");
	  localStorage.setItem("option61",radio.checked);
	  
	 var radio=document.getElementById("option62");
	  localStorage.setItem("option62",radio.checked);
	  
	 var radio=document.getElementById("option63");
	  localStorage.setItem("option63",radio.checked);
	  
	 var radio=document.getElementById("option64");
	  localStorage.setItem("option64",radio.checked);
	  
	 
  } 
  
  //Quetion 7
  
  var checked=JSON.parse(localStorage.getItem("option61"));
document.getElementById("option61").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option62"));
  document.getElementById("option62").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option63"));
  document.getElementById("option63").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option64"));
  document.getElementById("option64").checked=checked;
  
  
          
 </script>
  
   <script type="text/javascript">
  function save7()
  {

	  //this is for   Quetion8
	  
	   var radio=document.getElementById("option71");
	  localStorage.setItem("option71",radio.checked);
	  
	 var radio=document.getElementById("option72");
 	  localStorage.setItem("option72",radio.checked);
 	  
 	 var radio=document.getElementById("option73");
	  localStorage.setItem("option73",radio.checked);
	  
	 var radio=document.getElementById("option74");
	  localStorage.setItem("option74",radio.checked);
	   
	  
	 
  } 
  
  
  //Quetion 8
    
    var checked=JSON.parse(localStorage.getItem("option71"));
  document.getElementById("option71").checked=checked;
  
    
  var checked=JSON.parse(localStorage.getItem("option72"));
    document.getElementById("option72").checked=checked;
   
    
  
    var checked=JSON.parse(localStorage.getItem("option73"));
    document.getElementById("option73").checked=checked;
    
   
    
    var checked=JSON.parse(localStorage.getItem("option74"));
    document.getElementById("option74").checked=checked;
  
          
 </script>
  
  
  <script type="text/javascript">
  function save8()
  {

	  //this is for   Quetion9
	  
	   var radio=document.getElementById("option81");
	  localStorage.setItem("option81",radio.checked);
	  
	 var radio=document.getElementById("option82");
 	  localStorage.setItem("option82",radio.checked);
 	  
 	 var radio=document.getElementById("option83");
	  localStorage.setItem("option83",radio.checked);
	  
	 var radio=document.getElementById("option84");
	  localStorage.setItem("option84",radio.checked);
	  
	 
  } 
  
  
  //Quetion 9
  
  var checked=JSON.parse(localStorage.getItem("option81"));
document.getElementById("option81").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option82"));
  document.getElementById("option82").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option83"));
  document.getElementById("option83").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option84"));
  document.getElementById("option84").checked=checked;
          
 </script>
  
 <script type="text/javascript">
  function save9()
  {


	   //this is for   Quetion10
	  
	   var radio=document.getElementById("option91");
	  localStorage.setItem("option91",radio.checked);
	  
	 var radio=document.getElementById("option92");
 	  localStorage.setItem("option92",radio.checked);
 	  
 	 var radio=document.getElementById("option93");
	  localStorage.setItem("option93",radio.checked);
	  
	 var radio=document.getElementById("option94");
	  localStorage.setItem("option94",radio.checked);
  } 
  
  
//Quetion 10
  
  var checked=JSON.parse(localStorage.getItem("option91"));
document.getElementById("option91").checked=checked;

  
var checked=JSON.parse(localStorage.getItem("option92"));
  document.getElementById("option92").checked=checked;
 
  

  var checked=JSON.parse(localStorage.getItem("option93"));
  document.getElementById("option93").checked=checked;
  
 
  
  var checked=JSON.parse(localStorage.getItem("option94"));
  document.getElementById("option94").checked=checked;
          
 </script>
   
  <script type="text/javascript">
  
  /*for Quetion1*/
  
 function color1()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn1").css("backgroundColor","lime");
     localStorage.setItem("btn1","lime");
  }

 

      $("#btn1").css("backgroundColor",localStorage.getItem("btn1"));
 
</script> 
  
  
  <script type="text/javascript">
  
  /*for Quetion2*/
  
 function color2()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn2").css("backgroundColor","lime");
     localStorage.setItem("btn2","lime");
  }

  $("#btn2").css("backgroundColor",localStorage.getItem("btn2"));
 
</script> 
  
<script type="text/javascript">
  
  /*for Quetion3*/
  
 function color3()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn3").css("backgroundColor","lime");
     localStorage.setItem("btn3","lime");
  }

 

      $("#btn3").css("backgroundColor",localStorage.getItem("btn3"));
 
</script>  
  
  
  <script type="text/javascript">
  
  /*for Quetion4*/
  
 function color4()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn4").css("backgroundColor","lime");
     localStorage.setItem("btn4","lime");
  }

 
 
      $("#btn4").css("backgroundColor",localStorage.getItem("btn4"));
 
</script> 
  
  
 <script type="text/javascript">
  
  /*for Quetion5*/
  
 function color5()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn5").css("backgroundColor","lime");
     localStorage.setItem("btn5","lime");
  }

 
 
      $("#btn5").css("backgroundColor",localStorage.getItem("btn5"));
 
</script> 
  
  <script type="text/javascript">
  
  /*for Quetion6*/
  
 function color6()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn6").css("backgroundColor","lime");
     localStorage.setItem("btn6","lime");
  }

 

      $("#btn6").css("backgroundColor",localStorage.getItem("btn6"));
 
</script> 
  
  
  
  <script type="text/javascript">
  
  /*for Quetion7*/
  
 function color7()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn7").css("backgroundColor","lime");
     localStorage.setItem("btn7","lime");
  }

 
 
      $("#btn7").css("backgroundColor",localStorage.getItem("btn7"));
 
</script>
  
  
  
  <script type="text/javascript">
  
  /*for Quetion8*/
  
 function color8()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn8").css("backgroundColor","lime");
     localStorage.setItem("btn8","lime");
  }

 

      $("#btn8").css("backgroundColor",localStorage.getItem("btn8"));
 
</script>



<script type="text/javascript">
  
  /*for Quetion9*/
  
 function color9()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn9").css("backgroundColor","lime");
     localStorage.setItem("btn9","lime");
  }

 
 
      $("#btn9").css("backgroundColor",localStorage.getItem("btn9"));
 
</script>



<script type="text/javascript">
  
  /*for Quetion10*/
  
 function color10()
  {
  
	/* var property = document.getElementById("demo");
	  property.style.backgroundColor = "red"*/
	 $("#btn10").css("backgroundColor","lime");
     localStorage.setItem("btn10","lime");
  }

 
 
      $("#btn10").css("backgroundColor",localStorage.getItem("btn10"));
 
</script>

  <!-- --------- quelist -->
       
       
       
	
	
 
 
 
 
 			
			<!-- <div style="width: 1140px;height: 80px;background-color: white; margin-top: 120px; margin-left: 112px;">
			
			</div>
			<div style="width: 300px;height: 1000px;background-color: white; margin-left: 112px; margin-top: 10px;">
			
			</div>
			
			<div style="width: 828px;height: 1000px;background-color: white; margin-left: 423px; margin-top: -1001px;">
			
			</div>
			 -->
			 
		<script type="text/javascript">countdown(10,true)
	
		</script>	 
			 
			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="js/popper.min.js"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>		
 			<script src="js/jquery-ui.js"></script>					
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>						
			<script src="js/jquery.nice-select.min.js"></script>					
			<script src="js/owl.carousel.min.js"></script>							
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>	
			
</body>
</html>