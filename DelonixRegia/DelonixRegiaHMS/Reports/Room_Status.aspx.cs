using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Reports {
	public partial class Room_Status : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnExport.ServerClick += new EventHandler(btnExport_ServerClick);

			rptTable.DataSource = new RoomBookingDbManager().GetAllRooms();
			rptTable.DataBind();
		}

		protected void btnExport_ServerClick(object sender, EventArgs e) {
			DataTable dt = GetData("SELECT * FROM tbl_room;");

			// The SQL to CSV stuff.
			StringBuilder sb = new StringBuilder();

			IEnumerable<string> columnNames = dt.Columns.Cast<DataColumn>().
											  Select(column => column.ColumnName);



			sb.AppendLine(string.Join(",", columnNames));

			foreach (DataRow row in dt.Rows) {
				IEnumerable<string> fields = row.ItemArray.Select(field => field.ToString());

				sb.AppendLine(string.Join(",", fields));
			}
			// Force download using content-disposition.
			Response.Clear();
			Response.Buffer = true;
			Response.AddHeader("content-disposition", "attachment;filename=room-status-" + (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds + ".csv");
			Response.Charset = "";
			Response.ContentType = "application/text";

			Response.Output.Write(sb.ToString());

			Response.Flush();
			Response.End();
		}

		private DataTable GetData(string command) {
			SqlCommand cmd = new SqlCommand(command);
			DataTable dt = new DataTable();
			String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["DelonixRegia"].ConnectionString;
			SqlConnection con = new SqlConnection(strConnString);
			SqlDataAdapter sda = new SqlDataAdapter();
			cmd.CommandType = CommandType.Text;
			cmd.Connection = con;
			try {
				con.Open();
				sda.SelectCommand = cmd;
				sda.Fill(dt);
				return dt;
			} catch (Exception ex) {
				throw ex;
			} finally {
				con.Close();
				sda.Dispose();
				con.Dispose();
			}
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