<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Staff_Account_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Staff_Account_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of all staff accounts <small>for the internal web app</small></h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Staff ID</th>
						<th>Full Name</th>
						<th>Email Address</th>
						<th>Account Role</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>James Wang</td>
						<td><a href="#">james@delonixregia.com</a></td>
						<td>Administrator</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-refresh"></span>
								Reset Password
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
						<td>Sim Jia Zhi</td>
						<td><a href="#">sim.jiazhi@gmail.com</a></td>
						<td>Maintenance Crew</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-refresh"></span>
								Reset Password
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
						<td>3</td>
						<td>Goi Jia Jian</td>
						<td><a href="#">its@jiajian.me</a></td>
						<td>Management</td>
						<td>
							<a href="/manage/user/view/<%# Eval("user_id") %>" class="btn btn-info">
								<span class="fa fa-refresh"></span>
								Reset Password
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
