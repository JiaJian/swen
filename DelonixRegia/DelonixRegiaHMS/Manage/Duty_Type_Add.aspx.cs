﻿using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Duty_Type_Add : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			DutyType dutyType = new DutyType();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxDutyName.Value)
					&& !string.IsNullOrEmpty(tbxDutyInformation.Value)) {

					dutyType.Name = tbxDutyName.Value;
					dutyType.Information = tbxDutyInformation.Value;

					if (new StaffRecordsDbManager().AddDutyType(dutyType)) {
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