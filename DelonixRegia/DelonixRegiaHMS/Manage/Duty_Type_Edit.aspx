<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Duty_Type_Edit.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Duty_Type_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit duty type</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>The duty type has been updated.</p>
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
					<label for="tbxDutyName" class="col-sm-2 control-label">Duty Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxDutyName" id="tbxDutyName" placeholder="The duty name (e.g. Estate Maintenance)" required tabindex="1" runat="server" autofocus>
					</div>
				</div>
				
				<div class="form-group">
					<label for="tbxDutyInformation" class="col-sm-2 control-label">Duty Information</label>
					<div class="col-sm-10">
						<textarea rows="5" class="form-control" name="tbxDutyInformation" id="tbxDutyInformation" placeholder="Give a short description about the duty" required tabindex="2" runat="server" />
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
