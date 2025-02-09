<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CP.aspx.cs" Inherits="Milestone3.CP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create A Payment</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Create A Payment</h1>
        </div>
        <div class="form-group mt-3">
            <label for="SenderID">Sender ID:</label>
            <asp:TextBox ID="SenderID" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ReceiverID">Receiver ID:</label>
            <asp:TextBox ID="ReceiverID" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
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
            <label for="Deadline Date">Date:</label>
            <asp:TextBox ID="Date" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="CreateButton" runat="server" Text="Create" OnClick="CreateButton_Click" CssClass="btn btn-primary" />
        <br />
        <br />
        <asp:Label ID="outputlabel" runat="server" Text=""></asp:Label>
    </form>

   </body>
</html>