using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DelonixRegiaHMS.Models {
	public class Room {
		public int Id { get; set; }
		public int RoomTypeId { get; set; }
		public string RoomNumber { get; set; }
		public int Status { get; set; }
	}
}