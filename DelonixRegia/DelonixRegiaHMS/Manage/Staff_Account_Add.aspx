<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Staff_Account_Add.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Staff_Account_Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Create staff account</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>We added in the user already and have also sent an email to notify them.</p>
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
					<label for="tbxFullName" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="tbxEmail" id="Text5" placeholder="The password" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">First Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="Text1" placeholder="The first name of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Last Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="Text2" placeholder="The last name of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="Text3" placeholder="The residential address of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Postal Code</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="Text4" placeholder="The postal code of the address" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Bank Name</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlFAK" id="Select2" runat="server">
							<option>DBS</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Bank Account Number</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxEmail" id="Text6" placeholder="The bank account number of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Account Role</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="Select1" runat="server">
							<option>Maintenance Crew</option>
							<option>Receptionist</option>
							<option>Management</option>
							<option>Administrator</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-plus"></span>
							Create staff account
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
