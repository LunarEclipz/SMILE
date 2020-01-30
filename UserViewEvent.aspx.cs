using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class UserViewEvent : System.Web.UI.Page
    {
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                name = Session["StudNo"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        public List<Event> getEvents()
        {
            Event ev = new Event();
            List<Event> evList = ev.GetAllEvents();
            return evList;
        }

        protected void btnViewEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventInfo.aspx");
        }
    }
}