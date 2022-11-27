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
    public partial class Career_office_coordinator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand view = new SqlCommand("ViewAdvisors", conn);
            conn.Open();
            view.ExecuteNonQuery();
            view.CommandType = CommandType.StoredProcedure;
            SqlDataReader rdr = view.ExecuteReader(CommandBehavior.CloseConnection);
            GridView Emp = new GridView();
            Emp.DataSource = rdr;
            Emp.DataBind();
            soso.Controls.Add(Emp);
            conn.Close();
        }

        protected void ADD(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int ITID = Int16.Parse(IndustrialID.Text);
            int AID = Int16.Parse(AcademicID.Text);
            SqlCommand ADDproc = new SqlCommand("AAToII", conn);
            ADDproc.Parameters.Add(new SqlParameter("@ii_id", ITID));
            ADDproc.Parameters.Add(new SqlParameter("@aa_id", AID));
            ADDproc.CommandType = CommandType.StoredProcedure;
            conn.Open();
            ADDproc.ExecuteNonQuery();
            conn.Close();

        }
        protected void studentinfo(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand view = new SqlCommand("CocViewStudents", conn);
            int ITID = Int16.Parse(Student.Text);
            view.Parameters.Add(new SqlParameter("@ii_id", ITID));
            view.CommandType = CommandType.StoredProcedure;
            conn.Open();
            view.ExecuteNonQuery();
            SqlDataReader rdr = view.ExecuteReader(CommandBehavior.CloseConnection);
            GridView Emp = new GridView();
            Emp.DataSource = rdr;
            Emp.DataBind();
            soso.Controls.Add(Emp);
            conn.Close();


        }
        protected void Elgiblety(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Giu_job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UPDATEproc = new SqlCommand("CocUpdateEligibility", conn);
            UPDATEproc.CommandType = CommandType.StoredProcedure;
            int user_id = Int16.Parse(Session["IDs"].ToString());
            int Studentid = Int16.Parse(Student_id.Text);
            int internshipid = Int16.Parse(interinship_id.Text);
            //bool elgible = bool.Parse(Elgibl.Text);//
            UPDATEproc.Parameters.Add(new SqlParameter("@s_id", Studentid));
            UPDATEproc.Parameters.Add(new SqlParameter("@ii_id", internshipid));
            UPDATEproc.Parameters.Add(new SqlParameter("@eligibility", Int32.Parse(elgible.Text)));
            UPDATEproc.Parameters.Add(new SqlParameter("@coc_id", user_id));
            conn.Open();
            UPDATEproc.ExecuteNonQuery();
            conn.Close();

        }

        protected void Button4_Click(object sender, EventArgs e)
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