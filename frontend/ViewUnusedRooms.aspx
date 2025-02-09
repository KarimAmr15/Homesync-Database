<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUnusedRooms.aspx.cs" Inherits="Milestone3.ViewUnusedRooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Unused Rooms</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Unused Rooms</h1>
            <asp:GridView ID="gridViewUnusedRooms" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="room_id" HeaderText="Room ID" ItemStyle-CssClass="font-weight-bold" />
                    <asp:BoundField DataField="type" HeaderText="Room Type" ItemStyle-CssClass="font-weight-bold" />
                    <asp:BoundField DataField="floor" HeaderText="Floor" ItemStyle-CssClass="font-weight-bold" />
                </Columns>
            </asp:GridView>
            <div class="mt-3">
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
