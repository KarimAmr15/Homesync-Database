<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskStatus.aspx.cs" Inherits="Milestone3.TaskStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Status</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>Task Status</h2>
        </div>
        <div class="form-group mt-3">
            <label for="CreatorId">Creator ID:</label>
            <asp:TextBox ID="CreatorId" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="mt-3">
            <asp:Button ID="ViewStatus" runat="server" Text="View Status" CssClass="btn btn-primary" OnClick="ViewStatus_Click" />
        </div>
        <asp:PlaceHolder ID="Placeholder" runat="server" ></asp:PlaceHolder>
    </form>

   </body>
</html>
