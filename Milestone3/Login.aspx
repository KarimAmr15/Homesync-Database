<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Milestone3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h2>Please Log In:</h2>
        </div>
        <div class="form-group">
            <label for="Email">Email:</label>
            <asp:Label ID="outputlabel" runat="server" CssClass="text-danger"></asp:Label>
            <asp:TextBox ID="Email" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Password">Password:</label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" Width="300px"></asp:TextBox>
        </div>
        <asp:Button ID="signin" runat="server" OnClick="login" Text="Log In" CssClass="btn btn-primary" />
        <hr />
        <div class="text-center">
            <asp:Label ID="registerlabel" runat="server" CssClass="register-label" Text="If you don't have an account, register here"></asp:Label>
            <br />
            <asp:Button ID="registerbutton" runat="server" Text="Register Here" Visible="true" OnClick="registerbutton_Click" CssClass="btn btn-secondary mt-3" />
        </div>
    </form>

   </body>
</html>
