using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;

namespace EADPProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnReg_Click1(object sender, EventArgs e)
        {
            Smile u = new Smile();
            string usertype;

            if (u.GetSmileById(TBEmail.Text) != null)
            {
                LblMsg.Text = "This email is already asscociated with an account.";
                LblMsg.ForeColor = Color.Red;
            }
            else
            {
                if (CBUser.Checked == true)
                {
                    usertype = "User";
                }
                else if (CBPhotographer.Checked == true)
                {
                    usertype = "Photographer";
                }
                else
                {
                    usertype = "Organisation";
                }

                //pass into Smile obj
                u = new Smile(usertype, TBUsername.Text, TBFName.Text, TBLName.Text, TBEmail.Text, TBPass.Text);
                int result = u.AddSmile();
                if (result == 1)
                {
                    LblMsg.Text = "You have been successfully registered!";
                    LblMsg.ForeColor = Color.Green;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LblMsg.Text = "Error in adding record! Please contact an Admin!";
                    LblMsg.ForeColor = Color.Red;
                }
            }
        }
    }
}
