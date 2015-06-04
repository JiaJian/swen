using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Room_Booking_Add : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {

			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			Booking booking = new Booking();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxEmail.Value)
					&& !string.IsNullOrEmpty(tbxCheckIn.Value)
					&& !string.IsNullOrEmpty(tbxCheckOut.Value)) {


					Guest guest = new UserAccountDbManager().GetGuestByEmail(tbxEmail.Value);
					if (guest != null) {
						booking.GuestId = guest.Id;
						booking.RoomNumber = ddlRoomNumber.Value;
						booking.CheckInDate = DateTime.ParseExact(tbxCheckIn.Value, "dd/MM/yyyy HH:mm", CultureInfo.CurrentCulture);
						booking.CheckOutDate = DateTime.ParseExact(tbxCheckOut.Value, "dd/MM/yyyy HH:mm", CultureInfo.CurrentCulture);
						booking.Status = ddlStatus.Value;
						booking.NoOfGuests = Int32.Parse(ddlGuests.Value);
						booking.Remarks = tbxRemarks.Value == null ? "" : tbxRemarks.Value;
						booking.PaymentType = ddlPaymentType.Value;
						booking.Timestamp = DateTime.Now;

						if (new RoomBookingDbManager().AddRoomBooking(booking)) {
							Booking bkg = new RoomBookingDbManager().GetBookingByGuestIdAndTimestamp(booking.GuestId, booking.Timestamp);

							for (int i = 1; i <= booking.NoOfGuests; i++) {
								BookingGuest bookingGuest = new BookingGuest();

								var firstName = Request.Form["firstName" + i];
								var lastName = Request.Form["lastName" + i];

								bookingGuest.FirstName = firstName;
								bookingGuest.LastName = lastName;
								bookingGuest.BookingId = bkg.Id; // Booking ID.

								if (new RoomBookingDbManager().AddBookingGuest(bookingGuest)) {
									alertSuccess.Visible = true;
									alertError.Visible = false;
								}
							}
						}
					}
				} else {
					lblMessage.InnerText = "Unable to save this record!";
					alertError.Visible = true;
					alertSuccess.Visible = false;
				}
			} catch (Exception ex) {
				lblMessage.InnerText = "Unable to save this record!";
				alertError.Visible = true;
				alertSuccess.Visible = false;
			}
		}
	}
}