<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="DelonixRegia.Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Complete Booking
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
	<style>
		.borderless tbody tr td, .borderless tbody tr th, .borderless thead tr th {
			border: none;
		}

		.booking-summary {
			background-color: #f5f5f5;
			border-radius: 6px;
			padding-top: 10px;
			padding-bottom: 10px;
			padding-left: 20px;
			padding-right: 20px;
			margin-top: 20px;
			margin-bottom: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron masthead jumbotron-banner-home">
		<div class="container">
			<h1>Complete Booking</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">Guest Details</h3>

						<!-- Use diff layout for new/returning guest option -->
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label class="radio-inline">
										<input type="radio" name="optGroup" id="optSignup" value="1" checked>
										New guest
									</label>
									<label class="radio-inline">
										<input type="radio" name="optGroup" id="optLogin" value="2">
										Returning guest &mdash; login for faster checkout!
									</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="control-label">First Name</label>
									<input type="text" class="form-control" id="ctr1" tabindex="1" runat="server" autofocus />
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="control-label">Last Name</label>
									<input type="text" class="form-control" id="ctr2" runat="server" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label class="control-label">Email</label>
									<input type="text" class="form-control" id="ctr_email" runat="server" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label class="control-label">Address</label>
									<input type="text" class="form-control" id="ctr3" runat="server" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="control-label">Country</label>
									<select class="form-control" id="ctr4" runat="server">
										<option value="Singapore">Singapore</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="control-label">Postal Code</label>
									<input type="text" class="form-control" id="ctr5" runat="server" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">Booking Details</h3>

						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label class="control-label">Special Requests</label>
									<textarea class="form-control" id="ctr_b1" rows="5" runat="server" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="row">
					<div class="col-lg-12">
						<div class="booking-summary">
							<h3>Summary</h3>
							<p>
								Your booking is for a <strong>Superior Room</strong> for <strong>4 nights</strong>, from
								Thursday, 21 May 2015 &mdash; Monday, 25 May 2015.
							</p>
							<table class="table borderless">
								<tr>
									<td><strong>Superior Room</strong></td>
									<td></td>
								</tr>
								<tr>
									<td>4 nights</td>
									<td>S$720</td>
								</tr>
								<tr>
									<td><strong>Total</strong></td>
									<td>S$720</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<a href="test" class="btn btn-success btn-block">Confirm Booking</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
