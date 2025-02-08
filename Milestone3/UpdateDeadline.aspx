<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDeadline.aspx.cs" Inherits="Milestone3.UpdateDeadline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Deadline</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>Update Deadline</h2>
        </div>
        <div class="form-group mt-3">
            <label for="Task">Task ID:</label>
            <asp:TextBox ID="Task" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="Deadline">Deadline:</label>
            <asp:TextBox ID="Deadline" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="UpdateDD" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="UpdateDD_Click" />
        <asp:Label ID="Label2" runat="server" CssClass="message-label mt-3"></asp:Label>
    </form>

   </body>
</html>
