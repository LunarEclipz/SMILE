using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;

namespace EADPProject
{
    public partial class ViewUserList : System.Web.UI.Page
    {
        List<Smile> sList;

        protected void Page_Load(object sender, EventArgs e)
        {
            RefreshGridView();

        }

        private void RefreshGridView()
        {
            Smile smile = new Smile();
            sList = smile.GetAllSmile();

            GvSmile.Visible = true;
            GvSmile.DataSource = sList;
            GvSmile.DataBind();
        }


        protected void GvSmile_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GvSmile.SelectedRow;
            Session["SSId"] = row.Cells[0].Text;
            Session["SSFName"] = row.Cells[1].Text;
            Session["SSLName"] = row.Cells[2].Text;
            Session["SSEmail"] = row.Cells[3].Text;
            Session["SSType"] = row.Cells[4].Text;
            Response.Redirect("ViewUser.aspx");

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {

        }


    }
}