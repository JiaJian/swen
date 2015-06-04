using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Rooms_Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!Page.IsPostBack) {
				try {
					if (!string.IsNullOrEmpty(Request.QueryString["id"]) || !string.IsNullOrEmpty(Page.RouteData.Values["id"] as string)) {
						ddlRoomType.DataTextField = "type";
						ddlRoomType.DataValueField = "id";
						ddlRoomType.DataSource = new RoomBookingDbManager().GetAllRoomTypes();
						ddlRoomType.DataBind();

						int tmpId;

						if (Int32.TryParse(!string.IsNullOrEmpty(Request.QueryString["id"]) ? Request.QueryString["id"].ToString() : Page.RouteData.Values["id"] as string, out tmpId)) {
							Room room = new RoomBookingDbManager().GetRoomById(tmpId);

							// Fill up the form with the original values from the database.
							tbxRoomNumber.Value = room.RoomNumber;
							ddlRoomType.Items.FindByValue(room.RoomTypeId.ToString()).Selected = true;
							ddlStatus.Items.FindByValue(room.Status.ToString()).Selected = true;
						} else {
							Response.Redirect("~/manage/rooms");
						}
					} else {
						Response.Redirect("~/manage/rooms");
					}
				} catch (Exception ex) {
					Response.Redirect("~/manage/rooms");
				}
			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			Room room = new Room();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxRoomNumber.Value)) {

					room.Id = Int32.Parse(Page.RouteData.Values["id"] as string);
					room.RoomNumber = tbxRoomNumber.Value;
					room.RoomTypeId = Int32.Parse(ddlRoomType.Value);
					room.Status = Int32.Parse(ddlStatus.Value);

					if (new RoomBookingDbManager().UpdateRoom(room)) {
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