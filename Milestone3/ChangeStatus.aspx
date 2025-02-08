<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeStatus.aspx.cs" Inherits="YourNamespace.ChangeStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Room Status</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Change Room Status</h1>
            <div class="form-group">
                <label for="txtRoomID">Room ID:</label>
                <asp:TextBox ID="txtRoomID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNewStatus">New Status:</label>
                <asp:TextBox ID="txtNewStatus" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnChangeStatus" runat="server" Text="Change Status" OnClick="btnChangeStatus_Click" CssClass="btn btn-primary" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />
                
                <br />
            </div>
        </div>
    </form>

   </body>
</html>

