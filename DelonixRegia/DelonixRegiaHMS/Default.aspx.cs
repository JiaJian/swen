using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS {
	public partial class Default : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnLogin.ServerClick += new EventHandler(btnLogin_ServerClick);

			bool isLoggedIn = (Session["user"] == null ? false : true);
			if (isLoggedIn) {
				Response.Redirect("~/");
			}
		}

		/**
		 * Check the values if the submit button is clicked.
		 */
		protected void btnLogin_ServerClick(object sender, EventArgs e) {

			UserAccountDbManager db = new UserAccountDbManager();

			try {
				User user = db.Login(tbxUserId.Value, tbxPassword.Value);

				if (user != null) {
					Session["user"] = user;
					Response.Redirect("/home");
				} else {
					alertError.Visible = true;
				}
			} catch (Exception ex) {
				alertError.Visible = true;
			}
		}
	}
}