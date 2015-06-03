using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Staff_Account_Delete : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
				// Retrieve from the database manager using the specified user ID.
				int tmpId;

				if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
					if (new UserAccountDbManager().DeleteUser(tmpId)) {
						Session["deleted"] = true;
						Response.Redirect("~/manage/staff-accounts");
					} else {
						Session["deleted"] = false;
						Response.Redirect("~/manage/staff-accounts");
					}
				} else {
					Session["alert_error"] = true;
					Session["alert_message"] = "The specified ID is not an integer! You must trying to find exploits huh?!";
					Response.Redirect("~/manage/staff-accounts");
				}
			} else {
				Session["alert_error"] = true;
				Session["alert_message"] = "There was no ID specified in the URL, so we didn't do anything.";
				Response.Redirect("~/manage/staff-accounts");
			}
		}
	}
}