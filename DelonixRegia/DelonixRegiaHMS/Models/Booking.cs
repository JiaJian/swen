using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelonixRegiaHMS.Models {
	class Booking {
		public int Id { get; set; }
		public int GuestId { get; set; }
		public string RoomNumber { get; set; }
		public int NoOfGuests { get; set; }
		public DateTime CheckInDate { get; set; }
		public DateTime CheckOutDate { get; set; }
		public string Status { get; set; }
		public string Remarks { get; set; }
		public string PaymentType { get; set; }
		public DateTime Timestamp { get; set; }
	}
}