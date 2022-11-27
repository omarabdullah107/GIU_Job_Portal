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
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          


        }
            
        protected void typered(object sender, EventArgs e)
        {
            try
            {

                if (DropDownList1.Text.Equals("Student"))
                {
                    studentSignUp.Visible = true;
                    usertype.Visible = false;
                }
                if (DropDownList1.Text.Equals("Employer"))
                {
                    employerProfile.Visible = true;
                    usertype.Visible = false;
                }
                if (DropDownList1.Text.Equals("Other"))
                {
                    OtherSignup.Visible = true;
                    usertype.Visible = false;
                }
            }
            catch (InvalidCastException)
            {
                DropDownList1.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
            catch (FormatException)
            {
                DropDownList1.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
            catch (SqlException)
            {
                DropDownList1.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
        }

        protected void SignUp(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();

                SqlConnection conn = new SqlConnection(connSTR);

                String uname = Username.Text;
                String firstname = fname.Text;
                String Middlename = mname.Text;
                String Lastname = lname.Text;
                DateTime d = birthDate.SelectedDate;
                String mail = email.Text;
                int ID = Int32.Parse(GIUID.Text);
                Double gp = Double.Parse(GPA.Text);
                int sem = Int32.Parse(semester.Text);
                String fac = faculty.Text;
                String maj = major.Text;
                String add = address.Text;
                String temp = "2/2/2009";
                SqlCommand reg = new SqlCommand("UserRegister", conn);
                reg.CommandType = CommandType.StoredProcedure;
                reg.Parameters.Add(new SqlParameter("@usertype", "Student"));
                reg.Parameters.Add(new SqlParameter("@email", mail));
                reg.Parameters.Add(new SqlParameter("@username", uname));
                reg.Parameters.Add(new SqlParameter("@first_name", firstname));
                reg.Parameters.Add(new SqlParameter("@middle_name", Middlename));
                reg.Parameters.Add(new SqlParameter("@last_name", Lastname));
                reg.Parameters.Add(new SqlParameter("@birth_date", d));
                reg.Parameters.Add(new SqlParameter("@GIU_id", ID));
                reg.Parameters.Add(new SqlParameter("@gpa", gp));
                reg.Parameters.Add(new SqlParameter("@semester", sem));
                reg.Parameters.Add(new SqlParameter("@faculty ", fac));
                reg.Parameters.Add(new SqlParameter("@major", maj));
                reg.Parameters.Add(new SqlParameter("@adress", add));
                reg.Parameters.Add(new SqlParameter("@company_name", "sf"));
                reg.Parameters.Add(new SqlParameter("@company_phone", "q"));
                reg.Parameters.Add(new SqlParameter("@fax", "23"));
                reg.Parameters.Add(new SqlParameter("@company_website", "23"));
                reg.Parameters.Add(new SqlParameter("@type_of_business", "23"));
                reg.Parameters.Add(new SqlParameter("@establishment_year ", temp));
                reg.Parameters.Add(new SqlParameter("@origin_country ", "er"));
                reg.Parameters.Add(new SqlParameter("@industry", "we"));
                reg.Parameters.Add(new SqlParameter("@n_current_employees", 100));
                reg.Parameters.Add(new SqlParameter("@products_services", "ef"));



                SqlParameter userid = reg.Parameters.Add("@userid", SqlDbType.Int);
                SqlParameter passcode = reg.Parameters.Add("@passcode", SqlDbType.VarChar, 20);

                userid.Direction = ParameterDirection.Output;
                passcode.Direction = ParameterDirection.Output;

                conn.Open();
                reg.ExecuteNonQuery();
                conn.Close();
                if (userid.Value.ToString() != null)
                {
                    Session["IDs"] = userid.Value;
                    Response.Redirect("Student Profile.aspx");


                }
            }
            catch (InvalidCastException)
            {
                Username.BorderColor = System.Drawing.Color.Red;
                fname.BorderColor = System.Drawing.Color.Red;
                mname.BorderColor = System.Drawing.Color.Red;
                lname.BorderColor = System.Drawing.Color.Red;
                birthDate.BorderColor = System.Drawing.Color.Red;
                email.BorderColor = System.Drawing.Color.Red;
                GIUID.BorderColor = System.Drawing.Color.Red;
                GPA.BorderColor = System.Drawing.Color.Red;
                semester.BorderColor = System.Drawing.Color.Red;
                faculty.BorderColor = System.Drawing.Color.Red;
                major.BorderColor = System.Drawing.Color.Red;
                address.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
            catch (FormatException)
            {
                Username.BorderColor = System.Drawing.Color.Red;
                fname.BorderColor = System.Drawing.Color.Red;
                mname.BorderColor = System.Drawing.Color.Red;
                lname.BorderColor = System.Drawing.Color.Red;
                birthDate.BorderColor = System.Drawing.Color.Red;
                email.BorderColor = System.Drawing.Color.Red;
                GIUID.BorderColor = System.Drawing.Color.Red;
                GPA.BorderColor = System.Drawing.Color.Red;
                semester.BorderColor = System.Drawing.Color.Red;
                faculty.BorderColor = System.Drawing.Color.Red;
                major.BorderColor = System.Drawing.Color.Red;
                address.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
            catch (SqlException)
            {
                Username.BorderColor = System.Drawing.Color.Red;
                fname.BorderColor = System.Drawing.Color.Red;
                mname.BorderColor = System.Drawing.Color.Red;
                lname.BorderColor = System.Drawing.Color.Red;
                birthDate.BorderColor = System.Drawing.Color.Red;
                email.BorderColor = System.Drawing.Color.Red;
                GIUID.BorderColor = System.Drawing.Color.Red;
                GPA.BorderColor = System.Drawing.Color.Red;
                semester.BorderColor = System.Drawing.Color.Red;
                faculty.BorderColor = System.Drawing.Color.Red;
                major.BorderColor = System.Drawing.Color.Red;
                address.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
        }

        protected void prevYear(object sender, EventArgs e)
        {
            try
            {
                birthDate.VisibleDate = birthDate.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void nextYear(object sender, EventArgs e)
        {
            try
            {
                birthDate.VisibleDate = birthDate.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }

        protected void EmpSignUp(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
                SqlConnection conn = new SqlConnection(connSTR);


                SqlCommand reg = new SqlCommand("UserRegister", conn);
                reg.CommandType = CommandType.StoredProcedure;
                reg.Parameters.Add(new SqlParameter("@usertype", "Employer"));
                reg.Parameters.Add(new SqlParameter("@email", EmailEmp.Text));
                reg.Parameters.Add(new SqlParameter("@username", UserEmp.Text));
                reg.Parameters.Add(new SqlParameter("@first_name", "sf"));
                reg.Parameters.Add(new SqlParameter("@middle_name", "sdg"));
                reg.Parameters.Add(new SqlParameter("@last_name", "df"));
                reg.Parameters.Add(new SqlParameter("@birth_date", "1/2/2009"));
                reg.Parameters.Add(new SqlParameter("@GIU_id", 12345));
                reg.Parameters.Add(new SqlParameter("@gpa", 1.2));
                reg.Parameters.Add(new SqlParameter("@semester", 3));
                reg.Parameters.Add(new SqlParameter("@faculty ", "df"));
                reg.Parameters.Add(new SqlParameter("@major", "dfm"));
                reg.Parameters.Add(new SqlParameter("@adress", CompAddress.Text));
                reg.Parameters.Add(new SqlParameter("@company_name", CompName.Text));
                reg.Parameters.Add(new SqlParameter("@company_phone", CompPhone.Text));
                reg.Parameters.Add(new SqlParameter("@fax", CompFax.Text));
                reg.Parameters.Add(new SqlParameter("@company_website", CompWebEmp.Text));
                reg.Parameters.Add(new SqlParameter("@type_of_business", TypeOfBusi.Text));
                reg.Parameters.Add(new SqlParameter("@establishment_year ", EstabYear.SelectedDate));
                reg.Parameters.Add(new SqlParameter("@origin_country ", OriginCountry.Text));
                reg.Parameters.Add(new SqlParameter("@industry", Industry.Text));
                reg.Parameters.Add(new SqlParameter("@n_current_employees", CurrNumEmps.Text));
                reg.Parameters.Add(new SqlParameter("@products_services", ProOrServ.Text));
                SqlParameter userid = reg.Parameters.Add("@userid", SqlDbType.Int);
                SqlParameter passcode = reg.Parameters.Add("@passcode", SqlDbType.VarChar, 20);

                userid.Direction = ParameterDirection.Output;
                passcode.Direction = ParameterDirection.Output;

                conn.Open();
                reg.ExecuteNonQuery();
                conn.Close();
                if (userid.Value.ToString() != null)
                {
                    Session["IDs"] = userid.Value;
                    Response.Redirect("Employer.aspx");
                }
            }
            catch (InvalidCastException)
            {
                CompAddress.BorderColor = System.Drawing.Color.Red;
                CompName.BorderColor = System.Drawing.Color.Red;
                CompPhone.BorderColor = System.Drawing.Color.Red;
                CompFax.BorderColor = System.Drawing.Color.Red;
                CompWebEmp.BorderColor = System.Drawing.Color.Red;
                TypeOfBusi.BorderColor = System.Drawing.Color.Red;
                EstabYear.BorderColor = System.Drawing.Color.Red;
                OriginCountry.BorderColor = System.Drawing.Color.Red;
                Industry.BorderColor = System.Drawing.Color.Red;
                CurrNumEmps.BorderColor = System.Drawing.Color.Red;
                ProOrServ.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
            catch (FormatException)
            {

                CompAddress.BorderColor = System.Drawing.Color.Red;
                CompName.BorderColor = System.Drawing.Color.Red;
                CompPhone.BorderColor = System.Drawing.Color.Red;
                CompFax.BorderColor = System.Drawing.Color.Red;
                CompWebEmp.BorderColor = System.Drawing.Color.Red;
                TypeOfBusi.BorderColor = System.Drawing.Color.Red;
                EstabYear.BorderColor = System.Drawing.Color.Red;
                OriginCountry.BorderColor = System.Drawing.Color.Red;
                Industry.BorderColor = System.Drawing.Color.Red;
                CurrNumEmps.BorderColor = System.Drawing.Color.Red;
                ProOrServ.BorderColor = System.Drawing.Color.Red;

                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
            catch (SqlException)
            {

                CompAddress.BorderColor = System.Drawing.Color.Red;
                CompName.BorderColor = System.Drawing.Color.Red;
                CompPhone.BorderColor = System.Drawing.Color.Red;
                CompFax.BorderColor = System.Drawing.Color.Red;
                CompWebEmp.BorderColor = System.Drawing.Color.Red;
                TypeOfBusi.BorderColor = System.Drawing.Color.Red;
                EstabYear.BorderColor = System.Drawing.Color.Red;
                OriginCountry.BorderColor = System.Drawing.Color.Red;
                Industry.BorderColor = System.Drawing.Color.Red;
                CurrNumEmps.BorderColor = System.Drawing.Color.Red;
                ProOrServ.BorderColor = System.Drawing.Color.Red;

                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
        }

        protected void prevYearEmp(object sender, EventArgs e)
        {
            try
            {
                EstabYear.VisibleDate = EstabYear.VisibleDate.AddYears(-1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }
        protected void nextYearEmp(object sender, EventArgs e)
        {
            try
            {
                EstabYear.VisibleDate = EstabYear.VisibleDate.AddYears(1);
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }

        protected void SignUpOther(object sender, EventArgs e)
        {
            try
            {
                string connSTR = WebConfigurationManager.ConnectionStrings["Giu_Job_Portal"].ToString();
                SqlConnection conn = new SqlConnection(connSTR);
                String s = "2/2/2009";


                SqlCommand reg = new SqlCommand("UserRegister", conn);
                reg.CommandType = CommandType.StoredProcedure;
                reg.Parameters.Add(new SqlParameter("@usertype", otherUserType.Text));
                reg.Parameters.Add(new SqlParameter("@email", EmailOther.Text));
                reg.Parameters.Add(new SqlParameter("@username", UserNameOther.Text));
                reg.Parameters.Add(new SqlParameter("@first_name", "sf"));
                reg.Parameters.Add(new SqlParameter("@middle_name", "sdg"));
                reg.Parameters.Add(new SqlParameter("@last_name", "df"));
                reg.Parameters.Add(new SqlParameter("@birth_date", "1/2/2009"));
                reg.Parameters.Add(new SqlParameter("@GIU_id", 12345));
                reg.Parameters.Add(new SqlParameter("@gpa", 1.2));
                reg.Parameters.Add(new SqlParameter("@semester", 3));
                reg.Parameters.Add(new SqlParameter("@faculty ", AddFacOther.Text));
                reg.Parameters.Add(new SqlParameter("@major", "dfm"));
                reg.Parameters.Add(new SqlParameter("@adress", "sdf"));
                reg.Parameters.Add(new SqlParameter("@company_name", "efef"));
                reg.Parameters.Add(new SqlParameter("@company_phone", "frwef"));
                reg.Parameters.Add(new SqlParameter("@fax", "egwefr"));
                reg.Parameters.Add(new SqlParameter("@company_website", "wgfwrf"));
                reg.Parameters.Add(new SqlParameter("@type_of_business", "wefwf"));
                reg.Parameters.Add(new SqlParameter("@establishment_year ", s));
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
                    if (otherUserType.Text.Equals("Admin"))
                    {
                        Session["IDs"] = userid.Value;
                        Response.Redirect("SignedInAdmin.aspx");
                    }
                    if (otherUserType.Text.Equals("Faculty Representative"))
                    {
                        Session["IDs"] = userid.Value;
                        Response.Redirect("signedInFacultyRepresentative.aspx");
                    }
                    if (otherUserType.Text.Equals("Career Office Coordinator"))
                    {
                        Session["IDs"] = userid.Value;
                        Response.Redirect("Career office coordinator.aspx");
                    }
                    if (otherUserType.Text.Equals("Academic Advisor"))
                    {
                        Session["IDs"] = userid.Value;
                        Response.Redirect("Academic Advisor.aspx");
                    }

                }
            }
            catch (InvalidCastException)
            {
                AddFacOther.BorderColor = System.Drawing.Color.Red;
                otherUserType.BorderColor = System.Drawing.Color.Red;
                EmailOther.BorderColor = System.Drawing.Color.Red;
                UserNameOther.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;
            }
            catch (FormatException)
            {
                AddFacOther.BorderColor = System.Drawing.Color.Red;
                otherUserType.BorderColor = System.Drawing.Color.Red;
                EmailOther.BorderColor = System.Drawing.Color.Red;
                UserNameOther.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
            catch (SqlException)
            {

                AddFacOther.BorderColor = System.Drawing.Color.Red;
                otherUserType.BorderColor = System.Drawing.Color.Red;
                EmailOther.BorderColor = System.Drawing.Color.Red;
                UserNameOther.BorderColor = System.Drawing.Color.Red;
                Error.InnerText = "You have Entered Invalid Or Insuffient Information Please Check Your Input ";
                Error.Visible = true;

            }
        }
    }
}