﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace DelonixRegiaHMS.Models {
	class StaffRecordsDbManager {
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

					cmd.Parameters.AddWithValue("@firstName", user.Id);
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
	}
}
