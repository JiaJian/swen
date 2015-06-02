﻿using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Room_Add : System.Web.UI.Page {

		protected void Page_Load(object sender, EventArgs e) {
			// Programmatically add a server click handler to a HTML server control.
			btnSubmit.ServerClick += new EventHandler(btnSubmit_ServerClick);

			if (!IsPostBack) {

			}
		}

		protected void btnSubmit_ServerClick(object sender, EventArgs e) {
			Room room = new Room();

			try {
				// Second layer of validation.
				if (!string.IsNullOrEmpty(tbxRoomNumber.Value)) {

					room.RoomNumber = tbxRoomNumber.Value;
					room.RoomTypeId = ddlRoomType.SelectedIndex;
					room.Status = ddlStatus.SelectedIndex;

					if (new RoomBookingDbManager().AddRoom(room)) {
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