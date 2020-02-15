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
                if (ValidateInput())
                {
                    if (RBList.SelectedItem.Text == "User")
                    {
                        usertype = "User";
                    }
                    else if (RBList.SelectedItem.Text == "Photographer")
                    {
                        usertype = "Photographer";
                    }
                    else if (RBList.SelectedItem.Text == "Organisation")
                    {
                        usertype = "Organisation";
                    }
                    else
                    {
                        usertype = "Null";
                    }

                    //pass into Smile obj
                    u = new Smile(usertype, TBUsername.Text, TBFName.Text, TBLName.Text, TBEmail.Text, TBPass.Text, 0);
                    int result = u.AddSmile();
                    if (result == 1)
                    {
                        LblMsg.Text = "You have been successfully registered! Please Login";
                        LblMsg.ForeColor = Color.Green;
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
}
