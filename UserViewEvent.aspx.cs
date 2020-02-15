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
            foreach (var evs in getEvents())
            {
                Event ev = new Event();
                ev.DeleteFinish(0);
            }
            if (Session["StudNo"] != null)
            {
                if (Request.QueryString["isExists"] == "false")
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "Event does not exist or has been deleted" + "<br/>";
                }
                if (Request.QueryString["correctuser"] == "false")
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "Please log in with an admin account to access those features" + "<br/>";
                }
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


        public EventRegister getRegisterSpecific(int eventID, string userID)
        {
            EventRegister evr = new EventRegister();
            EventRegister evrItem = evr.GetRegistersSpecific(eventID, userID);
            return evrItem;
        }

        public Smile getUserInfo(string UserEmail)
        {
            Smile sm = new Smile();
            Smile smItem = sm.GetSmileById(UserEmail);
            return smItem;
        }

        public List<EventRegister> getRegisterByUID()
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetRegistersByUID(Session["StudNo"].ToString());
            return evrList;
        }

        public Event getSingleEvent(int eid)
        {
            Event ev = new Event();
            Event evItem = ev.GetEventById(eid);
            return evItem;
        }

        protected void btnViewEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventInfo.aspx");
        }
    }
}