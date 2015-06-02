using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Duty_Type_Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {
				try {
					if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
						int tmpId;

						if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
							DutyType dutyType = new StaffRecordsDbManager().GetDutyTypeById(tmpId);

							tbxDutyName.Value = dutyType.Name;
							tbxDutyInformation.Value = dutyType.Information;
						} else {
							Response.Redirect("~/manage/room-type");
						}
					} else {
						Response.Redirect("~/manage/room-type");
					}
				} catch (Exception ex) {
					Response.Redirect("~/manage/room-type");
				}
			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			DutyType dutyType = new DutyType();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxDutyName.Value)
					&& !string.IsNullOrEmpty(tbxDutyInformation.Value)) {

					dutyType.Id = Int32.Parse(Page.RouteData.Values["id"] as string);
					dutyType.Name = tbxDutyName.Value;
					dutyType.Information = tbxDutyInformation.Value;

					if (new StaffRecordsDbManager().UpdateDutyType(dutyType)) {
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