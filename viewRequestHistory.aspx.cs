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
        public string Id = "0";
        public string Photographer = "a";
        public string Location1 = "b";
        public string Date = "c";
        public List<Receipts> rcpList;

        protected void Page_Load(object sender, EventArgs e)
        {
            Receipts rcp = new Receipts();
            rcpList = rcp.GetAllReceipts();
        }

       



        protected string Details()
        {
            string detailsStr = "rcp.Id + rcp.Name + rcp.Hiree";
            return detailsStr;
        }
    }
}