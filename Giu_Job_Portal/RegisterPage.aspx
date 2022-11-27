<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="Giu_Job_Portal.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .topnav {
            height: 47px;
            width: 100%;
            background-color: #009879;
            margin-bottom: 10px;
            border-radius: 10px;
        }

        .topnavlabel {
            padding: 3px;
            font-family: Arial;
            font-size: 30pt;
            color: white;
        }

        .usertypeLabel {
            font-family: Arial;
            font-size: 20pt;
        }

        .typeButton {
            margin: 5px;
            padding: 10px;
            border-radius: 30px;
            border-block-color: #009879;
            font-size: 20px;
            background-color: #009879;
            color: white;
        }

            .typeButton:hover {
                background-color: #ddd;
                color: black;
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
    </style>
</head>
<body style="font-family: Arial; font-size: 20px; color: #765c48;">
    <form id="form1" runat="server">
        <div id="topNav" class="topnav">
            <center>
                <asp:Label ID="register" CssClass="topnavlabel" runat="server" Text="Sign Up"></asp:Label>
        </div>
        <div id="usertype" runat="server">
            <center>
                <br />
                <br />
                <asp:Label ID="type" runat="server" CssClass="usertypeLabel" Text="Select Your User-Type"></asp:Label>
                <br />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="alltbs">
                    <asp:ListItem>Choose your type</asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Employer</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>

                </asp:DropDownList>
                <br />
                <br />

                <asp:Button ID="typebutton1" runat="server" CssClass="typeButton" OnClick="typered" Text="OK" />
        </div>

        <div id="studentSignUp" runat="server" visible="false">
            <center>
                <asp:Label ID="UsernameLabel" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="Username" CssClass="alltbs" runat="server"></asp:TextBox><br />
                <br />


                <asp:Label ID="PersonalInfoLabel" runat="server" CssClass="usertypeLabel" Text="Personal Info"></asp:Label><br />
                <br />

                <asp:Label ID="FNameLabel" runat="server" Text="Enter Your First Name"></asp:Label><br />
                <asp:TextBox ID="fname" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="MNameLabel" runat="server" Text="Enter Your Middle Name"></asp:Label><br />
                <asp:TextBox ID="mname" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="LNameLabel" runat="server" Text="Enter Your Last Name"></asp:Label><br />
                <asp:TextBox ID="lname" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="BirthdateLabel" runat="server" Text="Birthdate"></asp:Label><br />
                <asp:Calendar ID="birthDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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

                <asp:Button ID="prevyear" runat="server" CssClass="button" OnClick="prevYear" Text="Prev Year" />
                <asp:Button ID="nextyear" runat="server" CssClass="button" OnClick="nextYear" Text="Next Year" /><br />
                <br />

                <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label><br />
                <asp:TextBox ID="email" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="AddressLabel" runat="server" Text="Address"></asp:Label><br />
                <asp:TextBox ID="address" CssClass="alltbs" runat="server"></asp:TextBox><br />
                <br />


                <asp:Label ID="UniDetLabel" CssClass="usertypeLabel" runat="server" Text="University Details"></asp:Label><br />
                <br />


                <asp:Label ID="GIUIDLabel" runat="server" Text="GIU ID"></asp:Label><br />
                <asp:TextBox ID="GIUID" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="GPALabel" runat="server" Text="GPA"></asp:Label><br />
                <asp:TextBox ID="GPA" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="SemesterLabel" runat="server" Text="Semester"></asp:Label><br />
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
                </asp:DropDownList><br />

                <asp:Label ID="FacultyLabel" runat="server" Text="Faculty"></asp:Label><br />
                <asp:DropDownList ID="faculty" CssClass="alltbs" runat="server">
                    <asp:ListItem>Choose Your Faculty</asp:ListItem>
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Informatics & CS</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>

                </asp:DropDownList><br />

                <asp:Label ID="MajorLabel" runat="server" Text="Major"></asp:Label><br />
                <asp:TextBox ID="major" CssClass="alltbs" runat="server"></asp:TextBox><br />
                <asp:Button ID="signup" runat="server" CssClass="button" OnClick="SignUp" Text="Sign Up" /><br />
                <br />
        </div>

        <div id="employerProfile" runat="server" visible="false">
            <center>
                <asp:Label ID="UserNameEmpLabel" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="UserEmp" CssClass="alltbs" runat="server"></asp:TextBox><br />
                <br />

                <asp:Label ID="CompInfoLabel" runat="server" CssClass="usertypeLabel" Text="Company Information"></asp:Label><br />


                <asp:Label ID="EmailEmpLabel" runat="server" Text="Email"></asp:Label><br />
                <asp:TextBox ID="EmailEmp" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CompNameLabel" runat="server" Text="Company Name"></asp:Label><br />
                <asp:TextBox ID="CompName" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CompAddressLabel" runat="server" Text="Adress"></asp:Label><br />
                <asp:TextBox ID="CompAddress" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CompPhoneLabel" runat="server" Text="Phone Number"></asp:Label><br />
                <asp:TextBox ID="CompPhone" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CompFaxLabel" runat="server" Text="Fax"></asp:Label><br />
                <asp:TextBox ID="CompFax" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CompWebsiteLabel" runat="server" Text="Website"></asp:Label><br />
                <asp:TextBox ID="CompWebEmp" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="TypeOfBusiLabel" runat="server" Text="Type of Business"></asp:Label><br />
                <asp:DropDownList ID="TypeOfBusi" runat="server" CssClass="alltbs">
                    <asp:ListItem>Choose A Type</asp:ListItem>
                    <asp:ListItem>startup</asp:ListItem>
                    <asp:ListItem>company</asp:ListItem>
                    <asp:ListItem>government entity</asp:ListItem>
                </asp:DropDownList><br />

                <asp:Label ID="EstabYearLabel" runat="server" Text="Establishment Year"></asp:Label><br />
                <asp:Calendar ID="EstabYear" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
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

                <asp:Button ID="EstabYearPrev" runat="server" CssClass="button" OnClick="prevYearEmp" Text="Prev Year" />
                <asp:Button ID="EstabyearNext" runat="server" CssClass="button" OnClick="nextYearEmp" Text="Next Year" /><br />
                <br />

                <asp:Label ID="OriginCountryLabel" runat="server" Text="Origin Country"></asp:Label><br />
                <asp:TextBox ID="OriginCountry" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="IndustryLabel" runat="server" Text="Industry"></asp:Label><br />
                <asp:TextBox ID="Industry" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="CurrEmpsLabel" runat="server" Text="Current Employees"></asp:Label><br />
                <asp:TextBox ID="CurrNumEmps" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Label ID="ProOrServLabel" runat="server" Text="Products or Services"></asp:Label><br />
                <asp:TextBox ID="ProOrServ" runat="server" CssClass="alltbs"></asp:TextBox><br />

                <asp:Button ID="signupEmp" runat="server" CssClass="button" OnClick="EmpSignUp" Text="Sign Up" /><br />
        </div>

        <div id="OtherSignup" runat="server" visible="false">
            <center>
                <asp:DropDownList ID="otherUserType" CssClass="alltbs" runat="server">
                    <asp:ListItem>Choose Your type</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Academic Advisor</asp:ListItem>
                    <asp:ListItem>Career Office Coordinator</asp:ListItem>
                    <asp:ListItem>Faculty Representative</asp:ListItem>
                </asp:DropDownList><br />

                <asp:Label ID="UserNameOtherLabel" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="UserNameOther" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="EmailOtherLabel" runat="server" Text="Email"></asp:Label><br />
                <asp:TextBox ID="EmailOther" CssClass="alltbs" runat="server"></asp:TextBox><br />

                <asp:Label ID="AddFacLabel" runat="server" Text="Add Faculty If Applicable"></asp:Label><br />
                <asp:DropDownList ID="AddFacOther" CssClass="alltbs" runat="server">
                    <asp:ListItem>Choose Your Faculty</asp:ListItem>
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Informatics & CS</asp:ListItem>
                    <asp:ListItem>Business</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>
                </asp:DropDownList><br />

                <asp:Button ID="othSignUp" CssClass="button" runat="server" OnClick="SignUpOther" Text="Sign Up" />
        </div>
        <div id="Error" runat="server" visible="false"></div>
    </form>

</body>
</html>
