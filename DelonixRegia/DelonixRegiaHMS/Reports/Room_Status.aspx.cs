using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Reports {
	public partial class Room_Status : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			rptTable.DataSource = new RoomBookingDbManager().GetAllRooms();
			rptTable.DataBind();
		}

		public string GetStatusDescription(int id) {
			if (id == 1) {
				return "<span class=\"label label-success\">Vacant</span>";
			} else if (id == 2) {
				return "<span class=\"label label-danger\">Occupied</span>";
			} else if (id == 3) {
				return "<span class=\"label label-warning\">Vacant (Scheduled for Cleaning)</span>";
			}
			return "No status";
		}
	}
}