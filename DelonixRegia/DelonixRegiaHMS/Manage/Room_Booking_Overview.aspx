<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Booking_Overview.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Room_Booking_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Overview of All Room Bookings
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Overview of booking records</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped" id="dtbl">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Guest Email</th>
						<th>Room Number</th>
						<th>Check-in Date</th>
						<th>Check-out Date</th>
						<th>Booking Creation</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="mailto:boywilfred@gmail.com">boywilfred@gmail.com</a></td>
						<td>810</td>
						<td>18 May 2015</td>
						<td>21 May 2015</td>
						<td>12 March 2015</td>
						<td>Checked In</td>
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
						<td><a href="mailto:boywilfred@gmail.com">its@jiajian.me</a></td>
						<td>1018</td>
						<td>28 May 2015</td>
						<td>30 May 2015</td>
						<td>17 March 2015</td>
						<td>Confirmed</td>
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
