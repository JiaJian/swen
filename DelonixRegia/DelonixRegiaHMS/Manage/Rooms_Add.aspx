<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Rooms_Add.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Rooms_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Add a room record
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Add a room record</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p>A new room record was created.</p>
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
					<label for="tbxRoomNumber" class="col-sm-2 control-label">Room Number</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tbxRoomNumber" id="tbxRoomNumber" placeholder="The room number (e.g. 810 for 8th floor, room 10)" required runat="server" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlRoomType" class="col-sm-2 control-label">Room Type</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlRoomType" id="ddlRoomType" runat="server">
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlStatus" class="col-sm-2 control-label">Status</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlStatus" id="ddlStatus" runat="server">
							<option value="1" selected>Vacant</option>
							<option value="2">Occupied</option>
							<option value="3">Vacant and Scheduled for Cleaning</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-plus"></span>
							Add room
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
					ctl00$MainContent$tbxRoomNumber: {
						validators: {
							notEmpty: {
								message: 'The room number is required!'
							}
						}
					}
				}
			});
		});
	</script>
</asp:Content>
