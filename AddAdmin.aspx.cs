using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using EADPProject.BLL;


namespace EADPProject
{
    public partial class AddAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ValidateInput()
        {
            bool result;
            LblMsg.Text = String.Empty;

            if (TBUsername.Text == "")
            {
                LblMsg.Text = "Username is required!";
                LblMsg.ForeColor = Color.Red;
            }


            if (TBFName.Text == "")
            {
                LblMsg.Text = "First Name is required!";
                LblMsg.ForeColor = Color.Red;
            }


            if (TBLName.Text == "")
            {
                LblMsg.Text = "Last Name is required!";
                LblMsg.ForeColor = Color.Red;
            }

            if (TBLName.Text == "")
            {
                LblMsg.Text = "Last Name is required!";
                LblMsg.ForeColor = Color.Red;
            }

            if (String.IsNullOrEmpty(TBEmail.Text))
            {
                LblMsg.Text = "Email is required!";
                LblMsg.ForeColor = Color.Red;
            }

            if (TBPass.Text == "")
            {
                LblMsg.Text = "Please enter Password";
                LblMsg.ForeColor = Color.Red;
            }

            if (TBCfmPass.Text != TBPass.Text)
            {
                LblMsg.Text = "Passwords do not match!";
                LblMsg.ForeColor = Color.Red;
            }

            if (String.IsNullOrEmpty(LblMsg.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void BtnAdmReg_Click(object sender, EventArgs e)
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
                if (ValidateInput())
                {
                    usertype = "Admin";
                    u = new Smile(usertype, TBUsername.Text, TBFName.Text, TBLName.Text, TBEmail.Text, TBPass.Text, 0);
                    int result = u.AddSmile();
                    if (result == 1)
                    {
                        LblMsg.Text = "Admin has been successfully registered!";
                        LblMsg.ForeColor = Color.Green;
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        LblMsg.Text = "Error in adding record!";
                        LblMsg.ForeColor = Color.Red;
                    }
                }


            }
        }
    }
}