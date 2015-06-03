<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Guest_Account_Edit.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Guest_Account_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Edit guest account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit guest account</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>The guest account details have been updated.</p>
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
						<input type="password" class="form-control" name="tbxPassword" id="tbxPassword" placeholder="The password" runat="server">
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
						<input type="text" class="form-control" name="tbxAddress" id="tbxAddress" placeholder="The address guest" required runat="server">
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
							<span class="glyphicon glyphicon-pencil"></span>
							Save changes
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
