using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class EventInfo : System.Web.UI.Page
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


        public Event getSingleEvent()
        {
            Event ev = new Event();
            Event evItem = ev.GetEventById(int.Parse(Request.QueryString["id"]));
            return evItem;
        }

        public List<EventRegister> getRegisters()
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetAllRegisters();
            return evrList;
        }

        public List<EventRegister> getRegisterSpecific(int eventID, string userID)
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetRegistersSpecific(eventID, userID);
            return evrList;
        }

        protected void backEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserViewEvent.aspx");
        }

        protected void ButtonHirePhoto_Click(object sender, EventArgs e)
        {
            string location = Request["locationInput"].ToString();
            Session["eventLocation"] = location;
            Response.Redirect("createRequest.aspx");
        }

        protected void btnJoinEvent_Click(object sender, EventArgs e)
        {
            string userInt = Session["StudNo"].ToString();
            int eventId = int.Parse(Request.QueryString["id"]);
            string eventName = Request["eventName"].ToString();

            EventRegister evr = new EventRegister(eventName, eventId, userInt, 1);

            if (getRegisterSpecific(eventId, userInt) == null)
            {
                int result = evr.RegisterEvent();
                if (result == 1)
                {
                    Event ev = new Event();
                    int NumberOfJoins = int.Parse(Request["joinVal"]);
                    int results = ev.UpdateJoins(eventId, NumberOfJoins + 1);
                    if (results == 1)
                    {
                        PanelErrorResult.Visible = false;
                        PanelSuccessResult.Visible = true;
                        Lbl_msg.Text = "You have successfully joined " + eventName;
                    }
                    else
                    {
                        PanelSuccessResult.Visible = false;
                        PanelErrorResult.Visible = true;
                        Lbl_err.Text = "Could not join Event, please contact the Event host or system administrator";
                    }

                }
                else
                {
                    PanelSuccessResult.Visible = false;
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "Could not join Event, please contact the Event host or system administrator";
                }
            }
            else
            {
                PanelSuccessResult.Visible = false;
                PanelErrorResult.Visible = true;
                Lbl_err.Text = "You have already registered for this event.";
            }
        }

        protected void ButtonUnregister_Click(object sender, EventArgs e)
        {
            string userInt = Session["StudNo"].ToString();
            int eventId = int.Parse(Request.QueryString["id"]);
            string eventName = Request["eventName"].ToString();
            EventRegister evr = new EventRegister();
            int result = evr.DeleteReg(eventId, userInt, 0);
            if (result == 1)
            {
                Event ev = new Event();
                int NumberOfJoins = int.Parse(Request["joinVal"]);
                int results = ev.UpdateJoins(eventId, NumberOfJoins - 1);
                if (results == 1)
                {
                    PanelSuccessResult.Visible = false;
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "You have unregistered from " + eventName;
                }
                else
                {
                    PanelSuccessResult.Visible = false;
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "Could not join Event, please contact the Event host or system administrator";
                }
            }
            else
            {
                PanelSuccessResult.Visible = false;
                PanelErrorResult.Visible = true;
                Lbl_err.Text = "You could not unregister from the event, please contact the event host or system administrator";
            }
        }

    }
}