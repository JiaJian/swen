using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class UserAccountDbManager {

		#region Managing Guest Accounts (User Accounts and Authentication Module)

		public bool AddGuest(Guest guest) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_guest(first_name, last_name, email, password, address, postal_code, country) "
									+ "VALUES(@firstName, @lastName, @email, @password, @address, @postalCode, @country)";

					// guest.Password = Hash.HashPassword(guest.Password);

					cmd.Parameters.AddWithValue("@firstName", guest.FirstName);
					cmd.Parameters.AddWithValue("@lastName", guest.LastName);
					cmd.Parameters.AddWithValue("@email", guest.Email);
					cmd.Parameters.AddWithValue("@password", guest.Password);
					cmd.Parameters.AddWithValue("@address", guest.Address);
					cmd.Parameters.AddWithValue("@postalCode", guest.PostalCode);
					cmd.Parameters.AddWithValue("@country", guest.Country);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
		}

		public List<Guest> GetAllGuests() {
			List<Guest> result = new List<Guest>();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT * FROM tbl_guest;";

					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read()) {
						Guest guest = new Guest();

						guest.Id = (int)dr["id"];
						guest.FirstName = (string)dr["first_name"];
						guest.LastName = (string)dr["last_name"];
						guest.Email = (string)dr["email"];
						guest.Address = (string)dr["address"];
						guest.PostalCode = (string)dr["postal_code"];
						guest.Country = (string)dr["country"];

						result.Add(guest);
					}
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		#endregion

		#region Managing Staff Accounts (User Accounts and Authentication Module)

		/**
		 * Login method.
		 * @param userId the email or username to be checked.
		 * @param password the password associated with the userId.
		 * @return the User object if a matching pair of credentials is found and null if not.
		 */
		public User Login(string userId, string password) {
			User user = new User();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.CommandText = "SELECT tbl_staff.*, tbl_staff_role.name FROM dbo.tbl_staff, dbo.tbl_staff_role WHERE email = @userId AND password = @password AND tbl_staff.role_id = tbl_staff_role.id;";
					cmd.Connection = connection;

					// password = Hash.HashPassword(password);

					cmd.Parameters.AddWithValue("@userId", userId);
					cmd.Parameters.AddWithValue("@password", password);

					SqlDataReader dr = cmd.ExecuteReader();

					// Find the first user with matching credentials.
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

		public List<User> GetAllUsers() {
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

		public DataTable GetUsersByRoleId(int roleId) {
			DataTable result = new DataTable();

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "SELECT tbl_staff.*, tbl_staff_role.name FROM tbl_staff, tbl_staff_role WHERE tbl_staff.role_id = tbl_staff_role.id AND tbl_staff.role_id = @roleId;";

					cmd.Parameters.AddWithValue("@roleId", roleId);

					SqlDataReader dr = cmd.ExecuteReader();

					result.Load(dr);
					/*while (dr.Read()) {
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

						result.(user);
					}*/
				} catch (SqlException e) {
					throw e;
				}
			}

			return result;
		}

		#endregion
	}
}
