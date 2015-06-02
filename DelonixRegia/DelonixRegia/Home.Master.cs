using DelonixRegia.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegia {
    public partial class Home : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
			// Force the __doPostBack() js function to be generated. Having one ASP web control will generate it but I didn't use any.
			this.Page.ClientScript.GetPostBackEventReference(this, string.Empty);

			bool isLoggedIn = (Session["user"] == null ? false : true);

			if (isLoggedIn) {
				User u = Session["user"] as User;

				navbar_right_notloggedin.Visible = false;
				navbar_right_loggedin.Visible = true;

				lblUsername.InnerText = u.FirstName;

				if (u.HasRole("Administrator")) {
					navbar_admin.Visible = true;

					dropdown_admin.Visible = true;
					dropdown_jobseeker.Visible = false;
				} else if (u.HasRole("User")) {
					navbar_jobseeker.Visible = true;

					dropdown_jobseeker.Visible = true;
					dropdown_admin.Visible = false;
				} else {
					navbar_jobseeker.Visible = true;

					dropdown_jobseeker.Visible = true;
					dropdown_admin.Visible = false;
				}
			} else {
				navbar_admin.Visible = false;
				navbar_jobseeker.Visible = false;

				navbar_right_notloggedin.Visible = true;
			}
        }
    }
}