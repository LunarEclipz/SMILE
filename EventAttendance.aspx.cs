using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class EventAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Smile sm = new Smile();
            Event evItem = new Event();
            int evId = int.Parse(Request.QueryString["eid"].ToString());
            foreach (var evs in getEvents())
            {
                Event ev = new Event();
                ev.DeleteFinish(0);
            }
            if (Session["StudNo"] != null)
            {
                if (sm.GetSmileById(Session["StudNo"].ToString()).Usertype == "Organisation")
                {
                    if (Request.QueryString["userid"] != null)
                    {
                        if (Session["StudNo"] != null)
                        {
                            if (evItem.GetEventById(evId).AdminEmail == Session["StudNo"].ToString())
                            {
                                EventRegister evr = new EventRegister();
                                int eventId = int.Parse(Request.QueryString["eid"].ToString());
                                string userEmail = Request.QueryString["userid"].ToString();
                                int result = evr.PresentReg(eventId, userEmail, 1);
                                if (result == 1)
                                {
                                    PanelSuccessResult.Visible = true;
                                    Lbl_Msg.Text = "The user has been marked present";
                                }
                                else
                                {
                                    Console.WriteLine(eventId.ToString(), userEmail);
                                    PanelErrorResult.Visible = true;
                                    Lbl_err.Text = "The user could not be marked present";
                                }
                            }
                            else
                            {
                                Response.Redirect("UsViewEvent.aspx?incorrectadmin=true");
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("UserViewEvent.aspx?correctuser=false");
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        public Smile getUserInfo(string UserEmail)
        {
            Smile sm = new Smile();
            Smile smItem = sm.GetSmileById(UserEmail);
            return smItem;
        }

        public List<EventRegister> getRegisterByEID(int eventID)
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetRegistersByEID(eventID);
            return evrList;
        }

        public Event getSingleEvent()
        {
            Event ev = new Event();
            Event evItem = ev.GetEventById(int.Parse(Request.QueryString["eid"]));
            return evItem;
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

        protected void backAttendance_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }
    }
}