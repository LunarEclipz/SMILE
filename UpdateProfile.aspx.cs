using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.DAL;
using EADPProject.BLL;
using System.Drawing;


namespace EADPProject
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SmileDAO sdao = new SmileDAO();
                email = Session["StudNo"].ToString();
                string us = sdao.getusername(email);
                string f = sdao.getfname(email);
                string l = sdao.getlname(email);

                TBUsername.Text = us;
                TBFName.Text = f;
                TBLName.Text = l;
                TBEmail.Text = (string)Session["email"];
            }
        }

        protected void BtnUpdateProf_Click(object sender, EventArgs e)
        {
            SmileDAO sm = new SmileDAO();
            Smile u = new Smile("User", TBUsername.Text, TBFName.Text, TBLName.Text, TBEmail.Text, TBEmail.Text.ToString(), 0);
            int result = sm.Update(u);
            if (result == 1)
            {
                LblMsg.Text = "Record Updated Successfully!";
                LblMsg.ForeColor = Color.Green;
                Response.Redirect("Profile.aspx");
            }
            else
            {
                LblMsg.Text = "Error in adding record! Inform System Administrator!";
                LblMsg.ForeColor = Color.Red;
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Profile.aspx");
        }
    }
}