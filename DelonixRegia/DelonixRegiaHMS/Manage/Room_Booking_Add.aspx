<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Room_Booking_Add.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Room_Booking_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Create Room Booking
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Create a booking record</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="alert alert-success" role="alert" id="alertSuccess" runat="server" visible="false">
				<strong>Yay!</strong>
				<p>We added in the user already and have also sent an email to notify them.</p>
			</div>
			<div class="alert alert-danger" role="alert" id="alertError" runat="server" visible="false">
				<strong>Whoops!</strong>
				<p><span id="lblMessage" runat="server"></span></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="tbxFullName" class="col-sm-2 control-label">Guest Email Address</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" name="tbxEmail" id="tbxEmail" placeholder="Guest email address" required runat="server" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Room Number</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="ddlUserLevel" runat="server">
							<option>810</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Check In Date</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker1" data-date-format="DD-MM-YYYY">
							<input type="text" class="form-control" id="tbxStartDate" placeholder="When is the guest checking in?" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxStartDate" class="col-sm-2 control-label">Check Out Date</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker2" data-date-format="DD-MM-YYYY">
							<input type="text" class="form-control" id="Text1" placeholder="When is the guest checking out?" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Number of Guests</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="Select1" runat="server">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlUserLevel" class="col-sm-2 control-label">Status</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlUserLevel" id="Select2" runat="server">
							<option>Checked In</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxFullName" class="col-sm-2 control-label">Remarks</label>
					<div class="col-sm-10">
						<textarea rows="5" class="form-control" name="tbxEmail" id="Email1" placeholder="Enter remarks (such as special requirements)" required runat="server" autofocus />
					</div>
				</div>
				

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" id="btnSubmit" runat="server">
							<span class="glyphicon glyphicon-plus"></span>
							Create booking record
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
