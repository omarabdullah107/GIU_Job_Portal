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
    public partial class SignedInAdmin : System.Web.UI.Page
    {


        // fix the loading of processes and the error of sequential processing.
        // connect the page with the log in page.
        // 
        protected void Page_Load(object sender, EventArgs e)
        {
            // Response.Write("Welcome To The Admin Page" + "\n");
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // Showing list of employers in the system.
        // Need to  implement good css code and make spaces between the name of emlpyers or putting them vertically.
        // working functionality.
        protected void ShowEmp(object sender, EventArgs e)
        {

            // creating connection with DB 

            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand employers = new SqlCommand("AdminViewEmps", conn);
            employers.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = employers.ExecuteReader(CommandBehavior.CloseConnection);
            GridView Employers = new GridView();
            Employers.DataSource = rdr;
            Employers.DataBind();
            employer.Controls.Add(Employers);
            Employers.CssClass = "cssgridview";

            employer.Visible = true;

            /* while (rdr.Read())
             {

                 string employersname = rdr.GetString(rdr.GetOrdinal("company_name"));
                 Label name = new Label();
                 name.Text = employersname + "\n" +"<br/>";
                 form1.Controls.Add(name);


             }*/




        }


        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // Updating the profile status of an employer.
        // fixing the view plus putting them vertically.
        /* the admin will update the profile status of the employer by inserting the id of the employer
         * and the profile status of the the employer and it should be saved .
        */
        protected void updred(object sender, EventArgs e)
        {

            FR.Visible = false;
            employer.Visible = false;
            updatee.Visible = true;

        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // fixing the view and show the jobs vertically.
        // working functionality.
        protected void ShowAllJobs(object sender, EventArgs e)
        {

            // creating connection with the DB.

            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand jobs = new SqlCommand("AdminViewJobs", conn);
            jobs.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = jobs.ExecuteReader(CommandBehavior.CloseConnection);
            GridView jobsss = new GridView();
            jobsss.DataSource = rdr;
            jobsss.DataBind();
            jobss.Controls.Add(jobsss);
            jobsss.CssClass = "cssgridview";

            jobss.Visible = true;


            //ListView listView = new ListView();
            /* while (rdr.Read())
             {

                 string jobsname = rdr.GetString(rdr.GetOrdinal("title"));
                 Label name = new Label();
                 name.Text = jobsname + "\n" + "<br/>";
                 form1.Controls.Add(name);



             }*/

            //conn.Close();



        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        /* show the representative of each faculty from user table get the username and match the ids from user table with 
         * the facutly representative id if it can happen (figure out)
         */
        protected void ShowFacRep(object sender, EventArgs e)
        {
            // creating connection with the DB.

            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand fr = new SqlCommand("AdminShowFacRep", conn);
            fr.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = fr.ExecuteReader(CommandBehavior.CloseConnection);
            GridView FRR = new GridView();
            FRR.DataSource = rdr;
            FRR.DataBind();
            FR.Controls.Add(FRR);
            FRR.CssClass = "cssgridview";

            FR.Visible = true;

            /*while (rdr.Read())
            {
                //string frid = rdr.GetString(rdr.GetOrdinal("ID"));
                string frname = rdr.GetString(rdr.GetOrdinal("username"));
                string fac = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label name = new Label();
                name.Text = frname + "\n" + "- " + fac  + "<br/>";
                form1.Controls.Add(name);


            }*/

            //conn.Close();




        }

        protected void UpEMPstat(object sender, EventArgs e)
        {
            // creating connection with DB

            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);


            int empid = Int32.Parse(Empid.Text);
            int adminid = int.Parse(Session["IDs"].ToString());
            //int iDs = int.Parse(Session["@admin_id"].ToString());
            //int adminid = Int32.Parse(adminidd.Text);
            bool status = Boolean.Parse(statuss.Text);
            string reason = reasonn.Text;
            SqlCommand stat = new SqlCommand("AdminReviewEmp", conn);
            stat.CommandType = CommandType.StoredProcedure;
            stat.Parameters.Add(new SqlParameter("@emp_id", empid));
            stat.Parameters.Add(new SqlParameter("@admin_id", adminid));
            stat.Parameters.Add(new SqlParameter("@profile_status", status));
            stat.Parameters.Add(new SqlParameter("@reason", reason));


            conn.Open();
            stat.ExecuteNonQuery();
            conn.Close();

        }

        protected void DELETE(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connSTR);
            int user_ID = int.Parse(Session["IDs"].ToString());

            SqlCommand delete = new SqlCommand("DeleteProfile", conn);
            delete.CommandType = CommandType.StoredProcedure;
            delete.Parameters.Add(new SqlParameter("@user_id", user_ID));
            conn.Open();
            delete.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("HomePage.aspx");

        }
    }
}