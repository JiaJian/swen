using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelonixRegiaHMS.Models {
	class User {
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Email { get; set; }
		public string Password { get; set; }
		public string Address { get; set; }
		public string PostalCode { get; set; }
		public string BankName { get; set; }
		public string BankAccountNumber { get; set; }
		public int RoleId { get; set; }

		/**
		 * For role-based authentication.
		 * Will not be used to insert into db.
		 */
		public string RoleName { get; set; }

		/**
		 * Recreating ASP.NET MVC Membership's IsInRole() method.
		 * @param roleName the name of the role to be compared with the current user's role.
		 * @return true if the current user has the specified role.
		 */
		public bool HasRole(string roleName) {
			return String.Equals(this.RoleName, roleName, StringComparison.OrdinalIgnoreCase);
		}
	}
}
