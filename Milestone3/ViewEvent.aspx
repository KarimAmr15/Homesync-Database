<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="Milestone3.ViewEvent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Event</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>View Event</h2>

            <div class="form-group">
                <label for="txtUserId">User ID:</label>
                <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" OnTextChanged="txtUserId_TextChanged"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtEventId">Event ID:</label>
                <asp:TextBox ID="txtEventId" runat="server" CssClass="form-control" OnTextChanged="txtEventId_TextChanged"></asp:TextBox>
            </div>

            <asp:Button ID="btnAssign" runat="server" Text="View" OnClick="btnAssign_Click" CssClass="btn btn-primary" />

            <br />

            <hr />

            <div class="row">
              
                <asp:Label ID="outputlabel" runat="server" Text=""></asp:Label>
              
            </div>

            <asp:PlaceHolder ID="infoPlaceholder" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>