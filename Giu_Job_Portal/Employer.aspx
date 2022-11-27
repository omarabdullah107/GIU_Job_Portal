<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employer.aspx.cs" Inherits="Giu_Job_Portal.Employer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
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


        <div id="home" class="topnav" runat="server" visible="true">
            <asp:Button ID="Button10" CssClass="topbfright" runat="server" OnClick="GoHome" Text="Log Out" />
            <asp:Button ID="Button2" CssClass="topbfright" runat="server" OnClick="showedit" Text="Edit Profile" />

            <asp:Button ID="Button7" CssClass="topbfright" runat="server" OnClick="delete" Text="Delete Profile" />

            <asp:Button ID="Button8" CssClass="topbfleft" runat="server" OnClick="viewstats" Text="View Status" />

            <asp:Button ID="Button4" CssClass="topbfleft" runat="server" OnClick="showjobs" Text="Show Jobs" />

            <asp:Button ID="Button3" CssClass="topbfleft" runat="server" OnClick="showPostJob" Text="Post Job" />
            <asp:Button ID="Button1" CssClass="topbfleft" runat="server" OnClick="seestudents" Text="Applying Students" />

            <br />
            <br />
            <br />
        </div>
        <div id="proViewer" class="card" runat="server">
            <div id="profilepic" class="iconim" runat="server">
            </div>
            <div id="proView" runat="server">
            </div>
            <asp:Button ID="Button11" runat="server" CssClass="button" Visible="false" OnClick="viewdets" Text="View details" />
            <br />


        </div>



        <div id="viewer2" class="card2" visible="false" runat="server">
        
        </div>

        <div id="jobdisp" class="mcont" runat="server" visible="false">
        
        </div>

        <div id="post" class="mcontP" runat="server" visible="false">
            Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="Title" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;
            &nbsp;
            <asp:TextBox ID="Department" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Descript" CssClass="alltbs2" runat="server" Height="42px" Width="406px"></asp:TextBox>
            <br />
            Start Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Calendar ID="Startd" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            <asp:Button ID="Button14" runat="server" CssClass="button" OnClick="startdprev" Text="Prev Year" />
            <asp:Button ID="Button15" runat="server" CssClass="button" OnClick="startdnext" Text="Next Year" />
            <br />
            End Date&nbsp;&nbsp;&nbsp;<asp:Calendar ID="endd" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            &nbsp;<asp:Button ID="Button16" runat="server" CssClass="button" OnClick="enddprev" Text="Prev Year" />
            <asp:Button ID="Button17"  runat="server" CssClass="button" OnClick="enddnext" Text="Next Year" />
            <br />
            Application deadline<asp:Calendar ID="appd" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            <asp:Button ID="Button18"  OnClick="appdprev" CssClass="button"  runat="server" Text="Prev Year" />
            <asp:Button ID="Button19" OnClick="appdnext" CssClass="button" runat="server" Text="Next Year" />
            <br />
            <br />
            No. of&nbsp; spots&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Salary Range:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qualifications<br />
            <asp:TextBox ID="nospots" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<asp:TextBox ID="SalaryRange" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:TextBox ID="Qualifications" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Application Link&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Application Email<br />
            <asp:TextBox ID="Location" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:TextBox ID="Applink" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="AppEmail" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            Job Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Work Days If Part Time<br />
            <asp:DropDownList ID="JobType" CssClass="alltbs" runat="server">
                <asp:ListItem>Choose Type</asp:ListItem>
                <asp:ListItem>Part Time</asp:ListItem>
                <asp:ListItem>Industrial Internship</asp:ListItem>
                <asp:ListItem>Freelance</asp:ListItem>
                <asp:ListItem>Summer Internship</asp:ListItem>
                <asp:ListItem>Full Time</asp:ListItem>
                <asp:ListItem>Project Based</asp:ListItem>

            </asp:DropDownList>
            <asp:TextBox ID="Workdays" CssClass="alltbs" runat="server"></asp:TextBox>


            <br />


            <br />
            <asp:Button ID="Button5" CssClass="button" runat="server" OnClick="PostJob" Text="Post" />


        </div>
        <div id="edit" class="mcont" runat="server" visible="false">
            New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Company Name<br />
            <asp:TextBox ID="Password" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="Address" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:TextBox ID="Comname" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            New Company Phone&nbsp; New Fax&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            New Company Website:<br />
            <asp:TextBox ID="Comphone" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="fax" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="comweb" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            New Type Of business:&nbsp;&nbsp;
            &nbsp;&nbsp;
            Origin Country<br />
            <asp:DropDownList ID="typeofbusi" CssClass="alltbs" runat="server">
                <asp:ListItem>Choose A Type</asp:ListItem>
                <asp:ListItem>startup</asp:ListItem>
                <asp:ListItem>company</asp:ListItem>
                <asp:ListItem>government entity</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="country" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            &nbsp;New Establishment Year:<asp:Calendar ID="Calendar1" runat="server" Height="180px" Width="200px" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            <asp:Button ID="Button12" CssClass="button" runat="server" OnClick="prevyear" Text="Prev Year" />
            &nbsp;<asp:Button ID="Button13" CssClass="button" OnClick="nextyear" runat="server" Text="Next Year" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Industry:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            New Number of Employees:&nbsp;&nbsp;
            New Products or Services:<br />
            <asp:TextBox ID="industry" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="nofemployees" CssClass="alltbs" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="productorservices" CssClass="alltbs" runat="server"></asp:TextBox>

            <br />
            <asp:Button ID="Button6" runat="server" CssClass="button" OnClick="Savechange" Text="Save Changes" />

        </div>
        <div id="students" class="mcont" runat="server" visible="false">
             <div id="Update" class="mcontU" runat="server" visible="false">
            Update A Student&#39;s Status<br />
            The Student&#39;s ID:<br />
            <asp:TextBox ID="studentid" CssClass="alltbs" runat="server"></asp:TextBox>
            <br />
            The Job&#39;s ID:<br />
            <asp:DropDownList ID="Jobs" CssClass="alltbs" runat="server">
                <asp:ListItem>Choose A Job ID</asp:ListItem>
            </asp:DropDownList>
            <br />
            Status:<br />
            <asp:DropDownList ID="statstudent" CssClass="alltbs" runat="server">
                <asp:ListItem>Choose Status</asp:ListItem>
                <asp:ListItem>Accepted</asp:ListItem>
                <asp:ListItem>Rejected</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button9" runat="server" CssClass="button" OnClick="updatestat" Text="Update" />
            <br />
        </div>
        </div>
        <div id="Views" style="width: 80%" class="mcontU" runat="server" visible="true">
        </div>
       
        <div id="success1" class="mcont" runat="server" visible="false">
        </div>
        <div id="Success" class="mcont" runat="server" visible="false">
            Job Posted Sucess
        </div>

    </form>
</body>
</html>
