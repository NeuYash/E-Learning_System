<%@page import="com.DAO.CategoryAccess"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-learning</title>



   
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
		

    </head>
	
    <body>
            
		<script type="text/javascript">
	function check_pass() {
		if (document.getElementById('pass').value == document.getElementById('confirm_pass').value) {
			document.getElementById('submit').disabled = false;
			document.getElementById('mesage').innerHTML="Password Matched";
		} else {
			document.getElementById('submit').disabled = true;
			document.getElementById('mesage').innerHTML="Password do not matched";
		};
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
                            <li><a class="navactive color_animation" href="index.jsp">WELCOME</a></li>
                            <li><a class="navactive color_animation" href="register.jsp">STUDENT REGISTRATION</a></li>
                            <li><a class="navactive color_animation" href="login.jsp">STUDENT LOGIN</a></li>
                            
                            
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        
        <div id="top" class="starter_container1">
            <div class="follow_container">
            
                <div class="col-md-6 col-md-offset-3">
                 <div style="background-color: #292929bd;
    background-size: 500px;
    margin-top: -17%;
    margin-left: -50px;">
                <br>
                   <form name="Reg" action="RegistrationController" class="sky-form" method="post" enctype="multipart/form-data">
				 <h1 style="font-weight: 500;color: white;  width: 300px; letter-spacing: 0.040em;  border: 2px solid #f7f3f7;">STUDENT REGISTRATION</h1>
				<table style="margin-left: 24%;margin-top:-50px;">
				<fieldset>	
				<tr>	<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							<td style="color: white; width:120px;">First Name :</td><td> <input type="name" name="fname" placeholder="First Name" required="true" style=" background: #fbf5fac7; " autocomplete="off"></td><br><br>
							
						</label>
					</section>
				</tr>	
			
				<tr>	<section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							<td style="color: white;width:120px;">Last Name : </td><td><input type="name" name="lname" placeholder="Last Name" required="true"style=" background: #fbf5fac7; " autocomplete="off"></td>
							
						</label>
					</section>
					</tr>	
					<tr><section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							<td style="color: white;width:120px;">Contact :</td><td><input type="text" name="contact" placeholder="Contact Number" required="true"style=" background: #fbf5fac7; "autocomplete="off" pattern="(0/91)?[6-9][0-9]{9}" title="Must be 10 digit number starting with 6 to 9">
							</td>
						</label>
					</tr></section>	
					<tr><section>
						<label class="input">
							<i class="icon-append icon-envelope-alt"></i>
							<td style="color: white;width:120px;">Email :</td><td> <input type="email" name="email" placeholder="Email address" required="true"style=" background: #fbf5fac7; " autocomplete="off">
							</td>
						</label>
					</section>
					</tr>
					<tr><section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
							<td style="color: white;width:120px;">Password : </td><td> <input type="password" name="pass" id="pass" placeholder="Password"  onkeyup='check_pass();' required="true" minlength="8"style=" background: #fbf5fac7; ">
							</td>
						</label>
					</section>
					</tr>
					<tr><section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
							<td style="color: white;width:120px;">Confirm Pass:</td><td><input type="password" name="confirm_pass" id="confirm_pass" placeholder="Confirm Password" onkeyup='check_pass();' required="true" minlength="8"style=" background: #fbf5fac7; ">
							</td>
						</label>
					</section>
					
					</tr>
					<!-- -----------------------dept ----------------------------- -->

								<tr>
									<section> <label class="input"> <i
										class="icon-append icon-lock"></i>
										<td style="color: white; width: 120px;">Select
											Department:</td>
									<td><select name="dept">
												<option value="IT">IT</option>
												<option value="CS">CS</option>
												<option value="ENTC">ENTC</option>
												<option value="Electrical">Electrical</option>
												<option value="Mech">Mech</option>
												<option value="Civil">Civil</option>
										</select></td>
									</label> </section>

								</tr><tr><section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
							<td style="color: white;width:120px;">User Image:</td><td><input type="file" name="file" id="confirm_pass" required="true" style=" background: #fbf5fac7; ">
							</td>
						</label>
					</section>
					
					</tr>
				</fieldset>
				</table>
				<footer>
				<span id="mesage" style="color: black;" ></span>
					<button type="submit" name="submit" value="submit" class="button" id="submit" onclick="check_pass()" style="margin-left: 190px; color: white;">Sign up</button>

					<button type="reset" name="Reset" value="Reset" class="button" id="submit"  style="    margin-left: 380px;
    margin-top: -35px; color: white;">Reset</button>

				</footer>
			</form>	
					<br>
                </div>
                </div>
            </div>
        </div>

        <!-- ============ About Us ============= -->

        <!-- <section id="story" class="description_content">
            <div class="text-content container">
                <div class="col-md-6">
                    <h1>About us</h1>
                    <div class="fa fa-cutlery fa-2x"></div>
                    <p class="desc-text">Restaurant is a place for simplicity. Good food, good beer, and good service. Simple is the name of the game, and we’re good at finding it in all the right places, even in your dining experience. We’re a small group from Denver, Colorado who make simple food possible. Come join us and see what simplicity tastes like.</p>
                </div>
                <div class="col-md-6">
                    <div class="img-section">
                       <img src="images/kabob.jpg" width="250" height="220">
                       <img src="images/limes.jpg" width="250" height="220">
                       <div class="img-section-space"></div>
                       <img src="images/radish.jpg"  width="250" height="220">
                       <img src="images/corn.jpg"  width="250" height="220">
                   </div>
                </div>
            </div>
        </section>
 -->

       <!-- ============ Pricing  ============= -->


       <!--  <section id ="pricing" class="description_content">
             <div class="pricing background_content">
                <h1><span>Affordable</span> pricing</h1>
             </div>
            <div class="text-content container"> 
                <div class="container">
                    <div class="row">
                        <div id="w">
                            <ul id="filter-list" class="clearfix">
                                <li class="filter" data-filter="all">All</li>
                                <li class="filter" data-filter="breakfast">Breakfast</li>
                                <li class="filter" data-filter="special">Special</li>
                                <li class="filter" data-filter="desert">Desert</li>
                                <li class="filter" data-filter="dinner">Dinner</li>
                            </ul>@end #filter-list    
                            <ul id="portfolio">
                                <li class="item breakfast"><img src="images/food_icon01.jpg" alt="Food" >
                                    <h2 class="white">$20</h2>
                                </li>

                                <li class="item dinner special"><img src="images/food_icon02.jpg" alt="Food" >
                                    <h2 class="white">$20</h2>
                                </li>
                                <li class="item dinner breakfast"><img src="images/food_icon03.jpg" alt="Food" >
                                    <h2 class="white">$18</h2>
                                </li>
                                <li class="item special"><img src="images/food_icon04.jpg" alt="Food" >
                                    <h2 class="white">$15</h2>
                                </li>
                                <li class="item dinner"><img src="images/food_icon05.jpg" alt="Food" >
                                    <h2 class="white">$20</h2>
                                </li>
                                <li class="item special"><img src="images/food_icon06.jpg" alt="Food" >
                                    <h2 class="white">$22</h2>
                                </li>
                                <li class="item desert"><img src="images/food_icon07.jpg" alt="Food" >
                                    <h2 class="white">$32</h2>
                                </li>
                                <li class="item desert breakfast"><img src="images/food_icon08.jpg" alt="Food" >
                                    <h2 class="white">$38</h2>
                                </li>
                            </ul>@end #portfolio
                        </div>@end #w
                    </div>
                </div>
            </div>  
        </section> -->


        <footer class="sub_footer"  >
            <div class="container">
                
                <div class="col-md-4"><p class="sub-footer-text text-center">Back to <a href="#top">TOP</a></p>
                </div>
                <div class="col-md-4"><p class="sub-footer-text text-center">Built With Care By <a href="#" target="_blank">Us</a></p></div>
            </div>
        </footer>


        <script type="text/javascript" src="js/jquery-1.10.2.min.js"> </script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>     
        <script type="text/javascript" src="js/jquery.mixitup.min.js" ></script>
        <script type="text/javascript" src="js/main.js" ></script>

    </body>
</html>
