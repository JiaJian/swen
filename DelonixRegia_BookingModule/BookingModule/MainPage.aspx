<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="BookingModule.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 269px">
    
        <table style="width: 100%; background-color: #FFFFCC;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" style="font-weight: 700" Text="Booking Module"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%; margin-bottom: 0px;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Make Booking" />
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Retrieve Booking" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Update Booking" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
