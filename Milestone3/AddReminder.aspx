<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReminder.aspx.cs" Inherits="Milestone3.AddReminder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Reminder</title>
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
            max-width: 450px;
             margin-top: 45px;
        }

        /* Input Fields */
        .form-control {
            border-radius: 10px;
            font-size: 16px;
            padding: 10px;
        }

        /* Stylish Button */
        .btn-custom {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease;
            color: white;
            background-color: #28a745;
            border: none;
        }

        /* Button Hover Effects */
        .btn-custom:hover {
            opacity: 0.8;
            transform: scale(1.05);
        }

        /* Message Label */
        .message-label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="card">
                <h2 class="text-primary">Add Reminder</h2>

                <div class="form-group mt-3">
                    <label for="Task">Task ID:</label>
                    <asp:TextBox ID="Task" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group mt-3">
                    <label for="ReminderDate">Reminder Date:</label>
                    <asp:TextBox ID="ReminderDate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <asp:Button ID="AddRem" runat="server" Text="Add Reminder" OnClick="AddRem_Click" CssClass="btn btn-custom mt-3" />

                <asp:Label ID="Label1" runat="server" CssClass="message-label"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
