<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Housekeeping.aspx.cs" Inherits="DelonixRegiaHMS.Reports.Housekeeping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Housekeeping report
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
								<option selected>Weekly</option>
								<option>Monthly</option>
							</select>
						</div>
					</div>

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
			<h2 class="page-header">Weekly housekeeping report <small>(for period starting Monday, 18 May 2015)</small></h2>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Duty ID</th>
						<th>Maintenance Staff Full Name</th>
						<th>Duty Assigned</th>
						<th>Duty Start</th>
						<th>Duty End</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Sim Jia Zhi</td>
						<td>General Maintenance</td>
						<td>18 May 2015 9:00am</td>
						<td>18 May 2015 1:00pm</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Debbie Lim</td>
						<td>General Maintenance</td>
						<td>18 May 2015 9:00am</td>
						<td>18 May 2015 1:00pm</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Tan Kok Hui</td>
						<td>Security</td>
						<td>18 May 2015 9:00am</td>
						<td>18 May 2015 5:00pm</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Lau Shaw Keong</td>
						<td>Security</td>
						<td>18 May 2015 9:00am</td>
						<td>18 May 2015 5:00pm</td>
					</tr>
					<tr>
						<td>5</td>
						<td>Sim Jia Zhi</td>
						<td>Estate Maintenance</td>
						<td>18 May 2015 2:00pm</td>
						<td>18 May 2015 5:00pm</td>
					</tr>
					<tr>
						<td>6</td>
						<td>Tan Hui Ling</td>
						<td>Security</td>
						<td>19 May 2015 1:00am</td>
						<td>19 May 2015 7:00am</td>
					</tr>
					<tr>
						<td>7</td>
						<td>Lau Shaw Keong</td>
						<td>Security</td>
						<td>20 May 2015 1:00am</td>
						<td>20 May 2015 7:00am</td>
					</tr>
					<tr>
						<td>8</td>
						<td>Sim Jia Zhi</td>
						<td>Estate Maintenance</td>
						<td>20 May 2015 9:00am</td>
						<td>23 May 2015 1:00pm</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
