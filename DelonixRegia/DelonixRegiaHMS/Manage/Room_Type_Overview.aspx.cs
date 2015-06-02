using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Room_Type_Overview : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			rptTable.DataSource = new RoomBookingDbManager().GetAllRoomTypes();
			rptTable.DataBind();

		}
	}
}