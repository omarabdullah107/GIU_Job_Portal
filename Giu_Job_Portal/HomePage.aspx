<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Giu_Job_Portal.HomePage" %>


<!DOCTYPE html>
<style>
    table , tr , td , th{
        border:none;
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
        border-style : hidden;
        background-color: #009879;
        color: #ffffff;
        text-align: center;
        font-weight: bold;
        font-size: 13pt;
    }

    .cssgridview th,
    .cssgridview td {
        padding: 12px 15px;
        min-width: 50px;
        max-height: 60px;
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

    .searchnav {
        height: 40px;
        width: 20%;
        background-color: #00755d;
        border-radius: 10px;
    }

    .searchnavtextb {
        float: left;
        margin: 5px;
        padding: 5px;
        border-radius: 10px;
    }

    .searchnavsearch{
        float: left;
        width: 30px;
        height: 30px;
        padding: 12px;
        color: white;
        margin: 4px;
        border: none;
        outline: none;
        background-image: url("Images/icon-services-fcs.png");
        background-size: 30px 30px;
        background-color: transparent;
    }
        .searchnavsearch:hover {
            background-color: #ddd;
            color: black;
        }

    .loginButton {
        margin: 5px;
        padding: 10px;
        border-radius: 30px;
        border-block-color: #009879;
        font-size:20px;
        background-color: #009879;
        color: white;
        
    }
        .loginButton:hover {
             background-color: #ddd;
            color: black;
        }

    .alltbs {
        margin: 5px;
        padding: 5px;
        border-radius: 10px;
        border-block-color: #00755d;
        
    }

</style>

<html>
<head>
    <title>HomePage</title>
</head>
<body style="height: 1897px ;font-family: Arial;  color: #765c48;">
    <form id="mainPage" runat="server">

        <div id="topNav" class="topnav" runat="server">
            <asp:Button ID="showEmps" CssClass="topbfleft" runat="server" OnClick="showEmpsMethod" Text="Employers" />
            <asp:Button ID="showJobs" CssClass="topbfleft" runat="server" OnClick="showJobsMethod" Text="Jobs" />
            <asp:Button ID="aboutUs" CssClass="topbfleft" runat="server" OnClick="About_US" Text="About Us" />
            <asp:Button ID="contactUs" CssClass="topbfleft" runat="server" OnClick="Contact_US" Text="Contact Us" />

            <asp:Button ID="login" CssClass="topbfright" runat="server" OnClick="loginRedirectMethod" Text="Login" />
            <asp:Button ID="register" CssClass="topbfright" runat="server" OnClick="registeredMethod" Text="Register" />
            <asp:Button ID="searchJob" CssClass="topbfright" runat="server" OnClick="searchImgButton" Text="Search Job"/>

        </div>

        <div id ="searchNav" class="searchnav" runat="server" visible ="false">
            <asp:DropDownList ID="searchSemeter" CssClass="searchnavtextb" runat="server">
                <asp:ListItem>Choose A Semester</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            <asp:DropDownList ID="searchFaculty" CssClass="searchnavtextb" runat="server">
                <asp:ListItem>Choose Your Faculty</asp:ListItem>
                <asp:ListItem>Engineering</asp:ListItem>
                <asp:ListItem>Informatics & CS</asp:ListItem>
                <asp:ListItem>Business</asp:ListItem>
                <asp:ListItem>Design</asp:ListItem></asp:DropDownList>

            <asp:Button ID="searchButton" CssClass="searchnavsearch" runat="server" OnClick="searchJobGV" />
            
        </div>
        
        <div id ="emps" runat="server" visible ="false">

        </div>

        <div id ="jobShow" runat="server" visible ="false">

        </div>

        <div id="searchJ" runat="server" visible="false">

        </div>

        <div id="log" runat="server" visible="false">
            <center>
            Login<br /><br /><br />
            
            Email:<br />
            <asp:TextBox ID="Email" CssClass="alltbs" runat="server"></asp:TextBox><br /><br /><br />
           
            Password:<br />
            <asp:TextBox ID="passcode" TextMode="Password" CssClass="alltbs" runat="server"></asp:TextBox><br /><br /><br /><br />
            <asp:Button ID="loginButton" runat="server" CssClass="loginButton" OnClick="loginM" Text="Login" /><br /><br /><br /><br />

            <asp:Label ID="loginSuccess" runat="server" Font-Size="20" Font-Names="Arial" Font-Bold="true" Visible="false"></asp:Label>

        </center></div>

    </form>
</body>
</html>
