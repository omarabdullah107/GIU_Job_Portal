using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Giu_Job_Portal
{
    public partial class HomePage : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e) { }



        protected void showJobsMethod(object sender, EventArgs e)
        {
            searchNav.Visible = false;
            searchJ.Visible = false;
            jobShow.Visible = false;
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand Jobs = new SqlCommand("ShowJobs", conn);
            Jobs.CommandType = CommandType.StoredProcedure;
            conn.Open();

            SqlDataReader rdr = Jobs.ExecuteReader(CommandBehavior.CloseConnection);
            GridView jobs = new GridView();
            jobs.DataSource = rdr;
            jobs.DataBind();
            jobShow.Controls.Add(jobs);
            jobs.CssClass = "cssgridview";
            log.Visible = false;
            jobShow.Visible = true;
        }
        protected void showEmpsMethod(object sender, EventArgs e)
        {
            searchNav.Visible = false;
            searchJ.Visible = false;
            jobShow.Visible = false;
            log.Visible = false;
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand Emps = new SqlCommand("ShowEmployers", conn);
            Emps.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = Emps.ExecuteReader(CommandBehavior.CloseConnection);
            GridView Emp = new GridView();
            Emp.DataSource = rdr;
            Emp.DataBind();
            emps.Controls.Add(Emp);
            Emp.CssClass = "cssgridview";

            emps.Visible = true;

        }
        protected void loginRedirectMethod(object sender, EventArgs e)
        {
            searchJ.Visible = false;
            jobShow.Visible = false;
            emps.Visible = false;
            log.Visible = true;

        }

        protected void searchImgButton(object sender, EventArgs e)
        {
            searchNav.Visible = true;
            log.Visible = false;
        }

        protected void searchJobGV(object sender, EventArgs e)
        {
            emps.Visible = false;
            jobShow.Visible = false;
            log.Visible = false;
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand Sjobs = new SqlCommand("JobsSearch", conn);
            Sjobs.CommandType = CommandType.StoredProcedure;

            String searchFac = searchFaculty.Text;
            int searchSem;
            if (searchSemeter.Text != "Choose A Semester")
                searchSem = int.Parse(searchSemeter.Text);
            else
                searchSem = -1;


            Sjobs.Parameters.Add(new SqlParameter("@allowed_faculty", searchFac));
            Sjobs.Parameters.Add(new SqlParameter("@semester", searchSem));

            conn.Open();
            SqlDataReader rdr = Sjobs.ExecuteReader(CommandBehavior.CloseConnection);
            GridView search = new GridView();
            search.DataSource = rdr;
            search.DataBind();
            searchJ.Controls.Add(search);
            search.CssClass = "cssgridview";
            log.Visible = false;
            searchJ.Visible = true;
        }
        protected void loginM(Object sender, EventArgs e)

        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            Email.BorderColor = System.Drawing.Color.Green;
            passcode.BorderColor = System.Drawing.Color.Green;
            SqlConnection conn = new SqlConnection(connSTR);

            String email = Email.Text;
            String pass = passcode.Text;

            SqlCommand loginProc = new SqlCommand("UserLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;
            loginProc.Parameters.Add(new SqlParameter("@email", email));
            loginProc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            SqlCommand usertype = new SqlCommand("UserType", conn);
            usertype.CommandType = CommandType.StoredProcedure;
            usertype.Parameters.Add(new SqlParameter("@id", user_id.Value));

            SqlParameter user_type = usertype.Parameters.Add("@user_type", SqlDbType.VarChar, 50);

            user_type.Direction = ParameterDirection.Output;

            conn.Open();
            usertype.ExecuteNonQuery();
            conn.Close();

            loginSuccess.Visible = true;

            if (success.Value.ToString() == "1")
            {
                log.Visible = false;
                loginSuccess.Text = "Login Successful!";
                Session["IDs"] = user_id.Value;
                if (user_type.Value.Equals("Student"))
                    Response.Redirect("Student Profile.aspx");
                else if (user_type.Value.Equals("Employer"))
                    Response.Redirect("Employer.aspx");
                else if (user_type.Value.Equals("Academic Advisor"))
                    Response.Redirect("Academic Advisor.aspx");
                else if (user_type.Value.Equals("Career Office Coordinator"))
                    Response.Redirect("Career office coordinator.aspx");
                else if (user_type.Value.Equals("Admin"))
                    Response.Redirect("SignedInAdmin.aspx");
                else if (user_type.Value.Equals("Faculty Representative"))
                    Response.Redirect("signedInFacultyRepresentative.aspx");
            }

            else
            {
                loginSuccess.Text = "Invalid Data";
                Email.BorderColor = System.Drawing.Color.Red;
                passcode.BorderColor = System.Drawing.Color.Red;
            }


        }
        protected void registeredMethod(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");

        }

        protected void Contact_US(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");

        }

        protected void About_US(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");

        }
    }
}