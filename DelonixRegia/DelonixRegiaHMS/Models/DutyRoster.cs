using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelonixRegiaHMS.Models {
	class DutyRoster {
		public int Id { get; set; }
		public int StaffId { get; set; }
		public int DutyTypeId { get; set; }
		public DateTime DutyStart { get; set; }
		public DateTime DutyEnd { get; set; }
	}
}
