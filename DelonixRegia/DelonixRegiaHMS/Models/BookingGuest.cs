using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelonixRegiaHMS.Models {
	class BookingGuest {
		public int Id { get; set; }
		public int BookingId { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
	}
}
