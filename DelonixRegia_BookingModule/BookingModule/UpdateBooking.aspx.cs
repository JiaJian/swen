using BookingModule.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingModule
{
    public partial class UpdateBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void Button3_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            tbl_booking b = DBManager.GetBookingByBookingID(id);

            lblGuestID.Text = Convert.ToString(b.GuestID);
            DropDownList1.SelectedValue = Convert.ToString(b.RoomID);
            TextBox2.Text = Convert.ToString(b.noOfGuest);
            TextBox3.Text = b.checkInDate;
            TextBox4.Text = b.checkOutDate;
            DropDownList2.SelectedValue = b.Status;
            TextBox5.Text = b.Remarks;
            DropDownList3.SelectedValue = b.PaymentType;

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            tbl_booking b = new tbl_booking();
            b.Id = Convert.ToInt32(TextBox1.Text);
            b.RoomID = Convert.ToInt32(DropDownList1.SelectedValue);
            b.noOfGuest = Convert.ToInt32(TextBox2.Text);
            b.checkInDate = TextBox3.Text;
            b.checkOutDate = TextBox4.Text;
            b.Status = DropDownList2.SelectedValue;
            b.Remarks = TextBox5.Text;
            b.PaymentType = DropDownList3.SelectedValue;
            DBManager.UpdateBooking(b);

            Response.Redirect("Updatesuccess.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}