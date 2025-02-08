<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Milestone3.Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Events Page</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            
        </div>
        <div class="mt-3">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click" CssClass="btn btn-secondary mb-2">Create Event</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Button2_Click" CssClass="btn btn-secondary mb-2">Assign User To Attend An Event</asp:LinkButton>
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="Button3_Click" CssClass="btn btn-secondary mb-2">Uninvite A User To An Event</asp:LinkButton>
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="Button4_Click" CssClass="btn btn-secondary mb-2">View Event</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="Button5_Click" CssClass="btn btn-secondary mb-2">Remove Event</asp:LinkButton>
        </div>
    </form>
</body>
</html>