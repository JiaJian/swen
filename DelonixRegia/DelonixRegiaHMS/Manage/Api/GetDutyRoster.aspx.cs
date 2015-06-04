using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage.Api {
	public partial class GetDutyRoster : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			List<DutyRoster> dutyRosterList = new StaffRecordsDbManager().GetAllDutyRecords();
			// Force download using content-disposition.
			Response.Clear();
			Response.Buffer = true;
			Response.Charset = "";
			Response.ContentType = "application/json";

			Response.Output.Write("{ \"success\": 1, \"result\": [");

			int count = 0;
			foreach (var item in dutyRosterList) {
				var start = item.DutyStart.Subtract(new DateTime(1970, 1, 1, 0, 0, 0)).TotalMilliseconds;
				var end = item.DutyEnd.Subtract(new DateTime(1970, 1, 1, 0, 0, 0)).TotalMilliseconds;

				var cssClass = "";

				if (item.DutyTypeId == 1) {
					cssClass = "event-warning";
				} else if (item.DutyTypeId == 2) {
					cssClass = "event-info";
				} else if (item.DutyTypeId == 3) {
					cssClass = "event-important";
				} else if (item.DutyTypeId == 4) {
					cssClass = "event-success";
				}

				var k = string.Format("{{ \"id\": {0}, \"title\": \"{1} ({2} {3})\", \"class\": \"{4}\", \"start\": {5}, \"end\": {6} }}", item.Id.ToString(), item.DutyType, item.StaffFirstName, item.StaffLastName, cssClass, start.ToString(), end.ToString());
				Response.Output.Write(k);

				if (count != dutyRosterList.Count - 1) {
					Response.Output.Write(", ");
				}
				count++;
			}

			Response.Output.Write("] }");

			Response.Flush();
			Response.End();
		}
	}
}