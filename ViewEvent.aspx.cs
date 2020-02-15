using EADPProject.BLL;
using EADPProject.DAL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class ViewEvent : System.Web.UI.Page
    {
        public string name;
        private CultureInfo provider = CultureInfo.InvariantCulture;
        Smile sm = new Smile();
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (var evs in getEvents())
            {
                Event ev = new Event();
                ev.DeleteFinish(0);
            }
            if (Session["StudNo"] != null)
            {
                if (sm.GetSmileById(Session["StudNo"].ToString()).Usertype == "Organisation")
                {
                    if (!IsPostBack)
                    {
                        if (Request.QueryString["hiddenid"] != null)
                        {
                            int idValueHide = int.Parse(Request.QueryString["hiddenid"]);
                            Event ev = new Event();

                            int resultHide = ev.HideEvent(idValueHide, 1);
                            if (resultHide == 1)
                            {
                                PanelErrorResult.Visible = false;
                                PanelSuccessResult.Visible = true;
                                Lbl_Msg.Text = "Event has been successfully hidden";
                            }
                            else
                            {
                                PanelSuccessResult.Visible = false;
                                PanelErrorResult.Visible = true;
                                Lbl_err.Text = "Event could not be hidden";
                            }
                        }
                        if (Request.QueryString["unhiddenid"] != null)
                        {
                            int idValueUnhide = int.Parse(Request.QueryString["unhiddenid"]);
                            Event evs = new Event();
                            int resultUnHide = evs.HideEvent(idValueUnhide, 0);
                            if (resultUnHide == 1)
                            {
                                PanelErrorResult.Visible = false;
                                PanelSuccessResult.Visible = true;
                                Lbl_Msg.Text = "Event has been successfully published";
                            }
                            else
                            {
                                PanelSuccessResult.Visible = false;
                                PanelErrorResult.Visible = true;
                                Lbl_err.Text = "Event could not be published";
                            }
                        }
                    }
                    if (Request.QueryString["hasdeleted"] == "true")
                    {
                        PanelErrorResult.Visible = true;
                        Lbl_err.Text = "You cannot edit a deleted event" + "<br/>";
                    }
                    if (Request.QueryString["SuccessMsg"] == "true")
                    {
                        PanelSuccessResult.Visible = true;
                        Lbl_Msg.Text = "Event has been added successfully" + "<br/>";
                    }
                    if (Request.QueryString["SuccessMsgU"] == "true")
                    {
                        PanelSuccessResult.Visible = true;
                        Lbl_Msg.Text = "Event has been edited successfully" + "<br/>";
                    }
                    if (Request.QueryString["isExists"] == "false")
                    {
                        PanelErrorResult.Visible = true;
                        Lbl_err.Text = "Event does not exist or has been deleted" + "<br/>";
                    }
                    if (Request.QueryString["joinExists"] == "true")
                    {
                        PanelErrorResult.Visible = true;
                        Lbl_err.Text = "You cannot edit events" + "<br/>";
                    }
                    if (Request.QueryString["incorrectadmin"] == "true")
                    {
                        PanelErrorResult.Visible = true;
                        Lbl_err.Text = "Event was not created by current user, please login with the account that created the event to edit it" + "<br/>";
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

        public List<Event> getEvents()
        {
            Event ev = new Event();
            List<Event> evList = ev.GetAllEvents();
            return evList;
        }

        public List<EventRegister> getRegisterByEID(int eventID)
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetRegistersByEID(eventID);
            return evrList;
        }

        protected void deleteModalButton_Click(object sender, EventArgs e)
        {
            string idName = Request["idLabelp"];
            int idValue = int.Parse(idName);

            Event ev = new Event();
            int result = ev.DeleteEvent(idValue, 0);
            if (result == 1)
            {
                PanelErrorResult.Visible = false;
                PanelSuccessResult.Visible = true;
                Lbl_Msg.Text = "Event has been successfully deleted";
                if (getRegisterByEID(idValue).Count() > 0)
                {
                    foreach (var regs in getRegisterByEID(idValue))
                    {
                        string userEmail = regs.UserId.ToString();
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                        {
                            Credentials = new NetworkCredential("smilewebapplication@gmail.com", "smile.123"),
                            EnableSsl = true,
                            DeliveryMethod = SmtpDeliveryMethod.Network
                        };
                        MailMessage message = new MailMessage();
                        message.To.Add(userEmail);
                        message.From = new MailAddress("smilewebapplication@gmail.com");
                        message.Body = "Hi Smile User, \n \nWe noticed that you had joined the event, " + regs.EventName + ". " +
                            "Unfortunately, the event host has decided not to continue with the event and has taken it down. \n \n" +
                            "We are sorry for any inconveniece caused and we would like to thank you for using Smile! \n \nSincerely,\nThe Smile Team";
                        message.Subject = "We're sorry, an event has been taken down";
                        try
                        {
                            client.Send(message);
                        }
                        catch
                        {
                            PanelSuccessResult.Visible = false;
                            PanelErrorResult.Visible = true;
                            Lbl_err.Text = "Emails could not be sent out to affected users ";
                        }
                    }
                }
            }
            else
            {
                PanelSuccessResult.Visible = false;
                PanelErrorResult.Visible = true;
                Lbl_err.Text = "Event could not be deleted";
            }
        }

        protected void ButtonAddNewEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }
    }
}