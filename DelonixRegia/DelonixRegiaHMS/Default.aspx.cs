using DelonixRegiaHMS.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DelonixRegiaHMS {
	public partial class Default : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			btnLogin.ServerClick += new EventHandler(btnLogin_ServerClick);

			bool isLoggedIn = (Session["user"] == null ? false : true);
			if (isLoggedIn) {
				Response.Redirect("~/home");
			}

			if (Session["incorrectAttempts"] != null) {
				if ((int)Session["incorrectAttempts"] >= 3) {
					recaptchaBox.Visible = true;
				} else {
					recaptchaBox.Visible = false;
				}
			} else {
				Session["incorrectAttempts"] = 0; // Initialising the var.
				recaptchaBox.Visible = false;
			}
		}

		/**
		 * This method will validate a user's response to
		 * the reCAPTCHA challenge. Implements the Google
		 * reCAPTCHA v2 API.
		 */
		public bool ValidateCaptcha() {
			string input = Request["g-recaptcha-response"]; // Get the user's input.
			string privateKey = ConfigurationManager.AppSettings["recaptchaPrivateKey"].ToString();

			bool valid = false;

			// Request to Google's reCAPTCHA API with the user input.
			HttpWebRequest req = (HttpWebRequest)WebRequest.Create("https://www.google.com/recaptcha/api/siteverify?secret=" + privateKey + "&response=" + input);
			try {
				// Google's reCAPTCHA validation response - success or failure.
				using (WebResponse wResponse = req.GetResponse()) {

					using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream())) {
						string jsonResponse = readStream.ReadToEnd();

						JObject js = new JObject();
						dynamic data = JObject.Parse(jsonResponse); // Deserialize the JSON response.

						valid = Convert.ToBoolean(data.success);
					}
				}

				return valid;
			} catch (WebException ex) {
				throw ex;
			}
		}

		/**
		 * Check the values if the submit button is clicked.
		 */
		protected void btnLogin_ServerClick(object sender, EventArgs e) {
			UserAccountDbManager db = new UserAccountDbManager();

			try {
				if (recaptchaBox.Visible) {
					if (ValidateCaptcha()) {
						// Scenarios where the captcha is triggered (i.e. more than 3 incorrect attempts).
						User user = new UserAccountDbManager().Login(tbxUserId.Value, tbxPassword.Value);
						if (user != null) {
							Session["user"] = user;
							Session["incorrectAttempts"] = 0; // Reset this value.
							Response.Redirect("/home");
						} else {
							int attempts = (int)Session["incorrectAttempts"];
							Session["incorrectAttempts"] = attempts + 1;
							alertError.Visible = true;
							lblMessage.InnerText = "Invalid password, username or the captcha code!";
						}
					} else {
						int attempts = (int)Session["incorrectAttempts"];
						Session["incorrectAttempts"] = attempts + 1;
						alertError.Visible = true;
						lblMessage.InnerText = "The captcha code was incorrect.";
					}
				} else {
					User user = new UserAccountDbManager().Login(tbxUserId.Value, tbxPassword.Value);

					if (user != null) {
						// Scenario where first login is successful.
						Session["user"] = user;
						Session["incorrectAttempts"] = 0; // Reset this value.
						Response.Redirect("/home");
					} else {
						// Scenario where the login is unsuccessful.
						int attempts = (int)Session["incorrectAttempts"];
						Session["incorrectAttempts"] = attempts + 1;
						alertError.Visible = true;
						lblMessage.InnerText = "Invalid password or username!";

						if ((int)Session["incorrectAttempts"] >= 3) {
							recaptchaBox.Visible = true;
						}
					}
				}
			} catch (Exception ex) {
				// Scenario where the login is unsuccessful (via an exception).
				int attempts = (int)Session["incorrectAttempts"];
				Session["incorrectAttempts"] = attempts + 1;

				alertError.Visible = true;
				lblMessage.InnerText = "Invalid password or username!";
			}
		}
	}
}