<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="Milestone3.ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        /* Background styling */
        body {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Card design */
        .card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            background: white;
        }

        /* Stylish buttons */
        .btn-custom {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease;
            color: white;
        }

        /* Button colors */
        .btn-blue { background-color: #007bff; } /* Primary */
        .btn-green { background-color: #28a745; } /* Success */
        .btn-red { background-color: #dc3545; } /* Danger */
        .btn-orange { background-color: #fd7e14; } /* Warning */
        .btn-purple { background-color: #6f42c1; } /* Purple */
        .btn-teal { background-color: #20c997; } /* Teal */

        /* Button hover effects */
        .btn-custom:hover {
            opacity: 0.8;
            transform: scale(1.05);
        }

        /* Input fields */
        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
        }

        /* Labels */
        .form-label {
            font-weight: bold;
            font-size: 18px;
        }

        /* Centering elements */
        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="card">
                <h2 class="text-center text-primary mb-4">Your Profile</h2>

                <asp:PlaceHolder ID="infoPlaceholder" runat="server"></asp:PlaceHolder>

                <!-- Admin ID Input -->
                <div class="form-group">
                    <label class="form-label" for="numGuestsText">Enter Admin's ID:</label>
                    <asp:TextBox ID="numGuestsText" runat="server" CssClass="form-control" placeholder="Admin ID"></asp:TextBox>
                </div>

                <!-- Number of Guests -->
                <div class="form-group">
                    <asp:Button ID="numGuestsButton" runat="server" Text="Check Number of Guests" CssClass="btn btn-blue btn-custom" OnClick="numGuestsButton_Click" />
                    <asp:Label ID="numGuestsOutput" runat="server" CssClass="d-block mt-2 text-info"></asp:Label>
                </div>

                <!-- Set Allowed Guests -->
                <div class="form-group">
                    <label class="form-label">Set Number of Allowed Guests:</label>
                    <asp:Label ID="maxg" runat="server" Text="" CssClass="font-weight-bold text-danger"></asp:Label>
                    <asp:TextBox ID="numberofgueststxt" runat="server" CssClass="form-control" placeholder="Enter max guests"></asp:TextBox>
                    <asp:Button ID="numberofguestsbutton" runat="server" Text="Set Limit" CssClass="btn btn-green btn-custom mt-2" OnClick="numberofguestsbutton_Click" />
                </div>

                <!-- Delete Guest Section -->
                <hr />
                <h4 class="text-center text-danger">Delete A Guest</h4>
                <div class="form-group">
                    <asp:TextBox ID="GuestID" runat="server" CssClass="form-control mb-2" placeholder="Guest ID"></asp:TextBox>
                    <asp:TextBox ID="UserID" runat="server" CssClass="form-control mb-2" placeholder="User ID"></asp:TextBox>
                </div>
                <asp:Button ID="Guest" runat="server" Text="Delete Guest" CssClass="btn btn-red btn-custom" OnClick="Guest_Click" />
                <asp:Label ID="outputlabel" runat="server" CssClass="d-block mt-2 text-danger"></asp:Label>

                <hr />
                <!-- Navigation Buttons -->
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <asp:Button ID="Rooms" runat="server" Text="Rooms" CssClass="btn btn-purple btn-custom" OnClick="Rooms_Click" />
                    </div>
                    <div class="col-md-6 mb-2">
                        <asp:Button ID="Tasks" runat="server" Text="Tasks" CssClass="btn btn-orange btn-custom" OnClick="Tasks_Click" />
                    </div>
                    <div class="col-md-6 mb-2">
                        <asp:Button ID="Devices" runat="server" Text="Devices" CssClass="btn btn-teal btn-custom" OnClick="Devices_Click" />
                    </div>
                    <div class="col-md-6 mb-2">
                        <asp:Button ID="Events" runat="server" Text="Events" CssClass="btn btn-blue btn-custom" OnClick="Events_Click" />
                    </div>
                    <div class="col-md-6 mb-2 mx-auto">
                        <asp:Button ID="Finance" runat="server" Text="Finance" CssClass="btn btn-green btn-custom" OnClick="Finance_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
