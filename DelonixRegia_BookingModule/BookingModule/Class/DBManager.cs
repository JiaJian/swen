using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BookingModule.Class
{
    public class DBManager
    {
        public static tbl_booking GetBookingByBookingID(string id)
        {

            tbl_booking b = new tbl_booking();
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DelonixRegiaConnectionString"].ConnectionString;
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandText = "SELECT * FROM tbl_booking WHERE id=@id";
                comm.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    b.GuestID = (int)dr["guest_id"];
                    b.RoomID = (int)dr["room_id"];
                    b.noOfGuest = (int)dr["no_of_guests"];
                    b.checkInDate = ((DateTime)dr["checkin_date"]).ToString("MM/dd/yyyy");
                    b.checkOutDate = ((DateTime)dr["checkout_date"]).ToString("MM/dd/yyyy");
                    b.Status = (string)dr["status"];
                    b.Remarks = (string)dr["remarks"];
                    b.PaymentType = (string)dr["payment_Type"];
                }
            }
            catch (SqlException e)
            {
                throw e;
            }

            return b;
        }
        public static int InsertBooking(tbl_booking b)
        {
            int rowsinserted = 0;

            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DelonixRegiaConnectionString"].ConnectionString;
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                    comm.CommandText = "INSERT INTO tbl_booking(id, guest_id, room_id, no_of_guests, checkin_date," +
                                       "checkout_date, status, remarks, payment_type, timestamp)" +
                                   "VALUES (@id, @guest_id, @room_id, @no_of_guests, @checkin_date," +
                                   "@checkout_date, @status, @remarks, @payment_type, @timestamp)";
                comm.Parameters.AddWithValue("@id", b.Id);
                comm.Parameters.AddWithValue("@guest_id", b.GuestID);
                comm.Parameters.AddWithValue("@room_id", b.RoomID);
                comm.Parameters.AddWithValue("@no_of_guests", b.noOfGuest);
                comm.Parameters.AddWithValue("@checkin_date", b.checkInDate);
                comm.Parameters.AddWithValue("@checkout_date", b.checkOutDate);
                comm.Parameters.AddWithValue("@status", b.Status);
                comm.Parameters.AddWithValue("@remarks", b.Remarks);
                comm.Parameters.AddWithValue("@payment_Type", b.PaymentType);
                comm.Parameters.AddWithValue("@timestamp", b.Timestamp);
                rowsinserted = comm.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                throw e;
            }
            return rowsinserted;
        }

        public static int UpdateBooking(tbl_booking b)
        {
            int rowsinserted = 0;

            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DelonixRegiaConnectionString"].ConnectionString;
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandText = "UPDATE tbl_booking SET id=@id,room_id = @room_id, no_of_guests = @no_of_guests, checkin_date = @checkin_date," +
                                   "checkout_date = @checkout_date, status = @status, remarks = @remarks, payment_type = @payment_type " +
                                    "WHERE id=@id";
                comm.Parameters.AddWithValue("@id", b.Id);
                comm.Parameters.AddWithValue("@room_id", b.RoomID);
                comm.Parameters.AddWithValue("@no_of_guests", b.noOfGuest);
                comm.Parameters.AddWithValue("@checkin_date", b.checkInDate);
                comm.Parameters.AddWithValue("@checkout_date", b.checkOutDate);
                comm.Parameters.AddWithValue("@status", b.Status);
                comm.Parameters.AddWithValue("@remarks", b.Remarks);
                comm.Parameters.AddWithValue("@payment_Type", b.PaymentType);
                rowsinserted = comm.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                throw e;
            }
            return rowsinserted;
        }
    }
}