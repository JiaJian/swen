using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Routing;

namespace DelonixRegiaHMS {
	public static class RouteConfig {
		public static void RegisterRoutes(RouteCollection routes) {
			var settings = new FriendlyUrlSettings();
			settings.AutoRedirectMode = RedirectMode.Permanent;
			routes.EnableFriendlyUrls(settings);

			/**
			 * Routing for Goi Jia Jian (1300188H)
			 * for the Hotel Management System.
			 */
			routes.MapPageRoute(
				"rb1",
				"manage/roombooking/add",
				"~/Manage/Room_Booking_Add.aspx"
			);

			routes.MapPageRoute(
				"rb2",
				"manage/roombooking",
				"~/Manage/Room_Booking_Overview.aspx"
			);

			// Room Management
			routes.MapPageRoute(
				"rm1",
				"manage/room-type/add",
				"~/Manage/Room_Type_Add.aspx"
			);

			routes.MapPageRoute(
				"rm2",
				"manage/room-type",
				"~/Manage/Room_Type_Overview.aspx"
			);

			routes.MapPageRoute(
				"rm3",
				"manage/room/add",
				"~/Manage/Room_Add.aspx"
			);

			routes.MapPageRoute(
				"rm4",
				"manage/room",
				"~/Manage/Room_Overview.aspx"
			);

			// Staff Record
			routes.MapPageRoute(
				"staff1",
				"manage/staff-records",
				"~/Manage/Staff_Record_Overview.aspx"
			);

			// Housekeeping and Duties
			routes.MapPageRoute(
				"hk1",
				"manage/duty/assign",
				"~/Manage/Duty_Assign.aspx"
			);

				// [NOT IMPLEMENTED YET]
				routes.MapPageRoute(
					"hk2",
					"manage/duty",
					"~/Manage/Duty_Roster.aspx"
				);

			routes.MapPageRoute(
				"hk3",
				"manage/duty-type/add",
				"~/Manage/Duty_Type_Add.aspx"
			);

			routes.MapPageRoute(
				"hk4",
				"manage/duty-type",
				"~/Manage/Duty_Type_Overview.aspx"
			);


			// User Accounts Management
			routes.MapPageRoute(
				"user1",
				"manage/guest-accounts/add",
				"~/Manage/Guest_Account_Add.aspx"
			);

			routes.MapPageRoute(
				"user2",
				"manage/guest-accounts",
				"~/Manage/Guest_Account_Overview.aspx"
			);

			routes.MapPageRoute(
				"user3",
				"manage/staff-accounts/add",
				"~/Manage/Staff_Account_Add.aspx"
			);

			routes.MapPageRoute(
				"user4",
				"manage/staff-accounts",
				"~/Manage/Staff_Account_Overview.aspx"
			);

			// Reports
			routes.MapPageRoute(
				"rpt1",
				"reports/room-status",
				"~/Reports/Room_Status.aspx"
			);

			routes.MapPageRoute(
				"rpt2",
				"reports/guest-details/room",
				"~/Reports/Guest_Details_Room.aspx"
			);

			routes.MapPageRoute(
				"rpt3",
				"reports/guest-details/all",
				"~/Reports/Guest_Details_All.aspx"
			);

			routes.MapPageRoute(
				"rpt4",
				"reports/room-occupancy",
				"~/Reports/Room_Occupancy.aspx"
			);

			routes.MapPageRoute(
				"rpt5",
				"reports/housekeeping",
				"~/Reports/Housekeeping.aspx"
			);
		}
	}
}
