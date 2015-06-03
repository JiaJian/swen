<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Staff_Account_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Staff_Account_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Overview of all staff accounts
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

			<asp:Repeater ID="rptTable" runat="server">
				<HeaderTemplate>
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
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td><%# Eval("id") %></td>
						<td>
							<p><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
						</td>
						<td>
							<p>
								<a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
							</p>
						</td>
						<td>
							<p>
								<%# Eval("RoleName") %>
							</p>
						</td>
						<td>
							<a href="/manage/staff-accounts/reset-pw/<%# Eval("id") %>" class="btn btn-info">
								<span class="fa fa-refresh"></span>
								Reset Password
							</a>
							<a href="/manage/staff-accounts/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/staff-accounts/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
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
							<p><%# Eval("FirstName") %> <%# Eval("LastName") %></p>
						</td>
						<td>
							<p>
								<a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
							</p>
						</td>
						<td>
							<p>
								<%# Eval("RoleName") %>
							</p>
						</td>
						<td>
							<a href="/manage/staff-accounts/reset-pw/<%# Eval("id") %>" class="btn btn-info">
								<span class="fa fa-refresh"></span>
								Reset Password
							</a>
							<a href="/manage/staff-accounts/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/staff-accounts/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#">
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

	<!-- Modal -->
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Confirm deletion</h4>
				</div>
				<div class="modal-body">
					Are you sure you want to delete the record?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">No please</button>
					<a href="#" class="btn btn-danger really-confirm-delete">Delete</a>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script type="text/javascript">
		$('#confirm-delete').on('show.bs.modal', function (e) {
			$(this).find('.really-confirm-delete').attr('href', $(e.relatedTarget).data('href'));
		});
	</script>
</asp:Content>
