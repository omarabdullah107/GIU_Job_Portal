<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Career office coordinator.aspx.cs" Inherits="Giu_Job_Portal.Career_office_coordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #soso {
            height: 700px;
            width: 1571px;
        }
    </style>
     <style>
        table, tr, td, th {
            border: none;
        }

        .cssgridview {
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
        }

            .cssgridview th {
                border-style: hidden;
                background-color: #009879;
                color: #ffffff;
                text-align: center;
                font-weight: bold;
            }

            .cssgridview th,
            .cssgridview td {
                padding: 12px 15px;
            }

            .cssgridview tbody tr {
                border-bottom: 1px solid #dddddd;
            }

                .cssgridview tbody tr:nth-of-type(even) {
                    background-color: #f3f3f3
                }

                .cssgridview tbody tr:last-of-type {
                    border-bottom: 2px solid #009879
                }

        .grid-container {
            display: grid;
            grid-template-areas:
                'header header header header header header'
                'menu main main main right right'
                'menu footer footer footer footer footer';
            margin: 10px;
            background-color: #2196F3;
            padding: 10px;
        }

            .grid-container > div {
                background-color: rgba(255, 255, 255, 0.8);
                text-align: center;
                padding: 20px 0;
                font-size: 30px;
            }


        .topnav {
            height: 47px;
            width: 100%;
            background-color: #009879;
            border-radius: 10px;
        }

    .topbfleft {
        float: left;
        text-align: center;
        padding: 12px;
        color: white;
        text-decoration: none;
        font-size: 19px;
        background-color: #009879;
        border: none;
        outline: none;
        border-radius: 10px;

    }

        .topbfleft:hover {
            background-color: #ddd;
            color: black;
        }

    .topbfright {
        float: right;
        text-align: center;
        padding: 12px;
        color: white;
        text-decoration: none;
        font-size: 19px;
        background-color: #009879;
        border: none;
        outline: none;
        border-radius: 10px;

    }

        .topbfright:hover {
            background-color: #ddd;
            color: black;
        }



        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            grid-area: menu;
            float: left;
            width: 300px;
            height: 400px;
            position: absolute;
            margin-bottom: 400px
        }

        .card2 {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            margin-top: 400px;
            position: relative;
            top: 30px;
            grid-area: menu;
            float: left;
            width: 300px;
            height: 300px;
        }

        .title {
            color: black;
            font-size: 30px;
        }

        .phone {
            color: grey;
            font-size: 18px;
        }

        .web {
            color: #75E6DA;
            font-size: 22px;
        }
        .mcontU {
            float: left;
            margin-left: 400px;
            grid-area: main;
            height: 293px;
            width: 1060px;
            margin-bottom: 50px;
        
        }
        .iconim {
            width: 220px;
            height: 220px;
            color: white;
            border: black;
            outline: black;
            margin-left: 20px;
            background-image: url('Images/avatar-man-icon.png');
            margin-right: 40px;
            margin-top: 4px;
            margin-bottom: 4px;
        }

        .mcont {
            float: left;
            margin-left: 400px;
            grid-area: main;
            height: 642px;
            width: 1058px;
            margin-bottom: 50px;
        }
        .mcontP {
            float: left;
            margin-left: 400px;
            grid-area: main;
            height: 1349px;
            width: 1060px;
            margin-bottom: 50px;
        }

        #Success {
            width: 780px;
        }
        .alltbs2 {
         margin: 5px;
            padding: 5px;
            border-radius: 10px;
            border-block-color: #00755d;
        }

        .alltbs {
            margin: 5px;
            padding: 5px;
            border-radius: 10px;
            border-block-color: #00755d;
        }

        .button {
            margin: 5px;
            padding: 10px;
            border-radius: 30px;
            border-block-color: #009879;
            font-size: 20px;
            background-color: #009879;
            color: white;
        }

            .button:hover {
                background-color: #ddd;
                color: black;
            }
        .alltbs2 {}
    </style>
</head>
<body style="font-family: Arial; font-size: 20px; color: #765c48;">
    <form id="form1" runat="server">
        <div id="soso" runat="server">
            View the academic advisors of each faculty<br />
            <asp:Button ID="Show" runat="server" OnClick="Button1_Click" Text="Faculty" />
            <br />
            Add academic advisor to industrial intership<br />
            <asp:Label ID="Label2" runat="server" Text="Industrial internship id"></asp:Label>
            <br />
            <asp:TextBox ID="IndustrialID" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Academic advisor id"></asp:Label>
            <br />
            <asp:TextBox ID="AcademicID" CssClass="alltbs" runat="server" OnTextChanged="ADD"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" CssClass="button" runat="server" Text="Add" OnClick="ADD" />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Students that applied to industrial internship"></asp:Label>
            <br />
            <asp:TextBox ID="Student" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button3" CssClass="button" runat="server" Text="Information" OnClick="studentinfo" />
            <br />
            <asp:Label ID="Label4" CssClass="alltbs" runat="server" Text="Industrial internship elgibility for students"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="s_id"></asp:Label>
            <br />
            <asp:TextBox ID="Student_id" CssClass="alltbs" runat="server" ></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="ii_id"></asp:Label>
            <br />
            <asp:TextBox ID="interinship_id" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="eligible or not"></asp:Label>
            <br />
            <asp:TextBox ID="elgible" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Elgibl" CssClass="button" runat="server" Text="Update" OnClick="Elgiblety" />
            <br />
            <asp:Label ID="Label8" runat="server" Text="DeleteProfile"></asp:Label>
            <br />
            <asp:Label ID="Label9" runat="server" Text="USER_ID"></asp:Label>
            <br />
            <asp:TextBox ID="User_id" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button4" CssClass="button" runat="server" Text="DELETE" OnClick="Button4_Click" />
            <br />
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>

