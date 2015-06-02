<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DelonixRegia.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Signup
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
	<style>
		.form-control-feedback {
			top: 5px !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">

				<h2>Sign up <small>It's free and always will be!</small></h2>

				<hr />

				<div class="row">
					<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
						<strong>Whoops!</strong>
						<p><span id="lblMessage" runat="server"></span></p>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="form-horizontal">

					<div class="form-group">
						<div class="col-md-6">
							<input type="text" name="first_name" id="tbxFirstName" class="form-control input-lg" placeholder="First Name" runat="server" tabindex="1" autofocus>
						</div>
						<div class="col-md-6">
							<input type="text" name="last_name" id="tbxLastName" class="form-control input-lg" placeholder="Last Name" runat="server" tabindex="2" autofocus>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12">
							<input type="email" name="email" id="tbxEmail" class="form-control input-lg" placeholder="Email Address" runat="server" tabindex="3">
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12">
							<input type="password" name="password" id="tbxPassword" class="form-control input-lg" placeholder="Password" runat="server" tabindex="6">
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-md-12">
						By clicking <strong class="label label-success">Sign up</strong>, you agree to the
						<a href="#" data-toggle="modal" data-target="#myModal">terms and conditions</a>
						set out by this site, including our use of cookies (if any).
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-12">
						<input type="submit" value="Sign up" id="btnSignup" class="btn btn-success btn-block btn-lg" runat="server" tabindex="7">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Terms and Conditions -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
				</div>
				<div class="modal-body">
					<p>
						Terms and conditions.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">Okay, got it!</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$('.form-horizontal').bootstrapValidator({
				live: 'enabled',
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					ctl00$MainContent$tbxFullName: {
						validators: {
							notEmpty: {
								message: 'The full name is required!'
							}
						}
					},

					ctl00$MainContent$tbxEmail: {
						validators: {
							notEmpty: {
								message: 'The email is required!'
							}
						}
					},

					ctl00$MainContent$tbxUsername: {
						validators: {
							notEmpty: {
								message: 'The username is required!'
							}
						}
					},

					ctl00$MainContent$tbxPassword: {
						validators: {
							notEmpty: {
								message: 'The password is required!'
							}
						}
					}
				}
			});
		});
	</script>
</asp:Content>
