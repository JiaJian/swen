using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Reports {
	public partial class Guest_Details_Room : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSearch.ServerClick += new EventHandler(btnSearch_ServerClick);
			btnExport.ServerClick += new EventHandler(btnExport_ServerClick);

			if (!Page.IsPostBack) {
				ddlRooms.DataTextField = "roomnumber";
				ddlRooms.DataValueField = "id";
				ddlRooms.DataSource = new RoomBookingDbManager().GetAllRooms();
				ddlRooms.DataBind();
			}
		}

		protected void btnSearch_ServerClick(object sender, EventArgs e) {
			string roomNumber = ddlRooms.Value;

			
		}

		protected void btnExport_ServerClick(object sender, EventArgs e) {

		}


	}
}