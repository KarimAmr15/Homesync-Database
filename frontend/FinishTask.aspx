<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishTask.aspx.cs" Inherits="Milestone3.FinishTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Finish Task</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>Finish Task</h2>
        </div>
        <div class="form-group mt-3">
            <label for="Title">Title:</label>
            <asp:TextBox ID="Title" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="Finish" runat="server" Text="Finish" OnClick="Finish_Click" CssClass="btn btn-primary" />
        <asp:Label ID="outputlabel" runat="server" CssClass="message-label"></asp:Label>
    </form>

  </body>
</html>
