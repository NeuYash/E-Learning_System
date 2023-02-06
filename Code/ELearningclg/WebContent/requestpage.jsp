<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>e-learning</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sl-slide.css">

<script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<!-- Le fav and touch icons -->
 <link rel="icon" href="images/favicon.png" type="image/png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
	<style>
.button {
  background-color: lime; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  width:200px;
}

.button1 {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>
	
</head>

<body style="width: 100%; height: 100%; background-color:wheat;background-image: url(images/ed13.jpg); background-repeat: no-repeat; background-size:1000px;">

	

<br><br><br><br><br><br><br><br>
	<div align="center" style="    margin-left: 112px; margin-top: -300px; height:360px; width:400px; background-image: url('images/sorry.jpg');">
	
	
	</div>
	
<div>

	
	
	<button action="index.jsp" class="button button1" style="color: initial; margin-left: 300px; margin-top: -16px;"><a href="index.jsp">Log Out</a></button>
	<h1 style="color: initial; ">Your Account Verification is Being Process..</h1>
	</div>
	
	

	<script src="js/vendor/jquery-1.9.1.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<!-- Required javascript files for Slider -->
	<script src="js/jquery.ba-cond.min.js"></script>
	<script src="js/jquery.slitslider.js"></script>
	<!-- /Required javascript files for Slider -->

	<!-- SL Slider -->
	<script type="text/javascript">
		$(function() {
			var Page = (function() {

				var $navArrows = $('#nav-arrows'), slitslider = $('#slider')
						.slitslider({
							autoplay : true
						}),

				init = function() {
					initEvents();
				}, initEvents = function() {
					$navArrows.children(':last').on('click', function() {
						slitslider.next();
						return false;
					});

					$navArrows.children(':first').on('click', function() {
						slitslider.previous();
						return false;
					});
				};

				return {
					init : init
				};

			})();

			Page.init();
		});
	</script>
	<!-- /SL Slider -->
</body>
</html>