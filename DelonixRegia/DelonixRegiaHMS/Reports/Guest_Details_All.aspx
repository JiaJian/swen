<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Guest_Details_All.aspx.cs" Inherits="DelonixRegiaHMS.Reports.Guest_Details_All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Guest details report (all guests)
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Guest details report (all guests)
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
							<label class="control-label">Date</label>
							<div class="input-group date" id="datepicker1">
								<input type="text" class="form-control" id="tbx" data-date-format="DD/MM/YYYY" value="21/01/2015" />
								<span class="input-group-addon"><span class="fa fa-calendar" id="hack1"></span></span>
							</div>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">&nbsp;</label>
							<div class="clearfix"></div>
							<a href="search" class="btn btn-success">Search</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Report for 21 January 2015</h2>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Room Number</th>
						<th>Guest Full Name</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>810</td>
						<td>Wilfred Loy</td>
					</tr>
					<tr>
						<td>810</td>
						<td>Hilmi Ja'affar</td>
					</tr>
					<tr>
						<td>815</td>
						<td>Taylor Smith</td>
					</tr>
					<tr>
						<td>201</td>
						<td>David Tan</td>
					</tr>
					<tr>
						<td>307</td>
						<td>Samuel Soh</td>
					</tr>
					<tr>
						<td>307</td>
						<td>Carmen Tay</td>
					</tr>
					<tr>
						<td>307</td>
						<td>Soh Hui Ling</td>
					</tr>
					<tr>
						<td>1012</td>
						<td>Corliss Chua</td>
					</tr>
					<tr>
						<td>1012</td>
						<td>Amber Hwang</td>
					</tr>
					<tr>
						<td>311</td>
						<td>Tan Jian Hong</td>
					</tr>
					<tr>
						<td>311</td>
						<td>Danny Tay</td>
					</tr>
					<tr>
						<td>905</td>
						<td>Melina Lim</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script>
		$(document).on('ready', function () {
			$('#datepicker1').datetimepicker();
		});
	</script>
</asp:Content>
