<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SM.aspx.cs" Inherits="Milestone3.SM" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Message</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Send Message</h1>
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
            <label for="Title">Title:</label>
            <asp:TextBox ID="Title" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Content">Content:</label>
            <asp:TextBox ID="Content" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TimeSent">Time Sent:</label>
            <asp:TextBox ID="TimeSent" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TimeReceived">Time Received:</label>
            <asp:TextBox ID="TimeReceived" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click" CssClass="btn btn-primary" />
        <br />
        <br />
        <asp:Label ID="outputlabel" runat="server" Text=""></asp:Label>
    </form>

  </body>
</html>