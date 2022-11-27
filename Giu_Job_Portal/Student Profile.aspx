<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student Profile.aspx.cs" Inherits="Giu_Job_Portal.Student_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Profile</title>
    <style type="text/css">
         
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
            min-height: 400px;
            position: absolute;
           margin-bottom: 400px
            
        }

        .card2 {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
           margin-top: 15px;
            position: relative;
            top: 466px;
            grid-area: menu;
            float: left;
            width: 300px;
            height: 267px;
            left: 12px;
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
        #form1 {
            height: 56px;
        }
        #proViewer {
            height: 406px;
            top: 80px;
            left: 21px;
        }
    </style>
</head>
<body style="font-family: Arial; font-size: 20px; color: #765c48;">
    <form id="form1" runat="server">
        <div id ="functionalities" class="topnav"  runat="server">
            <asp:Button ID="EditPro" runat="server" OnClick="editProVis"  CssClass="topbfleft" Text="Edit Profile"/>

            <asp:Button ID="Phone" runat="server" OnClick="addPhonesButton" CssClass="topbfleft" Text="Add Phone Number"/>

            <asp:Button ID="applyJob" runat="server" OnClick="applyForJobButton" CssClass="topbfleft" Text="Internships"/>
            
            <asp:Button ID="status" runat="server" OnClick="viewMyStatusButton" CssClass="topbfleft" Text="Internships Status"/>

            <asp:Button ID="progressRepo" runat="server" OnClick="progressReportButton" CssClass="topbfleft" Text="Progress Report" />

            <asp:Button ID="logoutbutton" CssClass="topbfright" runat="server" OnClick="GoHome" Text="Log Out" />

            <asp:Button ID="deletebutton" CssClass="topbfright" runat="server" OnClick="delete" Text="Delete Profile" />

        </div>
        <div id ="proViewer" class="card" runat="server">
            <div id="profilepic" class="iconim" runat="server">
            </div>
            <div id="proView" runat="server">
            </div>
            <asp:Button ID="Button11" runat="server" CssClass="button" Visible="true" OnClick="viewdets" Text="View details" />
            <br />
        </div>
         <div id="viewer2" class="card2" visible="false" runat="server">
        
        </div>
        <div id="edit" runat="server" cssclass="mcont" visible ="false">
            <center>
                <br />
                <br />
                <asp:Label ID="PersonalInfo" CssClass="alltbs" runat="server" Text="Personal Info" Font-Size="15" Font-Names="Arial" Font-Bold="true"></asp:Label>
                <br />
                <br />
                Enter Your First Name<br />
                <asp:TextBox ID="fname" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                Enter Your Middle Name(s)<br />
                <asp:TextBox ID="mname"  CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                Enter Your Last Name
                <br />
                <asp:TextBox ID="lname" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                Birthdate<br />
                <asp:Calendar ID="birth" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                     <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                     <NextPrevStyle VerticalAlign="Bottom" />
                     <OtherMonthDayStyle ForeColor="#808080" />
                     <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                     <SelectorStyle BackColor="#CCCCCC" />
                     <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                     <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                     <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
                <asp:Button ID="Button18"  OnClick="appdprevbirth" CssClass="button"  runat="server" Text="Prev Year" />
                <asp:Button ID="Button19" OnClick="appdnextbirth" CssClass="button" runat="server" Text="Next Year" /><br />

                Email<br />
                <asp:TextBox ID="email" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                Address<br />
                <asp:TextBox ID="address" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Universitydetails" CssClass="alltbs" runat="server" Text="University Details" Font-Size="15" Font-Names="Arial" Font-Bold="true"></asp:Label><br />
                <br />
                GIU ID<br />
                <asp:TextBox ID="GIUID" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                GPA<br />
                <asp:TextBox ID="GPA" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                Semester<br />
                <asp:DropDownList ID="semester" CssClass="alltbs" runat="server">

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
                <br />
                Faculty<br />
                <asp:DropDownList ID="faculty" CssClass="alltbs" runat="server">
                    <asp:ListItem>Choose Your Faculty</asp:ListItem>
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Informatics & CS</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>

                </asp:DropDownList>
                <br />
                Major<br />
                <asp:TextBox ID="major" CssClass="alltbs" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="editconf" CssClass="button" runat="server" OnClick="editProConf" Text="Edit My Profile" />
                <br />
                <br />
        </div>
        <div id ="Addphonenum" runat="server" cssclass="mcont" visible ="false"><center>
            Phone number #1 <br />
            <asp:TextBox ID="phone1" CssClass="alltbs" runat="server"></asp:TextBox> <br /><br />
            Phone number #2 (optional) <br />
            <asp:TextBox ID="phone2" CssClass="alltbs" runat="server"></asp:TextBox> <br /><br />
            Phone number #3 (optional) <br />
            <asp:TextBox ID="phone3" CssClass="alltbs" runat="server"></asp:TextBox> <br /> <br />
            <asp:Button ID="savePhones"  CssClass="button"  runat="server" OnClick ="addPhones" Text="Save" />
            <br />

        </div>

        <div id ="jobsAndApplication" runat="server" visible ="false"><center>
            <asp:GridView ID="apply" CssClass = "cssgridview" runat="server" AutoGenerateColumns="False" DataKeyNames="Job ID" DataSourceID="Giu_Job_Portal">
                <Columns>
                    <asp:BoundField DataField="Job ID" HeaderText="Job ID" InsertVisible="False" ReadOnly="True" SortExpression="Job ID" />
                    <asp:BoundField DataField="Job Title" HeaderText="Job Title" SortExpression="Job Title" />
                    <asp:BoundField DataField="decription" HeaderText="decription" SortExpression="decription" />
                    <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                    <asp:BoundField DataField="s_start_date" HeaderText="s_start_date" SortExpression="s_start_date" />
                    <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
                    <asp:BoundField DataField="duration_in_months" HeaderText="duration" ReadOnly="True" SortExpression="duration_in_months" />
                    <asp:BoundField DataField="application_deadline" HeaderText="application_deadline" SortExpression="application_deadline" />
                    <asp:BoundField DataField="num_of_available_internships" HeaderText="num_of_available_internships" SortExpression="num_of_available_internships" />
                    <asp:BoundField DataField="salary_range" HeaderText="salary_range" SortExpression="salary_range" />
                    <asp:BoundField DataField="qualifications" HeaderText="qualifications" SortExpression="qualifications" />
                    <asp:BoundField DataField="l_location" HeaderText="l_location" SortExpression="l_location" />
                    <asp:BoundField DataField="application_email" HeaderText="application_email" SortExpression="application_email" />
                    <asp:BoundField DataField="job_type" HeaderText="job_type" SortExpression="job_type" />
                    <asp:ButtonField DataTextField="application_link" HeaderText ="link" SortExpression="application_link"/>
                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="Giu_Job_Portal" runat="server" ConnectionString="<%$ ConnectionStrings:GIU_Job_Portal %>" SelectCommand="ShowJobsAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        
            <asp:DropDownList CssClass="alltbs" ID="jobApply" runat="server">
                <asp:ListItem>Choose An Internship</asp:ListItem>
            </asp:DropDownList><br /><br />
            <asp:Button ID="app" runat="server"  CssClass="button" OnClick="applyForJob" Text="Apply" /><br /><br />
            <asp:Label ID="successfulApplication" runat="server"></asp:Label>
        </div>

        <div id ="myStatus" runat="server" cssclass="mcont" visible ="false"> <center>

            Enter the Job ID <br />
            <asp:TextBox ID="jobID" CssClass="alltbs" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="statResp"  CssClass="button" runat="server" OnClick="viewMyStatus" Text="Button" /><br /><br />
            <asp:Label ID="stat" runat="server" Text=""></asp:Label>

        </div>

        <div id="progressRep" runat="server" cssclass="mcont" visible="false"><center>
            <asp:Label ID="currDate" runat="server"></asp:Label><br /><br />
            <asp:TextBox ID="repDescription" CssClass="alltbs" runat="server" Height="247px" Width="827px"></asp:TextBox><br /><br />
            <asp:Button ID="save"  CssClass="button" runat="server" OnClick="progressReport" Text="Save Report" /> <br /><br />
            <asp:Label ID="successful" runat="server"></asp:Label>
        </div>

        <div id ="backToProfile"  runat="server" visible="false">
            <asp:Button ID="BTF"  CssClass="button" runat="server" OnClick="backToPro" Text="Back To Profile" />
        </div>

    </form>
</body>
</html>
