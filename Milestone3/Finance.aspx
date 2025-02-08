<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="Milestone3.Tasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tasks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        /* Background Gradient */
        body {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
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
        .btn-red { background-color: #dc3545; } /* Danger */
        .btn-orange { background-color: #fd7e14; } /* Warning */
        .btn-purple { background-color: #6f42c1; } /* Purple */

        /* Button Hover Effects */
        .btn-custom:hover {
            opacity: 0.8;
            transform: scale(1.05);
        }

        /* Spacing */
        .button-group {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="card">
                <h2 class="text-primary">Task Management</h2>

                <div class="button-group">
                    <asp:Button ID="MyTasks" runat="server" OnClick="MyTasks_Click" Text="My Tasks" CssClass="btn btn-blue btn-custom mb-2" />
                </div>

                <div class="button-group">
                    <asp:Button ID="FinishTask" runat="server" OnClick="FinishTask_Click" Text="Finish My Task" CssClass="btn btn-green btn-custom mb-2" />
                </div>

                <div class="button-group">
                    <asp:Button ID="TaskStatus" runat="server" Text="Task Status" OnClick="TaskStatus_Click" CssClass="btn btn-orange btn-custom mb-2" />
                </div>

                <div class="button-group">
                    <asp:Button ID="AddReminder" runat="server" Text="Add Reminder" OnClick="AddReminder_Click" CssClass="btn btn-purple btn-custom mb-2" />
                </div>

                <div class="button-group">
                    <asp:Button ID="UpdateDeadline" runat="server" OnClick="UpdateDeadline_Click" Text="Update Deadline" CssClass="btn btn-red btn-custom mb-2" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
