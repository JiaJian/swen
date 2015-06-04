﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class RoomBookingDbManager {
		#region Room Types

		/**
		 * Inserts a new room type.
		 * @param roomType the room type object.
		 * @return true if login successful.
		 */
		public bool AddRoomType(RoomType roomType) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_room_type(type, rate) "
									+ "VALUES(@type, @rate)";

					cmd.Parameters.AddWithValue("@type", roomType.Type);
					cmd.Parameters.AddWithValue("@rate", roomType.Rate);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		/**
		 * This method returns all room types.
		 */
		public List<RoomType> GetAllRoomTypes() {
			List<RoomType> result = new List<RoomType>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT * FROM tbl_room_type;";

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						RoomType roomType = new RoomType();

						roomType.Id = (int)dr["id"];
						roomType.Type = (string)dr["type"];
						roomType.Rate = Double.Parse(dr["rate"].ToString());

						result.Add(roomType);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		/**
		 * Retrieves a single room type.
		 * @param id the ID of the room type.
		 * @return the RoomType object.
		 */
		public RoomType GetRoomTypeById(int id) {
			RoomType roomType = new RoomType();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_room_type WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						roomType.Id = id;
						roomType.Type = (string)dr["type"];
						roomType.Rate = Double.Parse(dr["rate"].ToString());
					} else {
						roomType = null;
					}

				}
			} catch (SqlException e) {
				throw e;
			}

			return roomType;
		}

		public bool UpdateRoomType(RoomType roomType) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_room_type SET type = @type, rate = @rate "
							+ " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", roomType.Id);
					cmd.Parameters.AddWithValue("@type", roomType.Type);
					cmd.Parameters.AddWithValue("@rate", roomType.Rate);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		public bool DeleteRoomType(int id) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("DELETE FROM tbl_room_type WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		#endregion

		#region Rooms

		/**
		 * Inserts a new room type.
		 * @param roomType the room type object.
		 * @return true if login successful.
		 */
		public bool AddRoom(Room room) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_room(room_type_id, room_number, status) "
									+ "VALUES(@roomTypeId, @roomNumber, @status)";

					cmd.Parameters.AddWithValue("@roomTypeId", room.RoomTypeId);
					cmd.Parameters.AddWithValue("@roomNumber", room.RoomNumber);
					cmd.Parameters.AddWithValue("@status", room.Status);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		/**
		 * This method returns all room records.
		 */
		public List<Room> GetAllRooms() {
			List<Room> result = new List<Room>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT tbl_room.*, tbl_room_type.type FROM tbl_room, tbl_room_type WHERE tbl_room.room_type_id = tbl_room_type.id;";

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						Room room = new Room();

						room.Id = (int)dr["id"];
						room.RoomNumber = (string)dr["room_number"];
						room.RoomTypeId = (int)dr["room_type_id"];
						room.RoomType = (string)dr["type"];
						room.Status = (int)dr["status"];

						result.Add(room);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		public List<Room> GetAllRooms(int status) {
			List<Room> result = new List<Room>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT tbl_room.*, tbl_room_type.type FROM tbl_room, tbl_room_type WHERE tbl_room.room_type_id = tbl_room_type.id AND tbl_room.status = @status;";

					cmd.Parameters.AddWithValue("@status", status);

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						Room room = new Room();

						room.Id = (int)dr["id"];
						room.RoomNumber = (string)dr["room_number"];
						room.RoomTypeId = (int)dr["room_type_id"];
						room.RoomType = (string)dr["type"];
						room.Status = (int)dr["status"];

						result.Add(room);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		/**
		 * Retrieves a single room type.
		 * @param roomNumber the room number of the room record to be retrieved.
		 * @return the RoomType object.
		 */
		public Room GetRoomByRoomNumber(string roomNumber) {
			Room room = new Room();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_room WHERE room_number = @roomNumber;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@roomNumber", roomNumber);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						room.Id = (int)dr["id"];
						room.RoomNumber = (string)dr["room_number"];
						room.RoomTypeId = (int)dr["room_type_id"];
						room.Status = (int)dr["status"];
					} else {
						room = null;
					}
				}
			} catch (SqlException e) {
				throw e;
			}

			return room;
		}

		/**
		 * Retrieves a single room type.
		 * @param id the unique ID of the room record to be retrieved.
		 * @return the RoomType object.
		 */
		public Room GetRoomById(int id) {
			Room room = new Room();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_room WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						room.Id = (int)dr["id"];
						room.RoomNumber = (string)dr["room_number"];
						room.RoomTypeId = (int)dr["room_type_id"];
						room.Status = (int)dr["status"];

					} else {
						room = null;
					}
				}
			} catch (SqlException e) {
				throw e;
			}

			return room;
		}

		public bool UpdateRoom(Room room) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_room SET room_number = @roomNumber, room_type_id = @roomTypeId, status = @status "
							+ " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", room.Id);
					cmd.Parameters.AddWithValue("@roomNumber", room.RoomNumber);
					cmd.Parameters.AddWithValue("@roomTypeId", room.RoomTypeId);
					cmd.Parameters.AddWithValue("@status", room.Status);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		public bool DeleteRoom(int id) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("DELETE FROM tbl_room WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		#endregion

		#region Room Bookings

		public bool AddRoomBooking(Booking booking) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_booking(guest_id, room_number, no_of_guests, checkin_date, checkout_date, status, remarks, payment_type, timestamp) "
									+ "VALUES(@guestId, @roomNumber, @noOfGuests, @checkInDate, @checkOutDate, @status, @remarks, @paymentType, @timestamp)";

					cmd.Parameters.AddWithValue("@guestId", booking.GuestId);
					cmd.Parameters.AddWithValue("@roomNumber", booking.RoomNumber);
					cmd.Parameters.AddWithValue("@noOfGuests", booking.NoOfGuests);
					cmd.Parameters.AddWithValue("@checkInDate", booking.CheckInDate);
					cmd.Parameters.AddWithValue("@checkOutDate", booking.CheckOutDate);
					cmd.Parameters.AddWithValue("@status", booking.Status);
					cmd.Parameters.AddWithValue("@remarks", booking.Remarks);
					cmd.Parameters.AddWithValue("@paymentType", booking.PaymentType);
					cmd.Parameters.AddWithValue("@timestamp", booking.Timestamp);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		public bool AddBookingGuest(BookingGuest bookingGuest) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_booking_guest(booking_id, first_name, last_name) "
									+ "VALUES(@bookingId, @firstName, @lastName)";

					cmd.Parameters.AddWithValue("@bookingId", bookingGuest.BookingId);
					cmd.Parameters.AddWithValue("@firstName", bookingGuest.FirstName);
					cmd.Parameters.AddWithValue("@lastName", bookingGuest.LastName);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		public Booking GetBookingByGuestIdAndTimestamp(int guestId, DateTime timestamp) {
			Booking booking = new Booking();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_booking WHERE guest_id = @guestId AND timestamp = @timestamp;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@guestId", guestId);
					cmd.Parameters.AddWithValue("@timestamp", timestamp);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						booking.Id = (int)dr["id"];
						booking.GuestId = (int)dr["guest_id"];
						booking.RoomNumber = (string)dr["room_number"];
						booking.NoOfGuests = (int)dr["no_of_guests"];
						booking.CheckInDate = DateTime.Parse(dr["checkin_date"].ToString());
						booking.CheckOutDate = DateTime.Parse(dr["checkout_date"].ToString());
						booking.PaymentType = (string)dr["payment_type"];
						booking.Remarks = dr["remarks"] == null ? "" : (string)dr["remarks"];
						booking.Status = (string)dr["status"];
					} else {
						booking = null;
					}
				}
			} catch (SqlException e) {
				throw e;
			}

			return booking;
		}


		#endregion
	}
}