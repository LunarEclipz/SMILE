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
using EADPProject.DAL;
using System.Drawing;


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
            SmileDAO sdao = new SmileDAO();
            email = TBEmail.Text.ToString().Trim();
            pass = TBPass.Text.ToString().Trim();
            SHA512Managed hashing = new SHA512Managed();
            string dbHash = sdao.getDBHash(email);
            string dbSalt = sdao.getDBSalt(email);

            if (sdao.SelectById(email) == null)
            {
                LblMsg.Text = "This email has not been registered.";
                LblMsg.ForeColor = Color.Red;
            }

            else if (sdao.SelectById(email).DeleteStatus == 0)
            {
                try
                {
                    if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                    {
                        string pwdWithSalt = dbSalt + pass + dbSalt;
                        byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                        string userHash = Convert.ToBase64String(hashWithSalt);

                        if (userHash.Equals(dbHash))
                        {
                            if (sdao.getusertype(email) == "Admin")
                            {
                                Session["Admin"] = email;
                                Session["type"] = sdao.getusertype(email);
                                Response.Redirect("AdminHome.aspx", false);
                            }
                            else
                            {
                                Session["StudNo"] = email;
                                Session["type"] = sdao.getusertype(email);
                                Session["username"] = sdao.getusername(email);
                                Session["fname"] = sdao.getfname(email);
                                Session["lname"] = sdao.getlname(email);
                                Session["email"] = email;

                                Response.Redirect("LandingPage.aspx", false);
                            }
                        }
                        else
                        {
                            LblMsg.Text = "Invalid email/password";
                            LblMsg.ForeColor = Color.Red;
                        }
                    }
                }
                catch (Exception)
                {
                    LblMsg.Text = "Error! Please contact an Admin";
                    LblMsg.ForeColor = Color.Red;
                }
            }
            else
            {
                LblMsg.Text = "This email has not been registered.";
                LblMsg.ForeColor = Color.Red;
            }
        }
    }
}
