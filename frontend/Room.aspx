<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="Milestone3.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        /* Background Gradient */
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Card Styling */
        .card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            background: white;
            text-align: center;
        }

        /* Stylish Buttons */
        .btn-custom {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease;
            color: white;
        }

        /* Button Colors */
        .btn-blue { background-color: #007bff; } /* Primary */
        .btn-green { background-color: #28a745; } /* Success */
        .btn-orange { background-color: #fd7e14; } /* Warning */
        .btn-purple { background-color: #6f42c1; } /* Purple */
        .btn-red { background-color: #dc3545; } /* Danger */

        /* Button Hover Effects */
        .btn-custom:hover {
            opacity: 0.8;
            transform: scale(1.05);
        }

        /* Spacing */
        .button-group {
            margin-top: 35px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="card">
                <h2 class="text-primary">Room Management</h2>

                <div class="button-group">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn btn-blue btn-custom mb-2">View Assigned Room</asp:LinkButton>
                </div>

                <div class="button-group">
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="btn btn-green btn-custom mb-2">Book Your Room</asp:LinkButton>
                </div>

                <div class="button-group">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CssClass="btn btn-orange btn-custom mb-2">Change Room Status</asp:LinkButton>
                </div>

                <div class="button-group">
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" CssClass="btn btn-purple btn-custom mb-2">View Unused Rooms</asp:LinkButton>
                </div>

                <div class="button-group">
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" CssClass="btn btn-red btn-custom mb-2">Create Schedule for a Room</asp:LinkButton>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
