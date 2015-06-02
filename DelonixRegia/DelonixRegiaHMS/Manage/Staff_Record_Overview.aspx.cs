using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Staff_Record_Overview : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			rptTable.DataSource = new StaffRecordsDbManager().GetAllStaffRecords();
			rptTable.DataBind();

			if (Session["alert_error"] != null) {
				if ((bool)Session["alert_error"]) {
					lblMessageError.InnerText = Session["alert_message"].ToString();

					alertError.Visible = true;
					alertSuccess.Visible = false;

					Session["alert_error"] = null;
				}
			}

			if (Session["deleted"] != null) {
				if ((bool)Session["deleted"] == true) {
					lblMessageSuccess.InnerText = "Successfully deleted the staff record!";

					alertSuccess.Visible = true;
					alertError.Visible = false;

					Session["deleted"] = null; // Reset the value back to null.
				} else {
					lblMessageError.InnerHtml = "Something went wrong. We're unclear of what the error is but maybe you can contact the <a href=\"mailto:delonixregia@gmail.com\">administrator</a> about this.";

					alertError.Visible = true;
					alertSuccess.Visible = false;

					Session["deleted"] = null; // Reset the value back to null.
				}
			}
		}
	}
}