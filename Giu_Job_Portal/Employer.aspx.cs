using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Giu_Job_Portal
{
    public partial class Employer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            jobdisp.Visible = false;
            viewer2.Visible = false;
            proViewer.Visible = true;
            Success.Visible = false;
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

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
                ID.Text = "ID:\t" + id + "<br />";

                viewer2.Controls.Add(ID);

                String comname = rdr.GetString(rdr.GetOrdinal("company_name"));
                Label com = new Label();
                com.Text = comname + "<br />";
                com.CssClass = "title";
                proView.Controls.Add(com);

                String ad = rdr.GetString(rdr.GetOrdinal("adress"));
                Label address = new Label();
                address.Text = "Address:\t" + ad + "<br />";
                viewer2.Controls.Add(address);

                String phone = rdr.GetString(rdr.GetOrdinal("phone_number"));
                Label phonenum = new Label();
                phonenum.Text = phone + "<br />";
                phonenum.CssClass = "phone";
                proView.Controls.Add(phonenum);

                String web = rdr.GetString(rdr.GetOrdinal("website"));
                Label webs = new Label();
                webs.Text = web + "<br />" + "<br />";
                webs.CssClass = "web";
                proView.Controls.Add(webs);

                String tob = rdr.GetString(rdr.GetOrdinal("type_of_business"));
                Label typob = new Label();
                typob.Text = "Type Of Business:\t" + tob + "<br />";
                viewer2.Controls.Add(typob);

                DateTime estye = rdr.GetDateTime(rdr.GetOrdinal("establishment_year"));
                Label estyear = new Label();
                estyear.Text = "Establishment year:\t" + estye + "<br />";
                viewer2.Controls.Add(estyear);

                String conorgin = rdr.GetString(rdr.GetOrdinal("country_of_origin"));
                Label co = new Label();
                co.Text = "Country of Origin:\t" + conorgin + "<br />";
                viewer2.Controls.Add(co);

                String ind = rdr.GetString(rdr.GetOrdinal("industry"));
                Label industry = new Label();
                industry.Text = "Industry:\t" + ind + "<br />";
                viewer2.Controls.Add(industry);

                int nofe = rdr.GetInt32(rdr.GetOrdinal("number_of_current_employees"));
                Label nofes = new Label();
                nofes.Text = "Current Emp Size:\t" + nofe + "<br />";
                viewer2.Controls.Add(nofes);

                String pos = rdr.GetString(rdr.GetOrdinal("products_or_services"));
                Label prodorser = new Label();
                prodorser.Text = "Product or Services:\t" + pos + "<br />";
                viewer2.Controls.Add(prodorser);

                Button11.Visible = true;
            }




            SqlConnection conn1 = new SqlConnection(connSTR);
            SqlCommand status = new SqlCommand("ViewProfileStatus", conn1);
            status.Parameters.Add(new SqlParameter("@emp_id", (int)user_ID));

            SqlParameter success = status.Parameters.Add("@status", SqlDbType.Bit);
            SqlParameter user_id = status.Parameters.Add("@reason", SqlDbType.VarChar, 20);
            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;
            status.CommandType = CommandType.StoredProcedure;
            conn1.Open();
            status.ExecuteNonQuery();
            conn1.Close();
            if (success.Value.ToString() == "True")
            {
                Button4.Visible = true;
                Button3.Visible = true;
                Button1.Visible = true;
            }
            else
            {
                Button4.Visible = false;
                Button3.Visible = false;
                Button1.Visible = false;
            }

        }

        protected void showjobs(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

            int user_ID = int.Parse(Session["IDs"].ToString());
            SqlConnection conn = new SqlConnection(connSTR);
            SqlCommand Jobs = new SqlCommand("EmpViewJobs", conn);
            Jobs.CommandType = CommandType.StoredProcedure;
            Jobs.Parameters.Add(new SqlParameter("@emp_id", (int)user_ID));
            conn.Open();

            SqlDataReader rdr = Jobs.ExecuteReader(CommandBehavior.CloseConnection);
            GridView jobs = new GridView();
            jobs.DataSource = rdr;
            jobs.DataBind();
            jobs.CssClass = "cssgridview";
            jobdisp.Controls.Add(jobs);
            jobdisp.Visible = true;
            edit.Visible = false;
            post.Visible = false;
            success1.Visible = false;
            Update.Visible = false;
        }
        protected void viewdets(object sender, EventArgs e)
        {
            viewer2.Visible = true;

        }


        protected void showPostJob(object sender, EventArgs e)
        {
            success1.Visible = false;
            home.Visible = true;
            post.Visible = true;
            proViewer.Visible = true;
            Update.Visible = false;
            edit.Visible = false;
        }
        protected void PostJob(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
                int user_ID = int.Parse(Session["IDs"].ToString());
                SqlConnection conn = new SqlConnection(connSTR);
                SqlCommand Job = new SqlCommand("PostJob", conn);
                Job.CommandType = CommandType.StoredProcedure;
                Job.Parameters.Add(new SqlParameter("@emp_id", (int)user_ID));
                Job.Parameters.Add(new SqlParameter("@title", Title.Text));
                Job.Parameters.Add(new SqlParameter("@description", Descript.Text));
                Job.Parameters.Add(new SqlParameter("@Department", Department.Text));
                Job.Parameters.Add(new SqlParameter("@start_date", Startd.SelectedDate));
                Job.Parameters.Add(new SqlParameter("@end_date", endd.SelectedDate));
                Job.Parameters.Add(new SqlParameter("@application_deadline", appd.SelectedDate));
                Job.Parameters.Add(new SqlParameter("@n_available_internships", Int32.Parse(nospots.Text)));
                Job.Parameters.Add(new SqlParameter("@salary_range ", SalaryRange.Text));
                Job.Parameters.Add(new SqlParameter("@qualifications ", Qualifications.Text));
                Job.Parameters.Add(new SqlParameter("@location", Location.Text));
                Job.Parameters.Add(new SqlParameter("@application_email", AppEmail.Text));
                Job.Parameters.Add(new SqlParameter("@application_link", Applink.Text));
                Job.Parameters.Add(new SqlParameter("@job_type", JobType.Text));
                if(JobType.Text.Equals("Part Time"))
                    Job.Parameters.Add(new SqlParameter("@workdays", Int32.Parse(Workdays.Text)));
                else
                    Job.Parameters.Add(new SqlParameter("@workdays", -1));
                SqlParameter jobid = Job.Parameters.Add("@job_id", SqlDbType.Int);
                jobid.Direction = ParameterDirection.Output;

                conn.Open();
                Job.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Employer.aspx");
            }
            catch (InvalidCastException)
            {


                nospots.BorderColor = System.Drawing.Color.Red;
                Workdays.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;
            }
            catch (FormatException)
            {



                nospots.BorderColor = System.Drawing.Color.Red;
                Workdays.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;
            }
            catch (SqlException)
            {



                nospots.BorderColor = System.Drawing.Color.Red;
                Workdays.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;
            }



        }

        protected void showedit(object sender, EventArgs e)
        {
            edit.Visible = true;
            proViewer.Visible = true;
            post.Visible = false;
            success1.Visible = false;
            students.Visible = false;
            Update.Visible = false;
        }
        protected void Savechange(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
                int user_ID = int.Parse(Session["IDs"].ToString());
                SqlConnection conn = new SqlConnection(connSTR);
                SqlCommand Job = new SqlCommand("EmpEditProfile", conn);
                Job.CommandType = CommandType.StoredProcedure;
                Job.Parameters.Add(new SqlParameter("@id", user_ID));
                Job.Parameters.Add(new SqlParameter("@password", Password.Text));
                Job.Parameters.Add(new SqlParameter("@adress", Address.Text));
                Job.Parameters.Add(new SqlParameter("@company_name", Comname.Text));
                Job.Parameters.Add(new SqlParameter("@company_phone", Comphone.Text));
                Job.Parameters.Add(new SqlParameter("@fax", fax.Text));
                Job.Parameters.Add(new SqlParameter("@company_website", comweb.Text));
                Job.Parameters.Add(new SqlParameter("@type_of_business", typeofbusi.Text));
                Job.Parameters.Add(new SqlParameter("@establishment_year", Calendar1.SelectedDate));
                Job.Parameters.Add(new SqlParameter("@origin_country", country.Text));
                Job.Parameters.Add(new SqlParameter("@industry", industry.Text));
                Job.Parameters.Add(new SqlParameter("@n_current_employees", Int32.Parse(nofemployees.Text)));
                Job.Parameters.Add(new SqlParameter("@products_services", productorservices.Text));

                conn.Open();
                Job.ExecuteNonQuery();
                conn.Close();
                success1.InnerText = "Changes Susessful";
                success1.Visible = true;

                Response.Redirect("Employer.aspx");
            }
            catch (InvalidCastException)
            {


                Comphone.BorderColor = System.Drawing.Color.Red;
                fax.BorderColor = System.Drawing.Color.Red;


                Calendar1.BorderColor = System.Drawing.Color.Red;


                nofemployees.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;
            }
            catch (FormatException)
            {
                Comphone.BorderColor = System.Drawing.Color.Red;
                fax.BorderColor = System.Drawing.Color.Red;


                Calendar1.BorderColor = System.Drawing.Color.Red;
                nofemployees.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;

            }
            catch (SqlException)
            {
                Comphone.BorderColor = System.Drawing.Color.Red;
                fax.BorderColor = System.Drawing.Color.Red;


                Calendar1.BorderColor = System.Drawing.Color.Red;
                nofemployees.BorderColor = System.Drawing.Color.Red;

                success1.InnerText = "You have entered invalid info";
                success1.Visible = true;
            }

        }
        protected void prevyear(object sender, EventArgs e)
        {
            try
            {
                Calendar1.VisibleDate = Calendar1.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void startdprev(object sender, EventArgs e)
        {
            try
            {
                Startd.VisibleDate = Startd.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void startdnext(object sender, EventArgs e)
        {
            try
            {
                Startd.VisibleDate = Startd.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }

        protected void enddprev(object sender, EventArgs e)
        {
            try
            {
                endd.VisibleDate = endd.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void enddnext(object sender, EventArgs e)
        {
            try
            {
                endd.VisibleDate = endd.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void appdprev(object sender, EventArgs e)
        {
            try
            {
                appd.VisibleDate = appd.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void appdnext(object sender, EventArgs e)
        {
            try
            {
                appd.VisibleDate = appd.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void nextyear(object sender, EventArgs e)
        {
            Calendar1.VisibleDate = Calendar1.VisibleDate.AddYears(1);
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
            success1.Visible = false;
        }

        protected void seestudents(object sender, EventArgs e)
        {

            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connSTR);
            int user_ID = int.Parse(Session["IDs"].ToString());
            conn.Open();

            SqlCommand show = new SqlCommand("EmpViewJobs", conn);
            show.CommandType = CommandType.StoredProcedure;
            show.Parameters.Add(new SqlParameter("@emp_id", user_ID));
            show.ExecuteNonQuery();
            SqlDataReader rdr = show.ExecuteReader(CommandBehavior.CloseConnection);
            ArrayList arr = new ArrayList();
            ArrayList arrInfo = new ArrayList();
            success1.Visible = false;

            while (rdr.Read())
            {
                String s = "" + rdr.GetInt32(rdr.GetOrdinal("ID"));
                arr.Add(rdr.GetInt32(rdr.GetOrdinal("ID")));
                arrInfo.Add("Job ID:      " + rdr.GetInt32(rdr.GetOrdinal("ID")) + " " + "     Job Title:     " + rdr.GetString(rdr.GetOrdinal("title")));
                Jobs.Items.Add(s);

            }
            conn.Close();
            SqlConnection conn1 = new SqlConnection(connSTR);

            for (int i = 0; i < arr.Count; i++)
            {
                conn1.Open();
                SqlCommand student = new SqlCommand("EmpViewApplicants", conn1);

                student.CommandType = CommandType.StoredProcedure;
                student.Parameters.Add(new SqlParameter("@emp_id", user_ID));
                student.Parameters.Add(new SqlParameter("@job_id", (int)arr[i]));
                student.ExecuteNonQuery();
                Label inf = new Label();
                inf.Text = arrInfo[i].ToString();
                SqlDataReader rdr1 = student.ExecuteReader(CommandBehavior.CloseConnection);

                GridView jobs = new GridView();
                jobs.DataSource = rdr1;
                jobs.DataBind();
                jobs.CssClass = "cssgridview";
                students.Controls.Add(inf);
                students.Controls.Add(jobs);
            }
            conn1.Close();

            students.Visible = true;
            Update.Visible = true;
            post.Visible = false;
            edit.Visible = false;


        }
        protected void viewstats(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            int user_ID = int.Parse(Session["IDs"].ToString());
            SqlConnection conn1 = new SqlConnection(connSTR);
            SqlCommand status = new SqlCommand("ViewProfileStatus", conn1);
            status.Parameters.Add(new SqlParameter("@emp_id", (int)user_ID));

            SqlParameter success = status.Parameters.Add("@status", SqlDbType.Bit);
            SqlParameter reason = status.Parameters.Add("@reason", SqlDbType.VarChar, 100);
            success.Direction = ParameterDirection.Output;
            reason.Direction = ParameterDirection.Output;
            status.CommandType = CommandType.StoredProcedure;
            conn1.Open();
            status.ExecuteNonQuery();
            conn1.Close();
            Label t1 = new Label();
            if (success.Value.ToString().Equals("True"))
            {
                t1.Text = "You Are An Accepted Employer" + "<br />";

            }
            else if (reason.Value.ToString() != "")
            {
                t1.Text = "Sorry You Are Rejected " + "<br />";
                Label t2 = new Label();
                t2.Text = reason.Value.ToString() + "<br />";
                Views.Controls.Add(t2);
            }
            else
            {
                t1.Text = "Your Status has not yet been determined" + "<br />";
            }
            

            Views.Controls.Add(t1);
            success1.Visible = false;
            edit.Visible = false;
            post.Visible = false;
            students.Visible = false;
            Update.Visible = false;


        }
        protected void updatestat(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
                int user_ID = int.Parse(Session["IDs"].ToString());
                SqlConnection conn1 = new SqlConnection(connSTR);
                SqlCommand up = new SqlCommand("EmpUpdateApplicant", conn1);
                int t = Int32.Parse(Jobs.Text);
                up.Parameters.Add(new SqlParameter("@job_id", t));
                up.Parameters.Add(new SqlParameter("@student_id", studentid.Text));
                up.Parameters.Add(new SqlParameter("@application_status", statstudent.Text));
                up.CommandType = CommandType.StoredProcedure;
                conn1.Open();
                up.ExecuteNonQuery();
                conn1.Close();

                Response.Redirect("Employer.aspx");
                success1.Visible = false;
            }
            catch (InvalidCastException)
            {

                studentid.BorderColor = System.Drawing.Color.Red;
                statstudent.BorderColor = System.Drawing.Color.Red;

            }
            catch (FormatException)
            {

                studentid.BorderColor = System.Drawing.Color.Red;
                statstudent.BorderColor = System.Drawing.Color.Red;


            }
            catch (SqlException)
            {

                studentid.BorderColor = System.Drawing.Color.Red;
                statstudent.BorderColor = System.Drawing.Color.Red;


            }
        }
        protected void GoHome(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");

        }


    }
}