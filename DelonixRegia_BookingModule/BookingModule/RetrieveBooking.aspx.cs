using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingModule
{
    public partial class RetrieveBooking : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("data source=ISCHELLE\\ISCHELLE;initial catalog=DelonixRegia;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String str = "SELECT * FROM tbl_booking WHERE id=@id";
            SqlCommand xp = new SqlCommand(str, con);
            xp.Parameters.Add("id", SqlDbType.VarChar).Value = TextBox1.Text;
            con.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "id");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateBooking.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}