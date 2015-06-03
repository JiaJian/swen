using DelonixRegiaHMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS.Manage {
	public partial class Staff_Account_Overview : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			rptTable.DataSource = new UserAccountDbManager().GetAllUsers();
			rptTable.DataBind();
		}
	}
}