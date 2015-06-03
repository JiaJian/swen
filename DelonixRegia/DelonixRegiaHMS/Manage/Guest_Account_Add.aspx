<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Guest_Account_Add.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Guest_Account_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Create guest account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Create guest account</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>The guest account is successfully created.</p>
			</div>
			<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
				<strong>Whoops!</strong>
				<p><span id="lblMessage" runat="server"></span></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="tbxEmail" class="col-sm-2 control-label">Email Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="tbxEmail" placeholder="The email address of the guest (this will be the login ID)" required runat="server" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="tbxPassword" id="tbxPassword" placeholder="The password" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxFirstName" class="col-sm-2 control-label">First Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxFirstName" id="tbxFirstName" placeholder="The first name of the guest" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxLastName" class="col-sm-2 control-label">Last Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxLastName" id="tbxLastName" placeholder="The last name of the guest" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxAddress" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxAddress" id="tbxAddress" placeholder="The address of the guest" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxPostalCode" class="col-sm-2 control-label">Postal Code</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxPostalCode" id="tbxPostalCode" placeholder="The postal code of the address" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxCountry" class="col-sm-2 control-label">Country of Residence</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxCountry" id="tbxCountry" placeholder="The country of residence of the guest" required runat="server">

						<!-- <select class="form-control" name="ddlCountry" id="ddlCountry"> // runat="server"
							<option>Singapore</option>
						</select>-->
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-plus"></span>
							Create guest account
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script type="text/javascript">
		$(document).on('ready', function () {
			// Bootstrap validator
			$('.form-horizontal').formValidation({
				framework: 'bootstrap',
				live: 'enabled',
				icon: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					ctl00$MainContent$tbxEmail: {
						validators: {
							notEmpty: {
								message: 'The email address is required!'
							},
							emailAddress: {
								message: 'This is not a valid email address!'
							}
						}
					},
					ctl00$MainContent$tbxPassword: {
						validators: {
							notEmpty: {
								message: 'The password is required!'
							}
						}
					},
					ctl00$MainContent$tbxFirstName: {
						validators: {
							notEmpty: {
								message: 'The first name is required!'
							}
						}
					},
					ctl00$MainContent$tbxLastName: {
						validators: {
							notEmpty: {
								message: 'The last name is required!'
							}
						}
					},
					ctl00$MainContent$tbxAddress: {
						validators: {
							notEmpty: {
								message: 'The address is required!'
							}
						}
					},

					ctl00$MainContent$tbxPostalCode: {
						validators: {
							notEmpty: {
								message: 'The postal code is required!'
							}
						}
					},
					ctl00$MainContent$tbxCountry: {
						validators: {
							notEmpty: {
								message: 'The country is required!'
							}
						}
					}
				}
			});
		});
	</script>
</asp:Content>
