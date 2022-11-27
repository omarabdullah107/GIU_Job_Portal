using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Giu_Job_Portal
{
    public partial class Academic_Advisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand view = new SqlCommand("ViewProgressReports", conn);
            int ADID = Int32.Parse(advisorid.Text);
            SqlCommand VIEWproc = new SqlCommand("ViewProgressReports", conn);
            VIEWproc.Parameters.Add(new SqlParameter("@advisor_id", ADID));
            VIEWproc.CommandType = CommandType.StoredProcedure;
            conn.Open();
            VIEWproc.ExecuteNonQuery();
            SqlDataReader rdr = VIEWproc.ExecuteReader(CommandBehavior.CloseConnection);
            GridView Emp = new GridView();
            Emp.DataSource = rdr;
            Emp.DataBind();
            yaya.Controls.Add(Emp);
            conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UPDATEproc = new SqlCommand("EvalProgressReport", conn);
            UPDATEproc.CommandType = CommandType.StoredProcedure;
            int STID = Int16.Parse(StudentId.Text);
            String DATE = date.Text;
            int NUM = Int16.Parse(num.Text);
            String EVA = eva.Text;
            UPDATEproc.Parameters.Add(new SqlParameter("@sid", STID));
            UPDATEproc.Parameters.Add(new SqlParameter("@date", DATE));
            UPDATEproc.Parameters.Add(new SqlParameter("@numeric_state", NUM));
            UPDATEproc.Parameters.Add(new SqlParameter("@evaluation", EVA));
            conn.Open();
            UPDATEproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand DELETEproc = new SqlCommand("DeleteProfile", conn);
            DELETEproc.CommandType = CommandType.StoredProcedure;
            int USID = Int16.Parse(User_id.Text);
            DELETEproc.Parameters.Add(new SqlParameter("@user_id", USID));
            conn.Open();
            DELETEproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}