<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Guest_Details_Room.aspx.cs" Inherits="DelonixRegiaHMS.Reports.Guest_Details_Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Guest details report (by room)
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Guest details report (by room)
				<button class="btn btn-warning pull-right" id="btnExport" runat="server">
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
							<label class="control-label">Room</label>
							<select class="form-control" name="ddlRooms" id="ddlRooms" runat="server">
							</select>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">&nbsp;</label>
							<div class="clearfix"></div>
							<button class="btn btn-success" id="btnSearch" runat="server">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Report for Room 1015 as of today</h2>
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
								<th>Guest Full Name</th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td><%# Eval("RoomNumber") %></td>
						<td>
							<p><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
						</td>
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<tr>
						<td><%# Eval("RoomNumber") %></td>
						<td>
							<p><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
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
