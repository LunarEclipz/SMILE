using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                LblUser.Text = Session["type"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }

        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
            Session["StudNo"] = LblUser.Text;
            Response.Redirect("Random.aspx");
        }
    }
}