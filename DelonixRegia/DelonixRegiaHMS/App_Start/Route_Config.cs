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

			routes.MapPageRoute(
				"rb3",
				"manage/roombooking/edit/{id}",
				"~/Manage/Room_Booking_Edit.aspx"
			);

			routes.MapPageRoute(
				"rb4",
				"manage/roombooking/delete/{id}",
				"~/Manage/Room_Booking_Delete.aspx"
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
				"manage/room-type/edit/{id}",
				"~/Manage/Room_Type_Edit.aspx"
			);

			routes.MapPageRoute(
				"rm4",
				"manage/room-type/delete/{id}",
				"~/Manage/Room_Type_Delete.aspx"
			);

			routes.MapPageRoute(
				"rm5",
				"manage/rooms/add",
				"~/Manage/Rooms_Add.aspx"
			);

			routes.MapPageRoute(
				"rm6",
				"manage/rooms",
				"~/Manage/Rooms_Overview.aspx"
			);

			routes.MapPageRoute(
				"rm7",
				"manage/rooms/edit/{id}",
				"~/Manage/Rooms_Edit.aspx"
			);

			routes.MapPageRoute(
				"rm8",
				"manage/rooms/delete/{id}",
				"~/Manage/Rooms_Delete.aspx"
			);

			// Staff Record
			routes.MapPageRoute(
				"staff1",
				"manage/staff-records",
				"~/Manage/Staff_Record_Overview.aspx"
			);

			routes.MapPageRoute(
				"staff2",
				"manage/staff-records/edit/{id}",
				"~/Manage/Staff_Record_Edit.aspx"
			);

			// Housekeeping and Duties
			routes.MapPageRoute(
				"hk1",
				"manage/duty/assign",
				"~/Manage/Duty_Assign.aspx"
			);

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

			routes.MapPageRoute(
				"hk5",
				"manage/duty-type/edit/{id}",
				"~/Manage/Duty_Type_Edit.aspx"
			);

			routes.MapPageRoute(
				"hk6",
				"manage/duty-type/delete/{id}",
				"~/Manage/Duty_Type_Delete.aspx"
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
				"manage/guest-accounts/edit/{id}",
				"~/Manage/Guest_Account_Edit.aspx"
			);

			routes.MapPageRoute(
				"user4",
				"manage/guest-accounts/delete/{id}",
				"~/Manage/Guest_Account_Delete.aspx"
			);

			routes.MapPageRoute(
				"user5",
				"manage/staff-accounts/add",
				"~/Manage/Staff_Account_Add.aspx"
			);

			routes.MapPageRoute(
				"user6",
				"manage/staff-accounts",
				"~/Manage/Staff_Account_Overview.aspx"
			);

			routes.MapPageRoute(
				"user7",
				"manage/staff-accounts/edit/{id}",
				"~/Manage/Staff_Account_Edit.aspx"
			);

			routes.MapPageRoute(
				"user8",
				"manage/staff-accounts/delete/{id}",
				"~/Manage/Staff_Account_Delete.aspx"
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
