<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DelonixRegia.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h2>Login <small>or <a href="signup">sign up</a>!</small></h2>

				<hr />

				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
							<strong>Oh no!</strong>
							<p>Incorrect username or password provided.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" name="user_id" id="tbxUserId" class="form-control input-lg" placeholder="Email" runat="server" tabindex="1" autofocus>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" name="password" id="tbxPassword" class="form-control input-lg" placeholder="Password" runat="server" tabindex="2">
							</div>

						</div>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12">
						<button class="btn btn-primary btn-block btn-lg" id="btnLogin" type="submit" runat="server">Login</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
