<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateBooking.aspx.cs" Inherits="BookingModule.UpdateBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 416px;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
            width: 416px;
            height: 59px;
        }
        .auto-style4 {
            height: 59px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #FFFF99">
    
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Font-Size="X-Large" style="font-weight: 700" Text="Update Booking Details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Booking ID:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Retrieve" />
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="Guest ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblGuestID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Room Type:"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ISCHELLE\ISCHELLE;Initial Catalog=DelonixRegia;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [type] FROM [tbl_room_type]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label5" runat="server" Text="No. Of Guest:"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label6" runat="server" Text="Check-in Date:"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label7" runat="server" Text="Check-out Date:"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label8" runat="server" Text="Status:"></asp:Label>
                            </td>
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
                            <td class="auto-style1">
                                <asp:Label ID="Label9" runat="server" Text="Remarks:"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:TextBox ID="TextBox5" runat="server" Height="54px" Width="238px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label10" runat="server" Text="Payment Type:"></asp:Label>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                    <asp:ListItem>Cash</asp:ListItem>
                                    <asp:ListItem>Credit</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="margin-left: 40px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
