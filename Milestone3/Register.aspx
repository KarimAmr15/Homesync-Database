<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DBM3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>Register</h2>
        </div>
        <div class="form-group mt-3">
            <label for="type">Type:</label>
            <asp:TextBox ID="type" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="fname">First Name:</label>
            <asp:TextBox ID="fname" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="lname">Last Name:</label>
            <asp:TextBox ID="lname" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="bdate2">Birth Date (MM/DD/YY):</label>
            <asp:TextBox ID="bdate2" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="email2">Email:</label>
            <asp:TextBox ID="email2" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="buttonregister" runat="server" OnClick="register" Text="Register" CssClass="btn btn-primary" />
    </form>

    </body>
</html>
