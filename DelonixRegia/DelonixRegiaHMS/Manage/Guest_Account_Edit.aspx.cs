using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Guest_Account_Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {
				try {
					if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
						int tmpId;

						if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
							Guest guest = new UserAccountDbManager().GetGuestById(tmpId);

							tbxFirstName.Value = guest.FirstName;
							tbxLastName.Value = guest.LastName;
							tbxEmail.Value = guest.Email;
							tbxAddress.Value = guest.Address;
							tbxPostalCode.Value = guest.PostalCode;
							tbxCountry.Value = guest.Country;
						} else {
							Response.Redirect("~/manage/guest-accounts");
						}
					} else {
						Response.Redirect("~/manage/guest-accounts");
					}
				} catch (Exception ex) {
					Response.Redirect("~/manage/guest-accounts");
				}
			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			Guest guest = new Guest();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxFirstName.Value)
					&& !string.IsNullOrEmpty(tbxLastName.Value)
					&& !string.IsNullOrEmpty(tbxEmail.Value)
					&& !string.IsNullOrEmpty(tbxAddress.Value)
					&& !string.IsNullOrEmpty(tbxPostalCode.Value)
					&& !string.IsNullOrEmpty(tbxCountry.Value)) {

					guest.Id = Int32.Parse(Page.RouteData.Values["id"] as string);
					guest.FirstName = tbxFirstName.Value;
					guest.LastName = tbxLastName.Value;
					guest.Email = tbxEmail.Value;
					guest.Password = tbxPassword.Value;
					guest.Address = tbxAddress.Value;
					guest.PostalCode = tbxPostalCode.Value;
					guest.Country = tbxCountry.Value;

					if (new UserAccountDbManager().UpdateGuest(guest)) {
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