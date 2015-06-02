<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Type_Edit.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Room_Type_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Edit room type info
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Edit room type info</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>The room type record has been updated.</p>
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
					<label for="tbxRoomType" class="col-sm-2 control-label">Room Type</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxRoomType" id="tbxRoomType" placeholder="Name of the room type (e.g. Waterfront Suite)" required runat="server" tabindex="1" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxRoomRate" class="col-sm-2 control-label">Room Rate</label>
					<div class="col-sm-10">
						<div class="input-group">
							<span class="input-group-addon">S$</span>
							<input type="text" class="form-control" name="tbxRoomRate" id="tbxRoomRate" placeholder="The price in S$ for one night of stay" tabindex="2" runat="server">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-pencil"></span>
							Edit room type
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
