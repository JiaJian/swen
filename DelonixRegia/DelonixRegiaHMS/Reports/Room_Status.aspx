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
			<asp:Repeater ID="rptTable" runat="server">
				<HeaderTemplate>
					<table class="table table-striped" id="dtbl">
						<thead>
							<tr>
								<th>Room Number</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td><%# Eval("RoomNumber") %></td>
						<td>
							<p><%# GetStatusDescription((int)Eval("status")) %></p>
						</td>
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<tr>
						<td><%# Eval("RoomNumber") %></td>
						<td>
							<p><%# GetStatusDescription((int)Eval("status")) %></p>
						</td>
					</tr>
				</AlternatingItemTemplate>
				<FooterTemplate>
					</tbody>
			</table>
				</FooterTemplate>
			</asp:Repeater>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
