using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS {
	public partial class Dashboard : System.Web.UI.MasterPage {
		protected void Page_Load(object sender, EventArgs e) {
			bool isLoggedIn = (Session["user"] == null ? false : true);

			if (isLoggedIn) {
				User user = Session["user"] as User;

				if (user.HasRole("Administrator")) {
					rbkg.Visible = true;
					rbkg_add.Visible = true;
					rbkg_manage.Visible = true;

					rmgmt.Visible = true;
					rmgmt_room_add.Visible = true;
					rmgmt_room_manage.Visible = true;
					rmgmt_roomtype_add.Visible = true;
					rmgmt_roomtype_manage.Visible = true;

					staffrec.Visible = true;
					staffrec_manage.Visible = true;

					duties.Visible = true;
					duties_assign.Visible = true;
					duties_roster_view.Visible = true;
					duties_type_add.Visible = true;
					duties_type_manage.Visible = true;

					reports.Visible = true;
					reports_guest_details_all.Visible = true;
					reports_guest_details_room.Visible = true;
					reports_housekeeping.Visible = true;
					reports_room_occupancy.Visible = true;
					reports_room_status.Visible = true;

					useraccs.Visible = true;
				} else if (user.HasRole("Management")) {
					rbkg.Visible = true;
					rbkg_add.Visible = true;
					rbkg_manage.Visible = true;

					rmgmt.Visible = true;
					rmgmt_room_add.Visible = true;
					rmgmt_room_manage.Visible = true;
					rmgmt_roomtype_add.Visible = true;
					rmgmt_roomtype_manage.Visible = true;

					staffrec.Visible = true;
					staffrec_manage.Visible = true;

					duties.Visible = true;
					duties_assign.Visible = true;
					duties_roster_view.Visible = true;
					duties_type_add.Visible = true;
					duties_type_manage.Visible = true;

					reports.Visible = true;
					reports_guest_details_all.Visible = true;
					reports_guest_details_room.Visible = true;
					reports_housekeeping.Visible = true;
					reports_room_occupancy.Visible = true;
					reports_room_status.Visible = true;
				} else if (user.HasRole("Receptionist")) {
					rbkg.Visible = true;
					rbkg_add.Visible = true;
					rbkg_manage.Visible = true;

					rmgmt.Visible = true;
					rmgmt_room_add.Visible = true;
					rmgmt_room_manage.Visible = true;
					rmgmt_roomtype_add.Visible = true;
					rmgmt_roomtype_manage.Visible = true;

					reports.Visible = true;
					reports_guest_details_all.Visible = true;
					reports_guest_details_room.Visible = true;
					reports_room_status.Visible = true;
				} else {

				}
			} else {
				Response.Redirect("~/");
			}
		}
	}
}