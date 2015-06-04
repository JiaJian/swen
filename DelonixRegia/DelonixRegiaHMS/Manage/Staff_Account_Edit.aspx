<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Staff_Account_Edit.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Staff_Account_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Edit staff account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit staff account</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>The staff account has been created and an email has been sent to notify them.</p>
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
					<label for="tbxFullName" class="col-sm-2 control-label">Email Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="tbxEmail" placeholder="The email address of the employee (this will be the login ID)" required runat="server" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="tbxPassword" id="tbxPassword" placeholder="The password" runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxFirstName" class="col-sm-2 control-label">First Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxFirstName" id="tbxFirstName" placeholder="The first name of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxLastName" class="col-sm-2 control-label">Last Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxLastName" id="tbxLastName" placeholder="The last name of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxAddress" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxAddress" id="tbxAddress" placeholder="The residential address of the employee" runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxPostalCode" class="col-sm-2 control-label">Postal Code</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxPostalCode" id="tbxPostalCode" placeholder="The postal code of the address" runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlBankName" class="col-sm-2 control-label">Bank Name</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlBankName" id="ddlBankName" runat="server">
							<option value="DBS">DBS</option>
							<option value="POSB">POSB</option>
							<option value="UOB">UOB</option>
							<option value="Maybank">Maybank</option>
							<option value="OCBC">OCBC</option>
							<option value="Citibank">Citibank</option>
							<option value="HSBC">HSBC</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxBankAccountNumber" class="col-sm-2 control-label">Bank Account Number</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxBankAccountNumber" id="tbxBankAccountNumber" placeholder="The bank account number of the employee" runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Account Role</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="ddlUserLevel" runat="server">
							<option value="1">Maintenance Crew</option>
							<option value="2">Receptionist</option>
							<option value="3">Management</option>
							<option value="4">Administrator</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-pencil"></span>
							Edit staff account
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
						enabled: false,
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
					ctl00$MainContent$tbxBankAccountNumber: {
						validators: {
							notEmpty: {
								message: 'The bank account number is required!'
							}
						}
					}
				}
			});
		});
	</script>
</asp:Content>
