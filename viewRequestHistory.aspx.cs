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
    public partial class viewRequestHistory : System.Web.UI.Page
    {
        public string name;
        public List<Receipts> rcpList;
      

        protected void Page_Load(object sender, EventArgs e)
        {

            
            string id = Request.QueryString["id"];
            Receipts rcp = new Receipts();
            if (id != "")
            {
                int Id = Convert.ToInt32(id);
                rcp = new Receipts(Id);
                //rcp = new Receipts("Username", "q", "q", "q", "q", "q", "q", "q", "q",
                //    DateofHire, "None", "q", "q", 4, "q", "Free");

                int result = rcp.deleteReceipts();
            }
            
            rcpList = rcp.GetAllReceipts();

            if (Session["StudNo"] != null)
            {
                name = Session["StudNo"].ToString();
                if (Request.QueryString["createsuccess"] == "true")
                {
                    PanelSuccessResult.Visible = true;
                    Lbl_msg.Text = "Create Request Successful";
                }

                if (Request.QueryString["updatesuccess"] == "true")
                {
                    PanelSuccessResult.Visible = true;
                    Lbl_msg.Text = "Update Request Successful";
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

       



        protected string Details()
        {
            string detailsStr = "rcp.Id + rcp.Name + rcp.Hiree";
            return detailsStr;
        }
    }
}