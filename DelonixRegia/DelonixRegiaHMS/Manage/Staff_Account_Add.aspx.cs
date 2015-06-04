using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Staff_Account_Add : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			User user = new User();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxEmail.Value)
					&& !string.IsNullOrEmpty(tbxPassword.Value)
					&& !string.IsNullOrEmpty(tbxFirstName.Value)
					&& !string.IsNullOrEmpty(tbxLastName.Value)
					&& !string.IsNullOrEmpty(tbxAddress.Value)
					&& !string.IsNullOrEmpty(tbxPostalCode.Value)
					&& !string.IsNullOrEmpty(tbxBankAccountNumber.Value)) {

					user.Email = tbxEmail.Value;

					BCrypt bcrypt = new BCrypt();
					string salt = BCrypt.GenerateSalt();
					string hashedPw = BCrypt.HashPassword(tbxPassword.Value, salt);
					user.Password = hashedPw;

					user.FirstName = tbxFirstName.Value;
					user.LastName = tbxLastName.Value;
					user.Address = tbxAddress.Value;
					user.PostalCode = tbxPostalCode.Value;
					user.BankName = ddlBankName.Value;
					user.BankAccountNumber = tbxBankAccountNumber.Value;
					user.RoleId = Int32.Parse(ddlUserLevel.Value);

					if (new UserAccountDbManager().AddUser(user)) {
						alertSuccess.Visible = true;
						alertError.Visible = false;
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