using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class StaffRecordsDbManager {
		/*
		 * Methods for the staff records section.
		 */
		#region Staff Records Section
		public List<User> GetAllStaffRecords() {
			List<User> result = new List<User>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT tbl_staff.*, tbl_staff_role.name FROM tbl_staff, tbl_staff_role WHERE tbl_staff.role_id = tbl_staff_role.id;";

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						User user = new User();

						user.Id = (int)dr["id"];
						user.FirstName = (string)dr["first_name"];
						user.LastName = (string)dr["last_name"];
						user.Email = (string)dr["email"];
						user.Address = (string)dr["address"];
						user.PostalCode = (string)dr["postal_code"];
						user.BankName = (string)dr["bank_name"];
						user.BankAccountNumber = (string)dr["bank_account_number"];
						user.RoleId = (int)dr["role_id"];
						user.RoleName = (string)dr["name"];

						result.Add(user);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		public User GetStaffRecordById(int id) {
			User user = new User();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT tbl_staff.*, tbl_staff_role.name FROM tbl_staff, tbl_staff_role WHERE tbl_staff.role_id = tbl_staff_role.id AND tbl_staff.id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						user.Id = (int)dr["id"];
						user.FirstName = (string)dr["first_name"];
						user.LastName = (string)dr["last_name"];
						user.Email = (string)dr["email"];
						user.Address = (string)dr["address"];
						user.PostalCode = (string)dr["postal_code"];
						user.BankName = (string)dr["bank_name"];
						user.BankAccountNumber = (string)dr["bank_account_number"];
						user.RoleId = (int)dr["role_id"];
						user.RoleName = (string)dr["name"];
					} else {
						user = null;
					}

				}
			} catch (SqlException e) {
				throw e;
			}

			return user;
		}

		public bool UpdateStaffRecord(User user) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_staff SET first_name = @firstName, last_name = @lastName, email = @email, address = @address, "
							+ " postal_code = @postalCode, bank_name = @bankName, bank_account_number = @bankAccountNumber "
							+ " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@firstName", user.FirstName);
					cmd.Parameters.AddWithValue("@lastName", user.LastName);
					cmd.Parameters.AddWithValue("@email", user.Email);
					cmd.Parameters.AddWithValue("@address", user.Address);
					cmd.Parameters.AddWithValue("@postalCode", user.PostalCode);
					cmd.Parameters.AddWithValue("@bankName", user.BankName);
					cmd.Parameters.AddWithValue("@bankAccountNumber", user.BankAccountNumber);
					cmd.Parameters.AddWithValue("@id", user.Id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}
		#endregion

		/*
		 * Methods for the duty type section.
		 */
		#region Duty Type Section
		public List<DutyType> GetAllDutyTypes() {
			List<DutyType> result = new List<DutyType>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT * FROM tbl_duty_type;";

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						DutyType dutyType = new DutyType();

						dutyType.Id = (int)dr["id"];
						dutyType.Name = (string)dr["name"];
						dutyType.Information = (string)dr["information"];

						result.Add(dutyType);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		public DutyType GetDutyTypeById(int id) {
			DutyType dutyType = new DutyType();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_duty_type WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						dutyType.Id = (int)dr["id"];
						dutyType.Name = (string)dr["name"];
						dutyType.Information = (string)dr["information"];
					} else {
						dutyType = null;
					}

				}
			} catch (SqlException e) {
				throw e;
			}

			return dutyType;
		}

		public bool AddDutyType(DutyType dutyType) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_duty_type(name, information) "
									+ "VALUES(@name, @information)";

					cmd.Parameters.AddWithValue("@name", dutyType.Name);
					cmd.Parameters.AddWithValue("@information", dutyType.Information);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		public bool UpdateDutyType(DutyType dutyType) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_duty_type SET name = @name, information = @information "
							+ " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@name", dutyType.Name);
					cmd.Parameters.AddWithValue("@information", dutyType.Information);
					cmd.Parameters.AddWithValue("@id", dutyType.Id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}
		#endregion

		/*
		 * Methods for the duty roster/housekeeping section.
		 */
		#region Housekeeping Section
		public bool AddDutyRoster(DutyRoster dutyRoster) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_duty_roster(staff_id, duty_id, duty_start, duty_end) "
									+ "VALUES(@staffId, @dutyId, @dutyStart, @dutyEnd)";

					cmd.Parameters.AddWithValue("@staffId", dutyRoster.StaffId);
					cmd.Parameters.AddWithValue("@dutyId", dutyRoster.DutyTypeId);
					cmd.Parameters.AddWithValue("@dutyStart", dutyRoster.DutyStart);
					cmd.Parameters.AddWithValue("@dutyEnd", dutyRoster.DutyEnd);

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
