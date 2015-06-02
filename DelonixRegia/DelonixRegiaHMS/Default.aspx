<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DelonixRegiaHMS.Default" %>

<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="">
	<link rel="shortcut icon" href="Assets/Images/favicon.png" />

	<title>Login | Delonix Regia HMS
	</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="Assets/Styles/bootstrap.min.css" />
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" />
	<link rel="stylesheet" href="Assets/Styles/login.css" />

	<style>
		#particles {
			width: 100%;
			height: 100%;
			overflow: hidden;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			position: absolute;
			z-index: -2;
		}

		body {
			padding-top: 80px;
		}
	</style>
</head>

<body>
	<form id="form1" runat="server">
		<div class="container">
			<div class="card card-container">
				<div class="row">
				<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
						<strong>Oh no!</strong>
						<p>Incorrect username or password provided.</p>
					</div>
				</div>
			</div>
				<img id="profile-img" class="profile-img-card" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" />
				<p id="profile-name" class="profile-name-card"></p>

				<div class="form-signin">
					<span id="reauth-email" class="reauth-email"></span>
					<input type="text" name="user_id" id="tbxUserId" class="form-control" placeholder="Email" runat="server" tabindex="1" autofocus>
					<input type="password" name="password" id="tbxPassword" class="form-control" placeholder="Password" runat="server" tabindex="2">
					<div id="remember" class="checkbox">
						<label>
							<input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
					<button class="btn btn-primary btn-block btn-lg" id="btnLogin" type="submit" runat="server">Login</button>
				</div>
				<a href="#" class="forgot-password">Forgot password?</a>
			</div>
		</div>

		<div id="particles"></div>
	</form>

	<!-- Bootstrap core JavaScript. Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" charset="utf-8" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="Assets/Scripts/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="Assets/Scripts/particleground.min.js"></script>

	<script>
		$('#particles').particleground({
			minSpeedX: 0.1,
			maxSpeedX: 0.7,
			minSpeedY: 0.1,
			maxSpeedY: 0.7,
			directionX: 'center', // 'center', 'left' or 'right'. 'center' = dots bounce off edges
			directionY: 'center', // 'center', 'up' or 'down'. 'center' = dots bounce off edges
			density: 10000, // How many particles will be generated: one particle every n pixels
			dotColor: '#eee',
			lineColor: '#eee',
			particleRadius: 7, // Dot size
			lineWidth: 1,
			curvedLines: true,
			proximity: 100, // How close two dots need to be before they join
			parallax: false
		});
	</script>
</body>
</html>
