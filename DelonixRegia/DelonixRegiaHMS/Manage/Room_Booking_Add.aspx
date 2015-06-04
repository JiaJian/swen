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
				<strong>Success!</strong>
				<p>Room booking created.</p>
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
					<label for="tbxEmail" class="col-sm-2 control-label">Guest Email Address</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" name="tbxEmail" id="tbxEmail" placeholder="Guest email address" required runat="server" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlRoomNumber" class="col-sm-2 control-label">Room Number</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlRoomNumber" id="ddlRoomNumber" runat="server">
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxCheckIn" class="col-sm-2 control-label">Check In Date</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker1">
							<input type="text" class="form-control" id="tbxCheckIn" placeholder="When is the guest checking in?" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxCheckOut" class="col-sm-2 control-label">Check Out Date</label>
					<div class="col-sm-10">
						<div class="input-group date" id="datetimepicker2">
							<input type="text" class="form-control" id="tbxCheckOut" placeholder="When is the guest checking out?" runat="server">
							<span class="input-group-addon"><span class="fa fa-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlGuests" class="col-sm-2 control-label">Number of Guests</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlGuests" id="ddlGuests" runat="server">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="ddlStatus" class="col-sm-2 control-label">Status</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlStatus" id="ddlStatus" runat="server">
							<option value="Confirmed">Confirmed</option>
							<option value="Checked In">Checked In</option>
							<option value="Checked Out">Checked Out</option>
							<option value="Cancelled">Cancelled</option>
							<option value="Invoiced">Invoiced</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="tbxRemarks" class="col-sm-2 control-label">Remarks</label>
					<div class="col-sm-10">
						<textarea rows="5" class="form-control" name="tbxRemarks" id="tbxRemarks" placeholder="Enter remarks (such as special requirements)" required runat="server" autofocus />
					</div>
				</div>

				<div class="form-group">
					<label for="ddlPaymentType" class="col-sm-2 control-label">Payment Type</label>
					<div class="col-sm-10">
						<select class="form-control" name="ddlPaymentType" id="ddlPaymentType" runat="server">
							<option value="Cash">Cash</option>
							<option value="Credit Card">Credit Card</option>
						</select>
					</div>
				</div>

				<div id="details">
					<div class="form-group">
						<label class="col-sm-2 control-label">Guest Details 1</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="firstName1" placeholder="First name">
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="lastName1" placeholder="Last name">
						</div>
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
	<script src="/Assets/Scripts/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function () {
			$('#datetimepicker1').datetimepicker({
				format: 'DD/MM/YYYY HH:mm'
			});

			$('#datetimepicker2').datetimepicker({
				format: 'DD/MM/YYYY HH:mm'
			});

			$("#datetimepicker1").on("dp.change", function (e) {
				$('#datetimepicker2').data("DateTimePicker").minDate(e.date);
			});
			$("#datetimepicker2").on("dp.change", function (e) {
				$('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
			});

			$('#MainContent_ddlGuests').on('change', function () {
				var number = $('#MainContent_ddlGuests').val();

				$('#details').html("");

				for (var i = 1; i <= number; i++) {
					var html = '<div class="form-group">'
							+ '<label class="col-sm-2 control-label">Guest Details ' + i + ' </label>'
							+ '<div class="col-sm-5">'
								+ '<input type="text" class="form-control" name="firstName' + i + '" placeholder="First name">'
							+ '</div>'
							+ '<div class="col-sm-5">'
								+ '<input type="text" class="form-control" name="lastName' + i + '" placeholder="Last name">'
							+ '</div>'
							+ '</div>';
					$('#details').append(html);
				}
			});
		});
	</script>
</asp:Content>
