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
    public partial class hireeList : System.Web.UI.Page
    {
        public List<Receipts> rcpList;
        public string name;


        protected void Page_Load(object sender, EventArgs e)
        {


            string id = Request.QueryString["id"];
            string status = Request.QueryString["status"];
            if (Session["StudNo"] != null)
            {
                name = Session["StudNo"].ToString();
                if (Request.QueryString["status"] == "a")
                {
                    PanelSuccessResult.Visible = true;
                    Lbl_msg.Text = "Accepted";
                }

                if (Request.QueryString["status"] == "d")
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "Removed";
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }

            Receipts rcp = new Receipts();
            if (id != "")
            {
                if (status == "d") {

                    int Id = Convert.ToInt32(id);
                    rcp = new Receipts(Id, "Not Accepted");
                    //rcp = new Receipts("Username", "q", "q", "q", "q", "q", "q", "q", "q",
                    //    DateofHire, "None", "q", "q", 4, "q", "Free");

                    int result = rcp.AcceptReceipts();
                }
                if (status == "a")
                {
                    int Id = Convert.ToInt32(id);
                    rcp = new Receipts(Id, name);
                    //rcp = new Receipts("Username", "q", "q", "q", "q", "q", "q", "q", "q",
                    //    DateofHire, "None", "q", "q", 4, "q", "Free");

                    int result = rcp.AcceptReceipts();
                }
            }

            rcpList = rcp.GetAllReceipts();
        }





        protected string Details()
        {
            string detailsStr = "rcp.Id + rcp.Name + rcp.Hiree";
            return detailsStr;
        }
    }
}