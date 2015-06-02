using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class UserAccountDbManager {
		#region User Accounts and Authentication Module

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

		#endregion
	}
}
