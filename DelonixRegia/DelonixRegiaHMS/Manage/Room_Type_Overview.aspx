<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Type_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Room_Type_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of all room types</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">

			<asp:Repeater ID="rptTable" runat="server">
				<HeaderTemplate>
					<table class="table table-striped" id="dtbl">
						<thead>
							<tr>
								<th>Room Type ID</th>
								<th>Room Type</th>
								<th>Rate (S$)</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td><%# Eval("id") %></td>
						<td>
							<p><%# Eval("type") %></p>
						</td>
						<td>
							<p>
								S$<%# Eval("rate") %>
							</p>
						</td>
						<td>
							<a href="/manage/room-type/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/room-type/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<tr>
						<td><%# Eval("id") %></td>
						<td>
							<p><%# Eval("type") %></p>
						</td>
						<td>
							<p>
								S$<%# Eval("rate") %>
							</p>
						</td>
						<td>
							<a href="/manage/room-type/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/room-type/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
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
