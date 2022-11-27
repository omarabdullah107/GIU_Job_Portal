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
    public partial class Other_Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SignUp(object sender, EventArgs e)
        {
            string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
            SqlConnection conn = new SqlConnection(connSTR);
            String s = "2/2/2009";


            SqlCommand reg = new SqlCommand("UserRegister", conn);
            reg.CommandType = CommandType.StoredProcedure;
            reg.Parameters.Add(new SqlParameter("@usertype",Type.Text ));
            reg.Parameters.Add(new SqlParameter("@email", email.Text));
            reg.Parameters.Add(new SqlParameter("@username", Username.Text));
            reg.Parameters.Add(new SqlParameter("@first_name", "sf"));
            reg.Parameters.Add(new SqlParameter("@middle_name", "sdg"));
            reg.Parameters.Add(new SqlParameter("@last_name", "df"));
            reg.Parameters.Add(new SqlParameter("@birth_date", "1/2/2009"));
            reg.Parameters.Add(new SqlParameter("@GIU_id", 12345));
            reg.Parameters.Add(new SqlParameter("@gpa", 1.2));
            reg.Parameters.Add(new SqlParameter("@semester", 3));
            reg.Parameters.Add(new SqlParameter("@faculty ", "df"));
            reg.Parameters.Add(new SqlParameter("@major", "dfm"));
            reg.Parameters.Add(new SqlParameter("@adress", "sdf"));
            reg.Parameters.Add(new SqlParameter("@company_name", "efef"));
            reg.Parameters.Add(new SqlParameter("@company_phone", "frwef"));
            reg.Parameters.Add(new SqlParameter("@fax", "egwefr"));
            reg.Parameters.Add(new SqlParameter("@company_website", "wgfwrf"));
            reg.Parameters.Add(new SqlParameter("@type_of_business", "wefwf"));
            reg.Parameters.Add(new SqlParameter("@establishment_year ",s));
            reg.Parameters.Add(new SqlParameter("@origin_country ", "asfd"));
            reg.Parameters.Add(new SqlParameter("@industry", "aefw"));
            reg.Parameters.Add(new SqlParameter("@n_current_employees", 100));
            reg.Parameters.Add(new SqlParameter("@products_services", "wef"));
            SqlParameter userid = reg.Parameters.Add("@userid", SqlDbType.Int);
            SqlParameter passcode = reg.Parameters.Add("@passcode", SqlDbType.VarChar, 20);

            userid.Direction = ParameterDirection.Output;
            passcode.Direction = ParameterDirection.Output;

            conn.Open();
            reg.ExecuteNonQuery();
            conn.Close();
            if (userid.Value.ToString() != null)
            {
                Response.Write("Welcome " + Username.Text + " To the GIU Job Portal " + " Your Passcode " + passcode);
                Response.Redirect("HomePage.aspx");
            }
        }
    }
} 