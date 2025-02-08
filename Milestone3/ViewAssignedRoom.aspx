<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignedRoom.aspx.cs" Inherits="Milestone3.ViewAssignedRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Assigned Room</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>View Assigned Room</h1>
            <div class="form-group">
                <label for="txtUserID">User ID:</label>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAge">Age:</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnViewRooms" runat="server" Text="View Rooms" OnClick="btnViewRooms_Click" CssClass="btn btn-primary" />
            </div>
            <div class="roomInfoPlaceholder">
                <asp:PlaceHolder ID="roomInfoPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
            <div class="error-message">
                <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            </div>
            <div class="link-button">
                
            </div>
        </div>
        <div class="link-buttons-container mt-2">
              </div>
    </form>

   </body>
</html>
