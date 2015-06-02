using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Staff_Record_Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {
				try {
					if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
						int tmpId;

						if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
							User user = new StaffRecordsDbManager().GetStaffRecordById(tmpId);

							tbxEmail.Value = user.Email;
							tbxFirstName.Value = user.FirstName;
							tbxLastName.Value = user.LastName;
							tbxAddress.Value = user.Address;
							tbxPostalCode.Value = user.PostalCode;
							ddlBankName.Items.FindByValue(user.BankName.ToString()).Selected = true;
							tbxBankAccountNumber.Value = user.BankAccountNumber;
						} else {
							Response.Redirect("~/manage/staff-records");
						}
					} else {
						Response.Redirect("~/manage/staff-records");
					}
				} catch (Exception ex) {
					Response.Redirect("~/manage/staff-records");
				}
			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			User user = new User();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxEmail.Value)
					&& !string.IsNullOrEmpty(tbxFirstName.Value)
					&& !string.IsNullOrEmpty(tbxLastName.Value)
					&& !string.IsNullOrEmpty(tbxAddress.Value)
					&& !string.IsNullOrEmpty(tbxPostalCode.Value)
					&& !string.IsNullOrEmpty(tbxBankAccountNumber.Value)) {

					user.Id = Int32.Parse(Page.RouteData.Values["id"] as string);
					user.Email = tbxEmail.Value;
					user.FirstName = tbxFirstName.Value;
					user.LastName = tbxLastName.Value;
					user.Address = tbxAddress.Value;
					user.PostalCode = tbxPostalCode.Value;
					user.BankName = ddlBankName.Value;
					user.BankAccountNumber = tbxBankAccountNumber.Value;

					if (new StaffRecordsDbManager().UpdateStaffRecord(user)) {
						alertSuccess.Visible = true;
						alertError.Visible = false;
					}
				} else {
					lblMessage.InnerText = "Unable to save this record!";
					alertError.Visible = true;
					alertSuccess.Visible = false;
				}
			} catch (Exception ex) {
				lblMessage.InnerText = "Unable to edit this record!";
				alertError.Visible = true;
				alertSuccess.Visible = false;
			}
		}
	}
}