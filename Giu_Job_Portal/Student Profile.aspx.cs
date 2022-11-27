using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Giu_Job_Portal
{
    public partial class Student_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            viewer2.Visible = false;
            int user_ID = int.Parse(Session["IDs"].ToString());
            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand viewPro = new SqlCommand("ViewProfile", conn);
            viewPro.Parameters.Add(new SqlParameter("@user_id", (int)user_ID));

            viewPro.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = viewPro.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("ID"));
                Label ID = new Label();
                ID.Text = "Student ID:\t" + id + "<br />";
                viewer2.Controls.Add(ID);

                String name = rdr.GetString(rdr.GetOrdinal("first_name")) + "\t" + rdr.GetString(rdr.GetOrdinal("middle_name"))
                + "\t" + rdr.GetString(rdr.GetOrdinal("last_name"));
                Label NAME = new Label();

                NAME.Text = name + "<br />";
                NAME.CssClass = "title";
                proView.Controls.Add(NAME);


                id = rdr.GetInt32(rdr.GetOrdinal("GIU_ID"));
                Label GIU_ID = new Label();
                GIU_ID.Text = "GIU_ID:\t" + id + "<br />";
                GIU_ID.CssClass = "web";
                proView.Controls.Add(GIU_ID);


                DateTime date = rdr.GetDateTime(rdr.GetOrdinal("birth_date"));
                Label DATE = new Label();
                DATE.Text = "Birth Date:\t" + date + "<br />";
                viewer2.Controls.Add(DATE);


                int sem = rdr.GetInt32(rdr.GetOrdinal("semester"));
                Label SEMESTER = new Label();
                SEMESTER.Text = "Semester:\t" + sem + "<br />";
                viewer2.Controls.Add(SEMESTER);


                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label FACULTY = new Label();
                FACULTY.Text = "Faculty:\t" + faculty + "<br />";
                FACULTY.CssClass = "phone";
                proView.Controls.Add(FACULTY);


                String major = rdr.GetString(rdr.GetOrdinal("major"));
                Label MAJOR = new Label();
                MAJOR.Text = "Major:\t" + major + "<br />";
                viewer2.Controls.Add(MAJOR);


                decimal gpa = rdr.GetDecimal(rdr.GetOrdinal("GPA"));
                Label GPA = new Label();
                GPA.Text = "Student GPA:\t" + gpa + "<br />";
                viewer2.Controls.Add(GPA);


                String address = rdr.GetString(rdr.GetOrdinal("adress"));
                Label ADDRESS = new Label();
                ADDRESS.Text = "Address:\t" + address + "<br />";
                viewer2.Controls.Add(ADDRESS);

            }
        }

        protected void editProVis(object sender, EventArgs e)
        {
            functionalities.Visible = false;
            proViewer.Visible = false;
            backToProfile.Visible = true;
            edit.Visible = true;
        }

        protected void editProConf(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);

            int id = int.Parse(Session["IDs"].ToString());
            String firstname = fname.Text;
            String Middlename = mname.Text;
            String Lastname = lname.Text;
            DateTime d = birth.SelectedDate;
            String mail = email.Text;
            int ID = Int32.Parse(GIUID.Text);
            Double gp = Double.Parse(GPA.Text);
            int sem = Int32.Parse(semester.Text);
            String fac = faculty.Text;
            String maj = major.Text;
            String add = address.Text;
            SqlCommand edit = new SqlCommand("StudentEditProfile", conn);
            edit.CommandType = CommandType.StoredProcedure;
            edit.Parameters.Add(new SqlParameter("@sid", id));
            edit.Parameters.Add(new SqlParameter("@email", mail));
            edit.Parameters.Add(new SqlParameter("@first_name", firstname));
            edit.Parameters.Add(new SqlParameter("@middle_name", Middlename));
            edit.Parameters.Add(new SqlParameter("@last_name", Lastname));
            edit.Parameters.Add(new SqlParameter("@birth_date", d));
            edit.Parameters.Add(new SqlParameter("@GIU_id", ID));
            edit.Parameters.Add(new SqlParameter("@gpa", gp));
            edit.Parameters.Add(new SqlParameter("@semester", sem));
            edit.Parameters.Add(new SqlParameter("@faculty ", fac));
            edit.Parameters.Add(new SqlParameter("@major", maj));
            edit.Parameters.Add(new SqlParameter("@adress", add));

            conn.Open();
            edit.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Student Profile.aspx");
        }

        protected void addPhonesButton(object sender, EventArgs e)
        {
            functionalities.Visible = false;
            proViewer.Visible = false;
            backToProfile.Visible = true;
            Addphonenum.Visible = true;

        }
        protected void addPhones(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);

            int id = int.Parse(Session["IDs"].ToString());
            String mob1 = phone1.Text;
            String mob2 = phone2.Text;
            String mob3 = phone3.Text;

            SqlCommand AddMobile = new SqlCommand("AddMobile", conn);
            AddMobile.CommandType = CommandType.StoredProcedure;

            SqlParameter MOB1 = new SqlParameter("@mobileNumber", mob1);
            AddMobile.Parameters.Add(MOB1);
            AddMobile.Parameters.Add(new SqlParameter("@sid", id));

            conn.Open();
            AddMobile.ExecuteNonQuery();
            conn.Close();

            SqlParameter MOB2 = new SqlParameter("@mobileNumber", mob2);

            if (mob2 != "")
            {
                AddMobile.Parameters.Remove(MOB1);
                AddMobile.Parameters.Add(MOB2);
                conn.Open();
                AddMobile.ExecuteNonQuery();
                conn.Close();
            }

            SqlParameter MOB3 = new SqlParameter("@mobileNumber", mob3);

            if (mob3 != "" && mob2 != "")
            {
                if (MOB3 != null)
                {
                    AddMobile.Parameters.Remove(MOB2);
                    AddMobile.Parameters.Add(MOB3);
                    conn.Open();
                    AddMobile.ExecuteNonQuery();
                    conn.Close();
                }
            }

            Response.Redirect("Student Profile.aspx");
        }
        protected void viewdets(object sender, EventArgs e)
        {
            viewer2.Visible = true;

        }

        protected void applyForJobButton(object sender, EventArgs e)
        {
            functionalities.Visible = false;
            proViewer.Visible = false;
            Addphonenum.Visible = false;
            backToProfile.Visible = true;

            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand ap = new SqlCommand("ShowJobsAll", conn);
            ap.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = ap.ExecuteReader();
            while (rdr.Read())
            {
                String jobName = rdr.GetString(rdr.GetOrdinal("Job Title"));
                int jobs = rdr.GetInt32(rdr.GetOrdinal("Job ID"));
                jobApply.Items.Add(jobs.ToString() + ". " + jobName);
            }

            apply.DataSource = null;
            apply.DataBind();
            conn.Close();

            jobsAndApplication.Visible = true;
        }

        protected void applyForJob(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            int user_ID = int.Parse(Session["IDs"].ToString());


            String jobN_ID = jobApply.Text;
            char[] separators = new char[] { ' ', '.' };
            String[] temp = jobN_ID.Split(separators, StringSplitOptions.RemoveEmptyEntries);
            int job = int.Parse(temp[0]);

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand apply = new SqlCommand("ApplyForJob", conn);
            apply.CommandType = CommandType.StoredProcedure;

            apply.Parameters.Add(new SqlParameter("@sid", user_ID));
            apply.Parameters.Add(new SqlParameter("@job_id", job));

            SqlParameter success = apply.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;

            conn.Open();
            apply.ExecuteNonQuery();
            conn.Close();

            if ((bool)success.Value)
            {
                String temp2 = "";
                for (int i = 1; i < temp.Length; i++)
                    temp2 += " " + temp[i];
                successfulApplication.Text = "You Have Applied Successfully to Job: " + job + " -" + temp2;
            }
            else
                successfulApplication.Text = "You Have NOT Applied Successfully to This Job. Please Try Again";
        }

        protected void viewMyStatusButton(object sender, EventArgs e)
        {
            functionalities.Visible = false;
            proViewer.Visible = false;
            myStatus.Visible = true;
            backToProfile.Visible = true;
        }

        protected void viewMyStatus(object sender, EventArgs e)
        {


            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            int user_ID = int.Parse(Session["IDs"].ToString());
            int job = int.Parse(jobID.Text);

            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand viewStatus = new SqlCommand("ViewMyStatus", conn);
            viewStatus.Parameters.Add(new SqlParameter("@sid", user_ID));
            viewStatus.Parameters.Add(new SqlParameter("@job_id", job));

            SqlParameter status = viewStatus.Parameters.Add("@application_status", SqlDbType.NVarChar, 50);

            status.Direction = ParameterDirection.Output;

            viewStatus.CommandType = CommandType.StoredProcedure;

            SqlCommand getJID = new SqlCommand("GetJobID", conn);
            getJID.Parameters.Add(new SqlParameter("@sid", user_ID));
            getJID.Parameters.Add(new SqlParameter("@job_id", job));

            SqlParameter jID = getJID.Parameters.Add("@job_id_out", SqlDbType.Bit);
            jID.Direction = ParameterDirection.Output;

            getJID.CommandType = CommandType.StoredProcedure;

            conn.Open();
            getJID.ExecuteNonQuery();
            viewStatus.ExecuteNonQuery();
            conn.Close();

            if ((bool)jID.Value)
            {
                if (status.Value.Equals("rejected") || status.Value.Equals("accepted"))
                {
                    if (status.Value.Equals("rejected"))
                        stat.Text = "You have been Rejected";
                    else
                        stat.Text = "You have been Accepted";

                }
                else
                    stat.Text = "Your Application is still Pending";
            }
            else
                stat.Text = "You Did Not Apply for This Job";
        }

        protected void progressReportButton(object sender, EventArgs e)
        {
            functionalities.Visible = false;
            proViewer.Visible = false;
            progressRep.Visible = true;
            backToProfile.Visible = true;
            currDate.Text = DateTime.Today.ToString("D");
        }

        protected void progressReport(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            int user_ID = int.Parse(Session["IDs"].ToString());
            string descrip = repDescription.Text;
            DateTime today = DateTime.Today;


            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand progress = new SqlCommand("AddProgressReport", conn);

            progress.Parameters.Add(new SqlParameter("@sid", user_ID));
            progress.Parameters.Add(new SqlParameter("@date", today));
            progress.Parameters.Add(new SqlParameter("@description", descrip));

            SqlParameter success = progress.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;

            progress.CommandType = CommandType.StoredProcedure;

            conn.Open();
            progress.ExecuteNonQuery();
            conn.Close();

            if ((bool)success.Value)
            {
                successful.Text = "Progress Report has been Saved Successfully for Date: " + today;
            }
            else
                successful.Text = "Progress Report has NOT been saved. Please Try Again";
        }

        protected void backToPro(object sender, EventArgs e)
        {
            Response.Redirect("Student Profile.aspx");
        }

        protected void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");

        }

        protected void delete(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connSTR);
            int user_ID = int.Parse(Session["IDs"].ToString());

            SqlCommand deete = new SqlCommand("DeleteProfile", conn);
            deete.CommandType = CommandType.StoredProcedure;
            deete.Parameters.Add(new SqlParameter("@user_id", user_ID));
            conn.Open();
            deete.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("HomePage.aspx");
        }

        protected void appdnextbirth(object sender, EventArgs e)
        {
            try
            {
                birth.VisibleDate = birth.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void appdprevbirth(object sender, EventArgs e)
        {
            try
            {
                birth.VisibleDate = birth.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
    }
}