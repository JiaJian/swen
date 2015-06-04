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

		public Guest GetGuestById(int id) {
			Guest guest = new Guest();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_guest WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						guest.Id = (int)dr["id"];
						guest.FirstName = (string)dr["first_name"];
						guest.LastName = (string)dr["last_name"];
						guest.Email = (string)dr["email"];
						guest.Address = (string)dr["address"];
						guest.PostalCode = (string)dr["postal_code"];
						guest.Country = (string)dr["country"];
					} else {
						guest = null;
					}
				}
			} catch (SqlException e) {
				throw e;
			}

			return guest;
		}

		public Guest GetGuestByEmail(string email) {
			Guest guest = new Guest();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_guest WHERE email = @email;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@email", email);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						guest.Id = (int)dr["id"];
						guest.FirstName = (string)dr["first_name"];
						guest.LastName = (string)dr["last_name"];
						guest.Email = (string)dr["email"];
						guest.Address = (string)dr["address"];
						guest.PostalCode = (string)dr["postal_code"];
						guest.Country = (string)dr["country"];
					} else {
						guest = null;
					}
				}
			} catch (SqlException e) {
				throw e;
			}

			return guest;
		}

		public bool UpdateGuest(Guest guest) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_guest SET first_name = @firstName, last_name = @lastName, email = @email, address = @address, ";

					sqlCmd += !string.IsNullOrEmpty(guest.Password) ? " password = @password, " : ""; // If password is specified, then we will change it. Otherwise we won't.
					sqlCmd += " postal_code = @postalCode, country = @country ";
					sqlCmd += " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", guest.Id);
					cmd.Parameters.AddWithValue("@firstName", guest.FirstName);
					cmd.Parameters.AddWithValue("@lastName", guest.LastName);
					cmd.Parameters.AddWithValue("@email", guest.Email);

					BCrypt bcrypt = new BCrypt();
					string salt = BCrypt.GenerateSalt();
					string hashedPw = BCrypt.HashPassword(guest.Password, salt);
					guest.Password = hashedPw;

					cmd.Parameters.AddWithValue("@password", hashedPw);
					cmd.Parameters.AddWithValue("@address", guest.Address);
					cmd.Parameters.AddWithValue("@postalCode", guest.PostalCode);
					cmd.Parameters.AddWithValue("@country", guest.Country);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		public bool DeleteGuest(int id) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("DELETE FROM tbl_guest WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
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

					string salt = GetSaltByEmail(userId);
					string hashedPw = BCrypt.HashPassword(password, salt);

					cmd.Parameters.AddWithValue("@userId", userId);
					cmd.Parameters.AddWithValue("@password", hashedPw);

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


		public string GetSaltByEmail(string email) {
			User user = new User();

			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("SELECT password FROM tbl_staff WHERE email = @email;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@email", email);

					SqlDataReader dr = cmd.ExecuteReader();

					if (dr.Read()) {
						return (string)dr["password"];
					} else {
						return "";
					}
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		public bool AddUser(User user) {
			int rowsInserted = 0;

			using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
				try {
					connection.Open();

					SqlCommand cmd = new SqlCommand();
					cmd.Connection = connection;
					cmd.CommandText = "INSERT INTO tbl_staff(first_name, last_name, email, password, address, postal_code, bank_name, bank_account_number, role_id) "
									+ "VALUES(@firstName, @lastName, @email, @password, @address, @postalCode, @bankName, @bankAccountNumber, @roleId)";

					// user.Password = Hash.HashPassword(user.Password);

					cmd.Parameters.AddWithValue("@firstName", user.FirstName);
					cmd.Parameters.AddWithValue("@lastName", user.LastName);
					cmd.Parameters.AddWithValue("@email", user.Email);
					cmd.Parameters.AddWithValue("@password", user.Password);
					cmd.Parameters.AddWithValue("@address", user.Address);
					cmd.Parameters.AddWithValue("@postalCode", user.PostalCode);
					cmd.Parameters.AddWithValue("@bankName", user.BankName);
					cmd.Parameters.AddWithValue("@bankAccountNumber", user.BankAccountNumber);
					cmd.Parameters.AddWithValue("@roleId", user.RoleId);

					rowsInserted = cmd.ExecuteNonQuery();

					return rowsInserted > 0;
				} catch (SqlException e) {
					throw e;
				}
			}
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

		public User GetUserById(int id) {
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

		public bool UpdateUser(User user) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					// Our SQL command string builder.
					string sqlCmd = "UPDATE tbl_staff SET first_name = @firstName, last_name = @lastName, email = @email, address = @address, ";

					sqlCmd += !string.IsNullOrEmpty(user.Password) ? " password = @password, " : ""; // If password is specified, then we will change it. Otherwise we won't.
					sqlCmd += " postal_code = @postalCode, bank_name = @bankName, bank_account_number = @bankAccountNumber, role_id = @roleId ";

					sqlCmd += " WHERE id = @id;";

					SqlCommand cmd = new SqlCommand(sqlCmd);

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", user.Id);
					cmd.Parameters.AddWithValue("@firstName", user.FirstName);
					cmd.Parameters.AddWithValue("@lastName", user.LastName);
					cmd.Parameters.AddWithValue("@email", user.Email);

					BCrypt bcrypt = new BCrypt();
					string salt = BCrypt.GenerateSalt();
					string hashedPw = BCrypt.HashPassword(user.Password, salt);
					user.Password = hashedPw;

					cmd.Parameters.AddWithValue("@password", hashedPw);
					cmd.Parameters.AddWithValue("@address", user.Address);
					cmd.Parameters.AddWithValue("@postalCode", user.PostalCode);
					cmd.Parameters.AddWithValue("@bankName", user.BankName);
					cmd.Parameters.AddWithValue("@bankAccountNumber", user.BankAccountNumber);
					cmd.Parameters.AddWithValue("@roleId", user.RoleId);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		public bool DeleteUser(int id) {
			try {
				using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString)) {
					connection.Open();

					SqlCommand cmd = new SqlCommand("DELETE FROM tbl_staff WHERE id = @id;");

					cmd.Connection = connection;

					cmd.Parameters.AddWithValue("@id", id);

					return cmd.ExecuteNonQuery() > 0;
				}
			} catch (SqlException e) {
				throw e;
			}
		}

		#endregion
	}
}
