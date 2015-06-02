<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Duty_Assign.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Duty_Assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Assign duty <small>to maintenance staff</small></h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Yay!</strong>
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
					<label for="tbxFullName" class="col-sm-2 control-label">Maintenance Staff</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlFAK" id="Select2" runat="server">
							<option>Sim Jia Zhi (noodlelord@gmail.com)</option>
						</select>
					</div>
				</div>

				
				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Duty</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="Select1" runat="server">
							<option>General Maintenance</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Duty Start</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker1" data-date-format="DD-MM-YYYY">
							<input type="text" class="form-control" id="tbxStartDate" placeholder="The duty starting date and time" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Duty End</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker2" data-date-format="DD-MM-YYYY">
							<input type="text" class="form-control" id="Text1" placeholder="The duty ending date and time" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-plus"></span>
							Assign duty
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
