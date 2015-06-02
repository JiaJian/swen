<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Occupancy.aspx.cs" Inherits="DelonixRegiaHMS.Reports.Room_Occupancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Room occupancy report
				<button class="btn btn-warning pull-right">
					<span class="fa fa-download"></span>
					Export
				</button>
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="ui">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Frequency</label>
							<select class="form-control" name="ddlPLZchangethis" id="Select2" runat="server">
								<option>Daily</option>
								<option>Weekly</option>
								<option>Monthly</option>
								<option>Yearly</option>
							</select>
						</div>
					</div>

					<!--<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Period</label>
							

						</div>
					</div>-->

					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">&nbsp;</label>
							<div class="clearfix"></div>
							<a href="search" class="btn btn-success">Generate</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header"></h2>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div id="chart1"></div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script type="text/javascript" charset="utf-8" src="/Assets/Scripts/highcharts.js"></script>
	<script type="text/javascript" charset="utf-8" src="/Assets/Scripts/highcharts-no-data.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function () {
			$('#chart1').highcharts({
				chart: {
					type: 'column'
				},
				title: {
					text: 'Room Occupancy Report'
				},
				subtitle: {
					text: 'Daily report for the past 5 days'
				},
				xAxis: {
					categories: ['1 May 2015', '2 May 2015', '3 May 2015', '4 May 2015', '5 May 2015']
				},
				yAxis: {
					min: 0,
					title: {
						text: 'Occupancy Rate'
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
							color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
						}
					}
				},
				legend: {
					align: 'right',
					x: -30,
					verticalAlign: 'top',
					y: 25,
					floating: true,
					backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
					borderColor: '#CCC',
					borderWidth: 1,
					shadow: false
				},
				tooltip: {
					formatter: function () {
						return '<b>' + this.x + '</b><br/>' +
							this.series.name + ': ' + this.y + '<br/>' +
							'Total: ' + this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						dataLabels: {
							enabled: true,
							color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
							style: {
								textShadow: '0 0 3px black'
							}
						}
					}
				},
				series: [{
					name: 'Vacant',
					data: [15, 23, 20, 7, 8],
					color: '#5cb85c'
				}, {
					name: 'Vacant (Scheduled for Cleaning)',
					data: [5, 7, 17, 6, 14],
					color: '#f0ad4e'
				}, {
					name: 'Occupied',
					data: [60, 50, 43, 67, 58],
					color: '#d9534f'
				}]
			});
		});
	</script>
</asp:Content>
