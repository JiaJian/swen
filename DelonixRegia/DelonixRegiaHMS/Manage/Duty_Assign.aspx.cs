using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Duty_Assign : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!IsPostBack) {
				DataTable table = new UserAccountDbManager().GetUsersByRoleId(1);
				table.Columns.Add("display", typeof(string), "first_name + ' ' + last_name + ' (' + email + ')'");
				ddlStaffList.DataTextField = "display";
				ddlStaffList.DataValueField = "id";
				ddlStaffList.DataSource = table;
				ddlStaffList.DataBind();

				ddlDutyType.DataTextField = "name";
				ddlDutyType.DataValueField = "id";
				ddlDutyType.DataSource = new StaffRecordsDbManager().GetAllDutyTypes();
				ddlDutyType.DataBind();
			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			DutyRoster roster = new DutyRoster();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxDutyStart.Value)
					&& !string.IsNullOrEmpty(tbxDutyEnd.Value)) {

					roster.StaffId = Int32.Parse(ddlStaffList.Value);
					roster.DutyTypeId = Int32.Parse(ddlDutyType.Value);
					roster.DutyStart = DateTime.ParseExact(tbxDutyStart.Value, "dd/MM/yyyy HH:mm", CultureInfo.CurrentCulture);
					roster.DutyEnd = DateTime.ParseExact(tbxDutyEnd.Value, "dd/MM/yyyy HH:mm", CultureInfo.CurrentCulture);

					if (new StaffRecordsDbManager().AddDutyRoster(roster)) {
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