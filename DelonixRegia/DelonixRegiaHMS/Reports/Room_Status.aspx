<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Status.aspx.cs" Inherits="DelonixRegiaHMS.Reports.Room_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
	<style>
		.ui {
			background-color: #f5f5f5;
			border-radius: 6px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			padding-right: 20px;
			margin-bottom: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Room status report
				<button class="btn btn-warning pull-right">
					<span class="fa fa-download"></span>
					Export
				</button>
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Room Number</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>201</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>202</td>
						<td>Vacant (Scheduled for Cleaning)</td>
					</tr>
					<tr>
						<td>203</td>
						<td>Vacant (Scheduled for Cleaning)</td>
					</tr>
					<tr>
						<td>204</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>205</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>206</td>
						<td>Vacant (Scheduled for Cleaning)</td>
					</tr>
					<tr>
						<td>207</td>
						<td>Vacant</td>
					</tr>
					<tr>
						<td>208</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>209</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>210</td>
						<td>Vacant</td>
					</tr>
					<tr>
						<td>301</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>302</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>303</td>
						<td>Occupied</td>
					</tr>
					<tr>
						<td>304</td>
						<td>Occupied</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
