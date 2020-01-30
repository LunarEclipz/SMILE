using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EADPProject
{
    public partial class Login : System.Web.UI.Page
    {
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        byte[] Key;
        byte[] IV;
        string email;
        string pass;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();

                if (Request.Cookies["ASP.NET_SessionId"] != null)
                {
                    Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                    Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
                }

                if (Request.Cookies["AuthToken"] != null)
                {
                    Response.Cookies["AuthToken"].Value = string.Empty;
                    Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
                }
            }
        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            email = TBEmail.Text.ToString().Trim();
            pass = TBPass.Text.ToString().Trim();
            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(email);
            string dbSalt = getDBSalt(email);

            try
            {
                if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                {
                    string pwdWithSalt = dbSalt + pass + dbSalt;
                    byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                    string userHash = Convert.ToBase64String(hashWithSalt);

                    if (userHash.Equals(dbHash))
                    {
                        if (getusertype(email) == "Admin")
                        {
                            Session["Admin"] = email;
                            Session["type"] = getusertype(email);
                            Response.Redirect("AdminHome.aspx", false);
                        }
                        else
                        {
                            Session["StudNo"] = email;
                            Session["type"] = getusertype(email);

                            Response.Redirect("UserHome.aspx", false);
                        }
                    }
                    else
                    {
                        LblMsg.Text = "For First Time Log in please type in the given password";
                    }
                }
            }
            catch (Exception except)
            {
                LblMsg.Text = "Error!";
            }
        }

        protected string getDBSalt(string email)
        {
            string s = null;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sql = "select Salt FROM SmileUser WHERE Email=@Email";
            SqlCommand command = new SqlCommand(sql, myConn);
            command.Parameters.AddWithValue("@Email", email);
            try
            {
                myConn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["Salt"] != null)
                        {
                            if (reader["Salt"] != DBNull.Value)
                            {
                                s = reader["Salt"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { myConn.Close(); }
            return s;
        }//getdbsalt

        protected string getDBHash(string email)
        {
            string h = null;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sql = "select PasswordHash FROM SmileUser WHERE Email=@Email";
            SqlCommand command = new SqlCommand(sql, myConn);
            command.Parameters.AddWithValue("@Email", email);
            try
            {
                myConn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        if (reader["PasswordHash"] != null)
                        {
                            if (reader["PasswordHash"] != DBNull.Value)
                            {
                                h = reader["PasswordHash"].ToString();
                            }
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { myConn.Close(); }
            return h;
        }//getdbhash

        protected string getusertype(string email)
        {
            string s = null;

            SqlConnection conn = new SqlConnection(DBConnect);
            string sql = "Select usertype from SmileUser where Email=@Email";
            SqlCommand command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@Email", email);
            try
            {
                conn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["usertype"] != null)
                        {
                            if (reader["usertype"] != DBNull.Value)
                            {
                                s = reader["usertype"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                conn.Close();
            }

            return s;
        }
    }
}