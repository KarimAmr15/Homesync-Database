<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomSchedule.aspx.cs" Inherits="Milestone3.CreateSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Schedule</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Create Schedule for a Room</h1>
            <div class="form-group mt-3">
                <label for="txtCreatorID">Creator ID:</label>
                <asp:TextBox ID="txtCreatorID" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
            <div class="form-group mt-3">
                <label for="txtRoomID">Room ID:</label>
                <asp:TextBox ID="txtRoomID" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
            <div class="form-group mt-3">
                <label for="txtStartTime">Start Time:</label>
                <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
            <div class="form-group mt-3">
                <label for="txtEndTime">End Time:</label>
                <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
            <div class="form-group mt-3">
                <label for="txtAction">Action:</label>
                <asp:TextBox ID="txtAction" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
            <div class="form-group mt-3">
                <asp:Button ID="btnCreateSchedule" runat="server" Text="Create Schedule" CssClass="btn btn-primary" OnClick="btnCreateSchedule_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="mt-3" Text=""></asp:Label>
            </div>
        </div>
    </form>

  </body>
</html>
