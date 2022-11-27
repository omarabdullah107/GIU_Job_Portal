<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Other Sign Up.aspx.cs" Inherits="Giu_Job_Portal.Other_Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="Type" runat="server">
                <asp:ListItem>Choose Your type</asp:ListItem>
                  <asp:ListItem>Admin</asp:ListItem>
                 <asp:ListItem>Accademic Advisor</asp:ListItem>
                <asp:ListItem>Career Office Coordinator</asp:ListItem>
                <asp:ListItem>Faculty Representative</asp:ListItem>
                 

            </asp:DropDownList>
            <br />
            Username:<br />
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
            <br />
            Email:<br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            Add Faculty If Applicable:<br />
            <asp:TextBox ID="Faculty" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" Onclick ="SignUp"  runat="server" Text="Sign Up" />
        </div>
    </form>
</body>
</html>
