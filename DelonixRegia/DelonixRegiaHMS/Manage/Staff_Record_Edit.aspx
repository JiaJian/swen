<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Staff_Record_Edit.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Staff_Record_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Edit staff record
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit staff record</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>Staff record updated.</p>
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
						<input type="text" class="form-control" name="tbxEmail" id="tbxEmail" placeholder="The email address of the employee (this will be the login ID)" required runat="server" autofocus>
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
						<input type="text" class="form-control" name="tbxAddress" id="tbxAddress" placeholder="The residential address of the employee" required runat="server">
					</div>
				</div>

				<div class="form-group">
					<label for="tbxPostalCode" class="col-sm-2 control-label">Postal Code</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxPostalCode" id="tbxPostalCode" placeholder="The postal code of the address" required runat="server">
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
						<input type="text" class="form-control" name="tbxBankAccountNumber" id="tbxBankAccountNumber" placeholder="The bank account number of the employee" required runat="server">
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
