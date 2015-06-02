using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace DelonixRegia {
	public static class RouteConfig {
		public static void RegisterRoutes(RouteCollection routes) {
			var settings = new FriendlyUrlSettings();
			settings.AutoRedirectMode = RedirectMode.Permanent;
			routes.EnableFriendlyUrls(settings);

			/**
			 * Routing for Goi Jia Jian (1300188H)
			 * for the User Management Module.
			 */
			routes.MapPageRoute(
				"user-add",
				"manage/user/add",
				"~/Manage/Add_User.aspx"
			);

			routes.MapPageRoute(
				"user-edit",
				"manage/user/edit/{id}",
				"~/Manage/Edit_User.aspx"
			);

			routes.MapPageRoute(
				"user-delete",
				"manage/user/delete/{id}",
				"~/Manage/Delete_User.aspx"
			);

			routes.MapPageRoute(
				"user-overview",
				"manage/user/overview",
				"~/Manage/Overview_User.aspx"
			);

			/**
			 * Routing for Hilmi Ja'affar (1302689C)
			 * for the Job Management Module.
			 */
			routes.MapPageRoute(
				"job-listing-add",
				"manage/job_listing/add",
				"~/Manage/Add_Job_Listing.aspx"
			);

			routes.MapPageRoute(
				"job-listing-edit",
				"manage/job_listing/edit/{id}",
				"~/Manage/Edit_Job_Listing.aspx"
			);

			routes.MapPageRoute(
				"job-listing-delete",
				"manage/job_listing/delete/{id}",
				"~/Manage/Delete_Job_Listing.aspx"
			);

			routes.MapPageRoute(
				"job-listing-overview",
				"manage/job_listing/overview",
				"~/Manage/Overview_Job_Listing.aspx"
			);

			routes.MapPageRoute(
				"job-application-overview",
				"manage/job_application/overview",
				"~/Manage/View_Job_Application.aspx"
			);

			routes.MapPageRoute(
				"job-application-assign",
				"manage/job_application/assign/{user_id}/{job_id}",
				"~/Manage/Job_Assign.aspx"
			);

			routes.MapPageRoute(
				"job-application-deassign",
				"manage/job_application/deassign/{user_id}/{job_id}",
				"~/Manage/Job_Deassign.aspx"
			);
		}
	}
}