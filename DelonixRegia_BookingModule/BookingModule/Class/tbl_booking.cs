using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookingModule.Class
{
    public class tbl_booking
    {
        private int id;
        private int guest_id;
        private int room_id;
        private int no_of_guests;
        private string checkin_date;
        private string checkout_date;
        private string status;
        private string payment_type;
        private string remarks;
        private string timestamp;

        public tbl_booking()
        {

        }

        public tbl_booking(int id, int guest_id,
                    int room_id, int no_of_guests,
                    string checkin_date, string checkout_date, 
                    string status,
                    string payment_type, string remarks,
                    string timestamp)
        {
            this.id = id;
            this.guest_id = guest_id;
            this.room_id = room_id;
            this.no_of_guests = no_of_guests;
            this.checkin_date = checkin_date;
            this.checkout_date = checkout_date;
            this.status = status;
            this.payment_type = payment_type;
            this.remarks = remarks;
            this.timestamp = timestamp;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public int GuestID
        {
            get { return guest_id; }
            set { guest_id = value; }
        }

        public int RoomID
        {
            get { return room_id; }
            set {room_id = value; }
        }

        public string checkInDate
        {
            get { return checkin_date; }
            set { checkin_date = value; }
        }

        public string checkOutDate
        {
            get { return checkout_date; }
            set { checkout_date = value; }
        }

        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        public string Remarks
        {
            get { return remarks; }
            set { remarks = value; }
        }

        public string PaymentType
        {
            get { return payment_type; }
            set { payment_type = value; }
        }

        public string Timestamp
        {
            get { return timestamp; }
            set { timestamp = value; }
        }

        public int noOfGuest
        {
            get { return no_of_guests; }
            set { no_of_guests = value; }
        }
    }
}