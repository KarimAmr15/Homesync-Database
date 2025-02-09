<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="Milestone3.CreateEvent" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <h2>Create Event</h2>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <label for="txtEventId">Event ID:</label>
            <asp:TextBox ID="txtEventId" runat="server" CssClass="form-control" OnTextChanged="txtEventId_TextChanged"></asp:TextBox>
            <br />

            <label for="txtUserId">User ID:</label>
            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" OnTextChanged="txtUserId_TextChanged"></asp:TextBox>
            <br />

            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" OnTextChanged="txtName_TextChanged"></asp:TextBox>
            <br />

            <label for="txtDescription">Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" OnTextChanged="txtDescription_TextChanged"></asp:TextBox>
            <br />

            <label for="txtLocation">Location:</label>
            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" OnTextChanged="txtLocation_TextChanged"></asp:TextBox>
            <br />

            <label for="txtReminderDate">Reminder Date:</label>
            <asp:TextBox ID="txtReminderDate" runat="server" CssClass="form-control" OnTextChanged="txtReminderDate_TextChanged"></asp:TextBox>
            <br />

            <label for="txtOtherUserId">Other User ID:</label>
            <asp:TextBox ID="txtOtherUserId" runat="server" CssClass="form-control" OnTextChanged="txtOtherUserId_TextChanged"></asp:TextBox>
            <br />

            <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" CssClass="btn btn-primary" />
            <br />

            <asp:Label ID="outputlabel" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>