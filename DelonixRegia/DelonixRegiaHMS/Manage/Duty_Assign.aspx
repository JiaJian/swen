<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Duty_Assign.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Duty_Assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Assign duty
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
				<strong>Success!</strong>
				<p>Assigned a new duty for the staff! An email has also been sent to notify them.</p>
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
					<label for="ddlStaffList" class="col-sm-2 control-label">Maintenance Staff</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlStaffList" id="ddlStaffList" runat="server">
						</select>
					</div>
				</div>


				<div class="form-group">
					<label for="ddlDutyType" class="col-sm-2 control-label">Duty</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlDutyType" id="ddlDutyType" runat="server">
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxDutyStart" class="col-sm-2 control-label">Duty Start</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker1">
							<input type="text" class="form-control" id="tbxDutyStart" placeholder="The duty starting date and time" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxDutyEnd" class="col-sm-2 control-label">Duty End</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker2">
							<input type="text" class="form-control" id="tbxDutyEnd" placeholder="The duty ending date and time" runat="server">
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
	<script src="/Assets/Scripts/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function () {
			$('#datetimepicker1').datetimepicker({
				format: 'DD/MM/YYYY HH:mm'
			});
			$('#datetimepicker2').datetimepicker({
				format: 'DD/MM/YYYY HH:mm'
			});
			$("#datetimepicker1").on("dp.change", function (e) {
				$('#datetimepicker2').data("DateTimePicker").minDate(e.date);
			});
			$("#datetimepicker2").on("dp.change", function (e) {
				$('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
			});
		});
	</script>
</asp:Content>
