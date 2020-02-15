using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;
using EADPProject.DAL;

namespace EADPProject
{
    public partial class Profile : System.Web.UI.Page
    {
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            SmileDAO sdao = new SmileDAO();
            email = Session["StudNo"].ToString();
            string us = sdao.getusername(email);
            string f = sdao.getfname(email);
            string l = sdao.getlname(email);
            if (Session["StudNo"] != null)
            {
                LblUsername.Text = us;
                LblFName.Text = f;
                LblLName.Text = l;
                LblEmail.Text = Session["email"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }


        protected void BtnChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ChangePass.aspx");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string email = Session["StudNo"].ToString();
            Smile u = new Smile();
            int result = u.DeleteUser(email, 1);
            if (result == 1)
            {
                LblMsg.Text = "User has been deleted.";
                Response.Redirect("Login.aspx");
            }
            else
            {
                LblMsg.Text = "Delete has failed.";
            }
        }


        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateProfile.aspx");
        }
    }
}