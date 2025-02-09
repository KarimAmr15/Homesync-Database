<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="Milestone3.BookRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Room</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Book a Room</h1>
            <asp:Label ID="lblMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>

            <div class="form-group">
                <label for="txtUserID">User ID:</label>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtRoomID">Room ID:</label>
                <asp:TextBox ID="txtRoomID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnBookRoom" runat="server" Text="Book Room" OnClick="btnBookRoom_Click" CssClass="btn btn-primary" />
                <br />
             </div>
        </div>
    </form>
</body>
</html>
