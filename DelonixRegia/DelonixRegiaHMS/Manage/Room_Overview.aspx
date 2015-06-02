<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Room_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of all rooms</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>ID</th>
						<th>Room Number</th>
						<th>Room Type</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>201</td>
						<td>Superior Room</td>
						<td>Vacant</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>202</td>
						<td>Superior Room</td>
						<td>Occupied</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>14</td>
						<td>501</td>
						<td>Superior Room</td>
						<td>Vacant</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>15</td>
						<td>506</td>
						<td>Deluxe Room</td>
						<td>Occupied</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#" >
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>49</td>
						<td>809</td>
						<td>Waterfront Suite</td>
						<td>Vacant (Scheduled for Cleaning)</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>50</td>
						<td>810</td>
						<td>Waterfront Suite</td>
						<td>Occupied</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-info"></span>
								Details
							</a>
							<a href="/manage/user/edit/<%# Eval("user_id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/user/delete/<%# Eval("user_id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
								<span class="glyphicon glyphicon-trash"></span>
								Delete
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
