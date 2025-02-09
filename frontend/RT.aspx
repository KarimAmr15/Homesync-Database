<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RT.aspx.cs" Inherits="Milestone3.RT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receive A Transaction</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Receive A Transaction</h1>
        </div>
        <div class="form-group mt-3">
            <label for="SenderID">Sender ID:</label>
            <asp:TextBox ID="SenderID" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Type">Type:</label>
            <asp:TextBox ID="Type" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Amount">Amount:</label>
            <asp:TextBox ID="Amount" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Status">Status:</label>
            <asp:TextBox ID="Status" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Date">Date:</label>
            <asp:TextBox ID="Date" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="ReceiveButton" runat="server" Text="Receive" OnClick="ReceiveButton_Click" CssClass="btn btn-primary" />
        <br />
        <asp:Label ID="outputlabel" runat="server" Text=""></asp:Label>
        <br />
    </form>

   </body>
</html>