<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DelonixRegia.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
	<link href="Content/bootstrap-datetimepicker.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron masthead jumbotron-banner-home">
		<div class="container">
			<h1>Delonix Regia</h1>
			<p>Luxurious hotel overlooking the Singapore River.</p>
			<p>&nbsp;</p>
		</div>
	</div>
	<div class="container-fluid container-booking">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Check In</label>
						<div class="input-group date" id="datepicker1">
							<input type="text" class="form-control" id="tbxCheckInDate" data-date-format="DD/MM/YYYY" />
							<span class="input-group-addon"><span class="fa fa-calendar" id="hack1"></span></span>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Check Out</label>
						<div class="input-group date" id="datepicker2">
							<input type="text" class="form-control" id="tbxCheckOutDate" data-date-format="DD/MM/YYYY" />
							<span class="input-group-addon"><span class="fa fa-calendar" id="hack2"></span></span>
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<label class="control-label">Adults</label>
						<div class="clearfix"></div>
						<select class="form-control" id="ddlAdults">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<label class="control-label">Children</label>
						<div class="clearfix"></div>
						<select class="form-control" id="ddlChildren">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<label class="control-label">&nbsp;</label>
						<div class="clearfix"></div>
						<a href="search" class="btn btn-success pull-right">Search</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Welcome to Delonix Regia</h2>
				<p>
					Embark on a unique and luxurious journey at Delonix Regia, located in the heart of the lion city.
					Ideally situated at the crossroads of Singapore’s central business districts, world-class shopping and entertainment, enjoy the 
					many attractions of Singapore River. Delonix Regia offers the perfect base from which to discover the city.
				</p>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script src="Scripts/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			console.log("started");
			$('#datepicker1').datetimepicker();
			$('#datepicker2').datetimepicker();
			$("#datepicker1").on("dp.change", function (e) {
				$('#datepicker2').data("DateTimePicker").minDate(e.date);
			});
			$("#datepicker2").on("dp.change", function (e) {
				$('#datepicker1').data("DateTimePicker").maxDate(e.date);
			});
		});
	</script>
</asp:Content>
