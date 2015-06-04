<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBooking.aspx.cs" Inherits="BookingModule.CreateBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 444px;
            text-align: right;
        }
        .auto-style4 {
            height: 23px;
            width: 444px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 403px; background-color: #FFFF99;">
    
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Create Booking"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="All fields are mandatory except for those with *."></asp:Label>
        <br />
        <br />
        <table style="width: 100%; height: 51px;">
            <tr>
                <td class="auto-style3">Booking ID:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Guest ID:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Room Type:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ISCHELLE\ISCHELLE;Initial Catalog=DelonixRegia;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [type] FROM [tbl_room_type]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">No. of Guest:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Check-in Date:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Check-out Date:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Status:</td>
                <td style="margin-left: 40px">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Confirmed</asp:ListItem>
                        <asp:ListItem>Cancelled</asp:ListItem>
                        <asp:ListItem>On-Hold</asp:ListItem>
                        <asp:ListItem>Checked In</asp:ListItem>
                        <asp:ListItem>Checked Out</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Remarks:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox7" runat="server" Height="49px" Width="270px"></asp:TextBox>
                    *</td>
            </tr>
            <tr>
                <td class="auto-style3">Payment Type:</td>
                <td style="margin-left: 40px">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Transaction Time:</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="TextBox9" runat="server" TextMode="Time"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td style="margin-left: 40px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm Booking" />
                </td>
                <td style="margin-left: 40px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="height: 26px" Text="Cancel" />
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
