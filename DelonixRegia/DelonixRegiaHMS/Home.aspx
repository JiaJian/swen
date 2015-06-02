<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DelonixRegiaHMS.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Home</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-users fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">80</div>
							<div>Guests Today</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span>
						<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-check fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">18</div>
							<div>Upcoming Reservations</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span>
						<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-bed fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">34</div>
							<div>New Bookings (This Month)</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span>
						<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-building fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">18</div>
							<div>Rooms Unoccupied</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View Details</span>
						<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					Chart
                            <div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
										Actions
                                        <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><a href="#">Action</a>
										</li>
										<li><a href="#">Another action</a>
										</li>
										<li><a href="#">Something else here</a>
										</li>
										<li class="divider"></li>
										<li><a href="#">Separated link</a>
										</li>
									</ul>
								</div>
							</div>
				</div>
				<div class="panel-body">
					<div id="chart1"></div>
				</div>
			</div>
			<!-- /.panel -->
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script type="text/javascript" charset="utf-8" src="Assets/Scripts/highcharts.js"></script>
	<script type="text/javascript" charset="utf-8" src="Assets/Scripts/highcharts-no-data.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function () {
			$('#chart1').highcharts({
				title: {
					text: 'Room Bookings Rate',
					x: -20 //center
				},
				subtitle: {
					text: 'for the month of May 2015',
					x: -20
				},
				xAxis: {
					categories: ['1 May', '2 May', '3 May', '4 May', '5 May', '6 May']
				},
				yAxis: {
					title: {
						text: 'Bookings'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				legend: {
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'middle',
					borderWidth: 0
				},
				series: [{
					name: 'Guests',
					data: [5, 7, 2, 3, 2, 15]
				}]
			});
		});
	</script>
</asp:Content>
