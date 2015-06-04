<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RetrieveBooking.aspx.cs" Inherits="BookingModule.RetrieveBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
            text-align: center;
        }
    </style>
</head>
<body style="height: 331px">
    <form id="form1" runat="server">
    <div>
    
    </div>
        <br />
        <table style="width: 100%; background-color: #FFFFCC;">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" style="font-weight: 700" Text="Retrieve Booking"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Booking ID:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search" />
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" style="margin-left: 270px" Width="358px">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Edit" />
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
