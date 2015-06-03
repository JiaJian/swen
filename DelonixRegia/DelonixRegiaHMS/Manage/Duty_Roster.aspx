<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Duty_Roster.aspx.cs" Inherits="DelonixRegiaHMS.Manage.Duty_Roster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
	Duty Roster
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Styles" runat="server">
	<link href="/Assets/Styles/calendar.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Duty roster <small>for maintenance staff</small></h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div id="calendar">

			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Scripts" runat="server">
	<script src="/Assets/Scripts/underscore-min.js"></script>
	<script src="/Assets/Scripts/calendar.min.js"></script>
	<script type="text/javascript">
		var calendar = $("#calendar").calendar(
            {
            	tmpl_path: "/Assets/CalendarTemplates/",
            	events_source: function () { return []; }
            });
	</script>
</asp:Content>
