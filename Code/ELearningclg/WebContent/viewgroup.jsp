<%@page import="com.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.DAO.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>
<style type="text/css">
div .fa-2x {
    padding: 0px 0px 0px 0px;
}
.delete
{
margin-left: 800px;
    margin-top: -70px;
    padding: 10px;
    width: 127px;
    border-radius: 10px;
    font-weight: 500px;
    font-size: 20px;
}
.delete:hover {
font-weight: 500px;
    font-size: 20px;
	margin-left: 800px;
    margin-top: -70px;
    padding: 10px;
    width: 127px;
    border-radius: 10px;
    background-color: red;
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
        
       <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		<link rel="stylesheet" href="./Sky Forms_files/demo.css">
		<link rel="stylesheet" href="./Sky Forms_files/sky-forms.css">
		 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<body style="background-image: url(images/ed8.jpg); background-repeat: no-repeat; background-size:cover;">

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
                            
                            <li><a class="navactive color_animation" href="welcome.jsp">BACK</a></li>
                            <li><a class="navactive color_animation" href="login.jsp">LOGOUT</a></li> 
                            
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
 <% 
 Object name=session.getAttribute("gname");
 List<Integer> list_id=DataAccessLayer.getUser_ids(name);
String gname=name.toString();
 HttpSession session1=request.getSession();
 Object id=session1.getAttribute("uid");
 ArrayList<ArrayList> info=(ArrayList)session.getAttribute("info");
 ArrayList a1=new ArrayList();
 int tm=DataAccessLayer.getTotalmember(gname);

 groupmodel gpn=DataAccessLayer.getGroupinfo(gname);
 List<userModel> userlist = DataAccessLayer.getAvailableUsers1(list_id);

 %> 
 
    <br><br><br><br>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              
      <div class="text-center">
      
      <%
 
      					String admin_name=DataAccessLayer.getName(gpn.getAdmin_id());
						if(name!=null){
							BufferedImage buff = DataAccessLayer.getImage(name);
						if(buff!=null)
						{
							ByteArrayOutputStream baos = new ByteArrayOutputStream();
							ImageIO.write(buff, "png", baos);
							baos.flush();
							byte[] imageInByteArray = baos.toByteArray();
							baos.close();
							String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
								%>
<img src="data:image/png;base64, <%=b64%>" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>												

 <% }else{}
						}				
else
{}%>

<form action="UploadProfile" method="post"
					enctype="multipart/form-data">
					<input style="height:30px; background-color: bisque;" type="file" name="file" /><br> 
					<input style="width: 61px;     height: 28px;     font-family: serif; font-size: 16px;     border-radius: 14px; background-color: lightgoldenrodyellow; color: black;     margin-top: -11px; " type="submit" value="upload" />
				</form>
      
          </div></hr><br>

          <ul class="list-group">
            <li  class="list-group-item text-muted"><span style="color: black;"><strong>Group Information:</strong></span><i class="fa fa-dashboard fa-1x"></i></li>
            <li  class="list-group-item text-right"><span style="color: #0000ffd9" class="pull-left"><strong>Group Admin:</strong></span><span style="color: black;"><%out.println(admin_name); %></span></li>
            <li  class="list-group-item text-right"><span style="color: #0000ffd9" class="pull-left"><strong>Created Date & Time:</strong></span><span style="color: black;"><%out.println(gpn.getDate()); %></span></li>
            <!-- <li  class="list-group-item text-right"><span style="color: #0000ffd9" class="pull-left"><strong>Created Time:</strong></span><span style="color: black;">02:05:20</span></li> -->
            <li  class="list-group-item text-right"><span style="color: #0000ffd9;" class="pull-left"><strong>Total Member:</strong></span><span style="color: black;"><%out.println(tm+1); %></span></li>
          </ul> 
               
          <div class="panel panel-default">
            <div class="panel-heading">Social Media</div>
            <div class="panel-body">
            	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
            </div>
          </div>
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
          
          <div class="tab-content">
            
            <div align="center" style="width: 700px;height: 100px;background-color: lightcyan; margin-top: 50px; margin-left: 72px;"> 
            <br><a><span style="font-family: serif; font-size: 42px; background-color: ;"><strong>GroupName: <%out.println(name); %></strong></span></a>
            </div>  
            
            <%
            boolean flag=DataAccessLayer.Checkgroupadmin(id, gname);
            if(flag==true)
            { %>
            	<form action="deletegroup" method="post">
                <input type="hidden" name="gname" value="<%=gname%>">
                <input type="submit" class="delete" name="submit" value="Delete"></form>              
                    <%	
            }else{}
            %>
            
            <div style="width: 90%;
    height: 100%;
    background-color: white;
    margin-top: 35px;
    margin-left: 72px;
    padding-top: 34px;
    padding-bottom: 34px;
    padding-left: 34px;
    padding-right: 34px;
    margin-bottom: 50px;"> 
            
             <%
             for(userModel q:userlist){
            	/*  BufferedImage bimg = DataAccessLayer.getImg1(q.getId());
 				ByteArrayOutputStream baos = new ByteArrayOutputStream();
 				ImageIO.write(bimg, "jpg", baos);
 				baos.flush();
 				byte[] imageInByteArray = baos.toByteArray();
 				baos.close();
 				String b68 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray); */
            %>
            <div style="    height: 115px;
    width: 700px;
    padding: 10px;
    background-color: #ffa5005c"> 
             <%--  <a style="margin-left: 220px; font-family: serif; font-size: 22px;"><%=ab1.get(i)%></a><br>
             <a style="margin-left: 220px; font-family: serif; font-size: 22px;"><%=ab2.get(i)%></a>
             --%> 
             <div align="left">
           <%--   <img src="data:img/jpg;base64, <%=b68%>" alt="Avatar" class="avatar" style="vertical-align: middle;
    width: 100px;
    height: 100px;
    border-radius: 20%;
    margin-top: -1px;
    margin-left: 50px;
    border: #e4dbc7;
    border-style: outset"> --%>
              </div>
              <div style="margin-top: -5px;">
              <a style="margin-left: 220px; font-family: serif; font-size: 18px;">Name: <%=q.getFirstName()+" "+q.getLastName()%></a><br>
              <a style="margin-left: 220px; font-family: serif; font-size: 18px;">Email: <%=q.getEmailID()%></a><br>
              <a style="margin-left: 220px; font-family: serif; font-size: 18px;">PH No: <%=q.getMobileNo()%></a>
           
              
              </div>
              
            </div>
            <br>
            
            <%  
           
            }
            
             %>
            
            </div>                
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"> </script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>     
        <script type="text/javascript" src="js/jquery.mixitup.min.js" ></script>
        <script type="text/javascript" src="js/main.js" ></script>
</body>
</html>