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
    public partial class signedInFacultyRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void Check(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand STAT = new SqlCommand("FRacrejII", conn);
            STAT.CommandType = CommandType.StoredProcedure;


            int IIID = Int32.Parse(IIIDDD.Text);
            int FRID = int.Parse(Session["IDs"].ToString());
            //int FRID = Int32.Parse(FRIDDD.Text);
            bool status = Boolean.Parse(STATUS.Text);


            STAT.CommandType = CommandType.StoredProcedure;
            STAT.Parameters.Add(new SqlParameter("@Industrial_internshipID", IIID));
            STAT.Parameters.Add(new SqlParameter("@facrepID", FRID));
            STAT.Parameters.Add(new SqlParameter("@status", status));



            conn.Open();
            STAT.ExecuteNonQuery();
            conn.Close();

        }

        protected void redtosubmit(object sender, EventArgs e)
        {

            FACREP.Visible = true;

        }

        protected void show(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["GIU_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand employers = new SqlCommand("showtable", conn);
            employers.CommandType = CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = employers.ExecuteReader(CommandBehavior.CloseConnection);


            GridView tables = new GridView();
            tables.DataSource = rdr;
            tables.DataBind();
            showtab.Controls.Add(tables);
            tables.CssClass = "cssgridview";

            showtab.Visible = true;
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