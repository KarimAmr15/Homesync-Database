<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devices.aspx.cs" Inherits="Milestone3.Devices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Devices</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <h2><asp:Label ID="userTypeLabel" runat="server" CssClass="text-info"></asp:Label></h2>
                <hr />
                <div class="device-list">
                    <asp:PlaceHolder ID="infoPlacehold" runat="server"></asp:PlaceHolder>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Enter device id"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="View Device Charge" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Label ID="output1" runat="server" CssClass="text-info mt-3"></asp:Label>

                <div class="mt-3">
                    <asp:Button ID="addbutton1" runat="server" Text="Add New Device" OnClick="addbutton1_Click" CssClass="btn btn-info mt-3" />
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <asp:TextBox ID="add1" runat="server" CssClass="form-control" Visible="false" placeholder="Device ID"></asp:TextBox>
                        <asp:TextBox ID="add2" runat="server" CssClass="form-control" Visible="false" placeholder="Status"></asp:TextBox>
                        <asp:TextBox ID="add3" runat="server" CssClass="form-control" Visible="false" placeholder="Battery"></asp:TextBox>
                        <asp:TextBox ID="add4" runat="server" CssClass="form-control" Visible="false" placeholder="Room Number"></asp:TextBox>
                        <asp:TextBox ID="add5" runat="server" CssClass="form-control" Visible="false" placeholder="Type"></asp:TextBox>
                        <asp:Button ID="addbutton2" runat="server" Text="ADD" OnClick="addbutton2_Click" CssClass="btn btn-primary mt-3" Visible="false" />
                        <asp:Label ID="output2" runat="server" Text="" CssClass="text-info mt-3" Visible="false"></asp:Label>

                        <asp:Button ID="loc" runat="server" Text="Get Location of All Devices Out of Battery" CssClass="btn btn-info mt-3" Height="44px" Width="366px" OnClick="loc_Click" />
                        <asp:Label ID="loclabel" runat="server" Text="" CssClass="text-info mt-3"></asp:Label>

                        <asp:Button ID="batterybutton" runat="server" Height="43px" Text="Charge Devices that are Out of Battery" CssClass="btn btn-info mt-3" Width="340px" OnClick="batterybutton_Click" />
                        <asp:Label ID="batterylabel" runat="server" Text="" CssClass="text-info mt-3"></asp:Label>

                        <asp:Button ID="getbutton" runat="server" Height="45px" Text="Get Location Where More Than 2 Devices Have a Dead Battery" CssClass="btn btn-info mt-3" Width="549px" OnClick="getbutton_Click" />
                        <asp:Label ID="getlabel" runat="server" Text="" CssClass="text-info mt-3"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

            </form>
</body>
</html>

