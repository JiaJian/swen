<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="DelonixRegia.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron masthead jumbotron-banner-search">
		<div class="container">
			<h1>Select a Room</h1>
			<p>List of luxurious and spacious rooms available.</p>
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
							<input type="text" class="form-control" id="tbxCheckInDate" data-date-format="DD/MM/YYYY" value="21/05/2015" />
							<span class="input-group-addon"><span class="fa fa-calendar" id="hack1"></span></span>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Check Out</label>
						<div class="input-group date" id="datepicker2">
							<input type="text" class="form-control" id="tbxCheckOutDate" data-date-format="DD/MM/YYYY" value="25/05/2015" />
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
							<option value="2" selected>2</option>
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
						<button disabled class="btn btn-success pull-right">Update</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="sub-heading">Available rooms</h3>

				<div class="row" style="padding-bottom: 15px;">
					<div class="col-lg-12">
						There are <strong>10</strong> rooms available for your chosen dates!
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Room Type</th>
									<th>Price (Per Night)</th>
									<th>Reservation</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p>
											<img src="Assets/Images/room1.jpg" style="width: 300px;" class="img-responsive" />
										</p>
										<h4>Superior Room</h4>
									</td>
									<td>S$180</td>
									<td><a href="book" class="btn btn-primary">Book</a></td>
								</tr>
								<tr>
									<td>
										<p>
											<img src="Assets/Images/room2.jpg" style="width: 300px;" class="img-responsive" />
										</p>
										<h4>Deluxe Room</h4>
									</td>
									<td>S$215</td>
									<td><a href="book" class="btn btn-primary">Book</a></td>
								</tr>
								<tr>
									<td>
										<p>
											<img src="Assets/Images/room3.jpg" style="width: 300px;" class="img-responsive" />
										</p>
										<h4>Executive Suite</h4>
									</td>
									<td>S$280</td>
									<td><a href="book" class="btn btn-primary">Book</a></td>
								</tr>
								<tr>
									<td>
										<p>
											<img src="Assets/Images/room4.jpg" style="width: 300px;" class="img-responsive" />
										</p>
										<h4>Waterfront Suite</h4>
									</td>
									<td>S$350</td>
									<td><a href="book" class="btn btn-primary">Book</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!--<div class="row">
					<div class="col-lg-3">
						<p>
							<img src="Assets/Images/room1.jpg" class="img-responsive" />
						</p>
						<h4>Superior Room</h4>
						<div>
							<div class="pull-left">Book</div>
							<div class="btn btn-success pull-right">Book</div>
						</div>

					</div>
					<div class="col-lg-3">
						<p>
							<img src="Assets/Images/room2.jpg" class="img-responsive" />
						</p>
						<h4>Deluxe Room</h4>
						<div class="btn btn-success btn-block">Book</div>
					</div>
					<div class="col-lg-3">
						<p>
							<img src="Assets/Images/room3.jpg" class="img-responsive" />
						</p>
						<h4>Executive Suite</h4>
						<div class="btn btn-success btn-block">Book</div>
					</div>
					<div class="col-lg-3">
						<p>
							<img src="Assets/Images/room4.jpg" class="img-responsive" />
						</p>
						<h4>Waterfront Suite</h4>
						<div class="btn btn-success btn-block">Book</div>
					</div>
				</div>-->
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
