using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using ZXing;
using System.Net.Mime;

namespace EADPProject
{
    public partial class EventInfo : System.Web.UI.Page
    {
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            Event eventItem = new Event();
            int id = int.Parse(Request.QueryString["id"]);
            foreach (var evs in getEvents())
            {
                Event ev = new Event();
                ev.DeleteFinish(0);
            }
            if (eventItem.GetEventById(id).ActiveStatus == 0)
            {
                Response.Redirect("UserViewEvent.aspx?isExists=false");
            }
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

        public List<Event> getEvents()
        {
            Event ev = new Event();
            List<Event> evList = ev.GetAllEvents();
            return evList;
        }

        public List<EventRegister> getRegisters()
        {
            EventRegister evr = new EventRegister();
            List<EventRegister> evrList = evr.GetAllRegisters();
            return evrList;
        }

        public EventRegister getRegisterSpecific(int eventID, string userID)
        {
            EventRegister evr = new EventRegister();
            EventRegister evrItem = evr.GetRegistersSpecific(eventID, userID);
            return evrItem;
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
            Event ev = new Event();
            EventRegister evr = new EventRegister(eventName, eventId, userInt, 1, 0);

            if (getRegisterSpecific(eventId, userInt) == null)
            {
                if (ev.GetEventById(eventId).Capacity == "none")
                {
                    int result = evr.RegisterEvent();
                    if (result == 1)
                    {
                        int NumberOfJoins = int.Parse(Request["joinVal"]);
                        int results = ev.UpdateJoins(eventId, NumberOfJoins + 1);
                        if (results == 1)
                        {
                            PanelErrorResult.Visible = false;
                            PanelSuccessResult.Visible = true;
                            Lbl_msg.Text = "You have successfully joined " + eventName;

                            var qrCodeWriter = new BarcodeWriter();
                            qrCodeWriter.Format = BarcodeFormat.QR_CODE;

                            qrCodeWriter.Write("localhost:25598/EventAttendance.aspx?eid=" + eventId + "&uid=" + "\"" + Session["StudNo"].ToString() + "\"")
                                        .Save(@"C:\Users\zyonw\Desktop\Any School Stuff\Sem 4\EADP\SmileProjectOfficial\PopQuiz\VS5\Integrated_v1.4\EADPProject\Images\qrCodeImages\evRegQr" + getRegisterSpecific(eventId, Session["StudNo"].ToString()).EventRegisterId.ToString() + ".bmp");

                            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                            {
                                Credentials = new NetworkCredential("smilewebapplication@gmail.com", "smile.123"),
                                EnableSsl = true,
                                DeliveryMethod = SmtpDeliveryMethod.Network
                            };
                            MailMessage message = new MailMessage();
                            message.To.Add(Session["StudNo"].ToString());
                            message.From = new MailAddress("smilewebapplication@gmail.com");
                            message.Body = "Hi Smile User, /n /nThank you for joining " + eventName.ToString() + ". " +
                                "Please present the QR below at the event venue to confirm your attendance.\n\n" +
                                "Thank you for using Smile!\n\nSincerely,\nThe Smile Team";
                            message.Subject = "Thank you for joining an event!";
                            Attachment attachment = new Attachment(@"C:\Users\zyonw\Desktop\Any School Stuff\Sem 4\EADP\SmileProjectOfficial\PopQuiz\VS5\Integrated_v1.4\EADPProject\Images\qrCodeImages\evRegQr" + getRegisterSpecific(eventId, Session["StudNo"].ToString()).EventRegisterId.ToString() + ".bmp", MediaTypeNames.Application.Octet);
                            message.Attachments.Add(attachment);
                            try
                            {
                                client.Send(message);
                            }
                            catch
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
                        Lbl_err.Text = "Could not join Event, please contact the Event host or system administrator";
                    }
                }
                else if (int.Parse(ev.GetEventById(eventId).Capacity) != ev.GetEventById(eventId).NumberOfJoins)
                {
                    int result = evr.RegisterEvent();
                    if (result == 1)
                    {
                        int NumberOfJoins = int.Parse(Request["joinVal"]);
                        int results = ev.UpdateJoins(eventId, NumberOfJoins + 1);
                        if (results == 1)
                        {
                            PanelErrorResult.Visible = false;
                            PanelSuccessResult.Visible = true;
                            Lbl_msg.Text = "You have successfully joined " + eventName + ". An email has been sent to you regarding confirmation of attendance. Any necessary payments will be made at the event venue.";

                            var qrCodeWriter = new BarcodeWriter();
                            qrCodeWriter.Format = BarcodeFormat.QR_CODE;

                            qrCodeWriter.Write("localhost:25598/EventAttendance.aspx?eid=" + eventId + "&uid=" + Session["StudNo"].ToString())
                                        .Save(@"C:\Users\zyonw\Desktop\Any School Stuff\Sem 4\EADP\SmileProjectOfficial\PopQuiz\VS5\Integrated_v1.4\EADPProject\Images\qrCodeImages\evRegQr" + getRegisterSpecific(eventId, Session["StudNo"].ToString()).EventRegisterId.ToString() + ".bmp");

                            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                            {
                                Credentials = new NetworkCredential("smilewebapplication@gmail.com", "smile.123"),
                                EnableSsl = true,
                                DeliveryMethod = SmtpDeliveryMethod.Network
                            };
                            MailMessage message = new MailMessage();
                            message.To.Add(Session["StudNo"].ToString());
                            message.From = new MailAddress("smilewebapplication@gmail.com");
                            message.Body = "Hi Smile User, \n \nThank you for joining " + eventName.ToString() + ". " +
                                "Please present the QR below at the event venue to confirm your attendance.\n\n" +
                                "Thank you for using Smile!\n\nSincerely,\nThe Smile Team";
                            message.Subject = "Thank you for joining an event!";
                            Attachment attachment = new Attachment(@"C:\Users\zyonw\Desktop\Any School Stuff\Sem 4\EADP\SmileProjectOfficial\PopQuiz\VS5\Integrated_v1.4\EADPProject\Images\qrCodeImages\evRegQr" + getRegisterSpecific(eventId, Session["StudNo"].ToString()).EventRegisterId.ToString() + ".bmp", MediaTypeNames.Application.Octet);
                            message.Attachments.Add(attachment);
                            try
                            {
                                client.Send(message);
                            }
                            catch
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
                        Lbl_err.Text = "Could not join Event, please contact the Event host or system administrator";
                    }
                }
                else
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text = "We're sorry, the event has reached maximum capacity";
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