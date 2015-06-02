using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Room_Type_Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {
				try {
					if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
						int tmpId;

						if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
							RoomType roomType = new RoomBookingDbManager().GetRoomTypeById(tmpId);

							tbxRoomRate.Value = roomType.Rate.ToString();
							tbxRoomType.Value = roomType.Type;
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
			RoomType roomType = new RoomType();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxRoomType.Value)
					&& !string.IsNullOrEmpty(tbxRoomRate.Value)) {

					roomType.Id = Int32.Parse(Page.RouteData.Values["id"] as string);
					roomType.Type = tbxRoomType.Value;
					roomType.Rate = Double.Parse(tbxRoomRate.Value);

					if (new RoomBookingDbManager().UpdateRoomType(roomType)) {
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