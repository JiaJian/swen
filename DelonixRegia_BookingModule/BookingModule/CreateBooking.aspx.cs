using BookingModule.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingModule
{
    public partial class CreateBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string guest_id = TextBox2.Text;
            string room_id = DropDownList1.SelectedValue;
            string no_of_guests = TextBox3.Text;
            string checkin_date = TextBox4.Text;
            string checkout_date = TextBox5.Text;
            string status = DropDownList2.SelectedValue;
            string remarks = TextBox7.Text;
            string payment_type = DropDownList3.SelectedValue;
            string timestamp = TextBox9.Text;

            string querystring = "id=" + id;
            querystring += "&" + "guest_id=" + guest_id;
            querystring += "&" + "room_id=" + room_id;
            querystring += "&" + "no_of_guest=" + no_of_guests;
            querystring += "&" + "checkin_date=" + checkin_date;
            querystring += "&" + "checkout_date=" + checkout_date;
            querystring += "&" + "status=" + status;
            querystring += "&" + "remarks=" + remarks;
            querystring += "&" + "payment_type=" + payment_type;
            querystring += "&" + "timestamp=" + timestamp;



            tbl_booking b = new tbl_booking(Convert.ToInt32(TextBox1.Text), Convert.ToInt32(TextBox2.Text), Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(TextBox3.Text), TextBox4.Text, TextBox5.Text, DropDownList2.SelectedValue, TextBox7.Text,
                                 DropDownList3.SelectedValue, TextBox9.Text);
            DBManager.InsertBooking(b);

            Response.Redirect("BookingConfirmed.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}