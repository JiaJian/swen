using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class RoomBookingDbManager {
		#region Room Availability and Booking Module

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
		#endregion
	}
}
