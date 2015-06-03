using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Guest_Account_Add : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			Guest guest = new Guest();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxFirstName.Value)
					&& !string.IsNullOrEmpty(tbxLastName.Value)
					&& !string.IsNullOrEmpty(tbxEmail.Value)
					&& !string.IsNullOrEmpty(tbxPassword.Value)
					&& !string.IsNullOrEmpty(tbxAddress.Value)
					&& !string.IsNullOrEmpty(tbxPostalCode.Value)
					&& !string.IsNullOrEmpty(tbxCountry.Value)) {

						guest.Email = tbxEmail.Value;
						guest.Password = tbxPassword.Value;
						guest.FirstName = tbxFirstName.Value;
						guest.LastName = tbxLastName.Value;
						guest.Address = tbxAddress.Value;
						guest.PostalCode = tbxPostalCode.Value;
						guest.Country = tbxCountry.Value;

					if (new UserAccountDbManager().AddGuest(guest)) {
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