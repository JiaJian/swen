using DelonixRegia.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegia {
	public partial class Login : System.Web.UI.Page {
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
			DbManager db = new DbManager();

			Response.Redirect("/"); // Or redirect to manage.

			/*User u = db.Login(tbxUserId.Value, tbxPassword.Value);

			if (u != null) {
				Session["user"] = u;
				Response.Redirect("/");
			} else {
				alertError.Visible = true;
			}*/
		}
	}
}