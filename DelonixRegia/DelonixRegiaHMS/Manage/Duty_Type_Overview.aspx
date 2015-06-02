<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Duty_Type_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Duty_Type_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Overview of duty types
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of all duty types</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Success!</strong>
				<p><span id="lblMessageSuccess" runat="server"></span></p>
			</div>
			<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
				<strong>Whoops!</strong>
				<p><span id="lblMessageError" runat="server"></span></p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">

			<asp:Repeater ID="rptTable" runat="server">
				<HeaderTemplate>
					<table class="table table-striped" id="dtbl">
						<thead>
							<tr>
								<th>Duty Type ID</th>
								<th>Name</th>
								<th>Description</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td><%# Eval("id") %></td>
						<td>
							<p><%# Eval("name") %></p>
						</td>
						<td>
							<p>
								<%# Eval("information") %>
							</p>
						</td>
						<td>
							<a href="/manage/duty-type/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/duty-type/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="javascript:void(0);">
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
							<p><%# Eval("name") %></p>
						</td>
						<td>
							<p>
								<%# Eval("information") %>
							</p>
						</td>
						<td>
							<a href="/manage/duty-type/edit/<%# Eval("id") %>" class="btn btn-warning">
								<span class="glyphicon glyphicon-pencil"></span>
								Edit
							</a>
							<a data-href="/manage/duty-type/delete/<%# Eval("id") %>" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="javascript:void(0);">
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
