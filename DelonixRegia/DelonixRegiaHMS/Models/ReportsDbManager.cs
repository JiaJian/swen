using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	public class ReportsDbManager {
		public List<BookingGuest> GetGuestDetailsByRoom(string roomNumber) {
			List<BookingGuest> result = new List<BookingGuest>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT tbl_booking_guest.* FROM tbl_booking, tbl_booking_guest WHERE tbl_booking.room_number = @roomNumber AND tbl_booking.checkin_date >= @checkIn AND tbl_booking.checkout_date <= @checkOut;";

					cmd.Parameters.AddWithValue("@roomNumber", roomNumber);
					cmd.Parameters.AddWithValue("@checkIn", DateTime.Now);
					cmd.Parameters.AddWithValue("@checkOut", DateTime.Now);

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						BookingGuest bookingGuest = new BookingGuest();

						bookingGuest.Id = (int)dr["id"];
						bookingGuest.BookingId = (int)dr["booking_id"];
						bookingGuest.FirstName = (string)dr["first_name"];
						bookingGuest.LastName = (string)dr["last_name"];

						result.Add(bookingGuest);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

	}
}