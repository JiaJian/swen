<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Guest_Account_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Guest_Account_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of all guest accounts <small>for the online web app</small></h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Guest ID</th>
						<th>Full Name</th>
						<th>Email Address</th>
						<th>Address</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Justina Khoo</td>
						<td><a href="#">crystalchandeliers96@gmail.com</a></td>
						<td>
							<p>12 Boon Keng Road</p>
							<p>Singapore 205012</p>
						</td>
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
						<td>Denver Tan</td>
						<td><a href="#">revned.nat@gmail.com</a></td>
						<td>
							<p>218 Hougang Avenue 10</p>
							<p>Singapore 317218</p>
						</td>
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
						<td>Danish Appleton</td>
						<td><a href="#">danish_appleton@microsoft.com</a></td>
						<td>
							<p>2 Marina Boulevard OUE #18-05</p>
							<p>Singapore 017010</p>
						</td>
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
						<td>4</td>
						<td>Tay Jun Yang</td>
						<td><a href="#">dannytayjy@live.com</a></td>
						<td>
							<p>Blk 320 Tampines Street 92</p>
							<p>Singapore 572320</p>
						</td>
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
						<td>5</td>
						<td>Muhammad Hilmi Ja'affar</td>
						<td><a href="#">hilmi@google.com</a></td>
						<td>
							<p>Blk 128 Hougang Ave 8</p>
							<p>Singapore 315128</p>
						</td>
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
