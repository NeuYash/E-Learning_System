<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login Form</title>
<!-- CORE CSS-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

<style type="text/css">
html, body {
	height: 100%;
	/* background-image: url("adminLog.jpg");*/
	background-image: url("images/adminbk.jpg");
	/* Full height */
	height: 100%;
	weidth: 5000%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
}

.margin {
	margin: 0 !important;
}
</style>
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

<body bgcolor="#E6E6FA">


	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="Authentication" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<img src="images/userlogin.jpg" alt=""
							class="responsive-img valign profile-image-login">
						<p class="center login-form-text">Login Form</p>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person-outline prefix"></i> <input
							class="validate" id="email" type="email" name="email"> <label
							for="email" data-error="wrong" data-success="right"
							class="center-align">Email</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-action-lock-outline prefix"></i> <input
							id="password" type="password" name="pass"> <label
							for="password">Password</label>
					</div>
				</div>
			 <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="ForgotPassUser.jsp">Forgot Password</a></p>
          </div>
               
        </div>
				<div class="row">
					<div class="input-field col s12">

						<div class="btn waves-effect waves-light col s12">
							<input type="submit" name="submit" value="Submit"
								style="font-face: 'Comic Sans MS'; font-size: larger; color: teal; background-color: #FFFFC0; border: 3pt ridge lightgrey"
								id="submit">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6 m6 l6">
						<p class="margin medium-small">
							<a href="UserRegistration.jsp">Register Now!</a>
						</p>
					</div>

				</div>

			</form>
		</div>
	</div>


	<center>
		<script async
			src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- Post Page - Responsive -->
		<ins class="adsbygoogle"
			style="display: inline-block; width: 300px; height: 250px"
			data-ad-client="ca-pub-5104998679826243" data-ad-slot="3470684978"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</center>



	<!-- ================================================
    Scripts
    ================================================ -->

	<!-- jQuery Library -->
	<script type="text/javascript"
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!--materialize js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>

	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-27820211-3', 'auto');
		ga('send', 'pageview');

		</body>

		</html>
	