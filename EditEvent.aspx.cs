using EADPProject.BLL;
using GoogleMaps.LocationServices;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class EditEvent : System.Web.UI.Page
    {
        public string name;
        GoogleLocationService locationService = new GoogleLocationService("AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            Event eventItem = new Event();
            Smile sm = new Smile();
            foreach (var evs in getActiveEvents())
            {
                Event ev = new Event();
                ev.DeleteFinish(0);
            }
            if (eventItem.GetEventById(id).ActiveStatus == 0)
            {
                Response.Redirect("ViewEvent.aspx?isExists=false");
            }
            if (Session["StudNo"] != null)
            {
                if (sm.GetSmileById(Session["StudNo"].ToString()).Usertype == "Organisation")
                {
                    if (Session["StudNo"] != null)
                    {
                        if (eventItem.GetEventById(id).AdminEmail == Session["StudNo"].ToString())
                        {
                            if (!IsPostBack)
                            {
                                Event evs = new Event();
                                Event evItem = evs.GetEventById(id);
                                tbEventName.Text = evItem.EventName;
                                tbEventDescription.Text = evItem.EventDescription;

                                if (evItem.EventCost == "free")
                                {
                                    tbEventCost.Text = evItem.EventCost;
                                }
                                else
                                {
                                    tbEventCost.Text = evItem.EventCost.Substring(1);
                                }
                                tbEventLocation.Text = evItem.EventLocation;
                                tbEventCapacity.Text = evItem.Capacity.ToString();
                                ddlCategory.SelectedItem.Text = evItem.EventCategory;
                                tbStartTime.Text = evItem.EventStartTime;
                                tbEndTime.Text = evItem.EventEndTime;
                                tbEventDate.Text = evItem.EventDate;
                                lblposter.Visible = true;
                                lblposter.Text = evItem.PictureURL.Substring(evItem.PictureURL.LastIndexOf('/') + 1);
                                posterImage.ImageUrl = evItem.PictureURL;
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewEvent.aspx?incorrectadmin=true");
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
                Response.Redirect("Login.aspx?loggedin=false");
            }

        }

        protected void ButtonEditEvent_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {
                string imgFile = Path.GetFileName(SaveImage.PostedFile.FileName);
                var locationService = new GoogleLocationService("AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA");
                string address = tbEventLocation.Text.ToString();
                var point = locationService.GetLatLongFromAddress(address);
                string eventCapacity = tbEventCapacity.Text;

                string latitudes = (point.Latitude).ToString();
                string longitudes = (point.Longitude).ToString();
                string eventCost = tbEventCost.Text.ToString();

                if (eventCost == "" || eventCost.ToUpper() == "FREE" || int.Parse(eventCost) == 0)
                {
                    eventCost = "free";
                }
                else
                {
                    eventCost = "$" + eventCost;
                }

                if (eventCapacity == "")
                {
                    eventCapacity = "none";
                }

                if (SaveImage.HasFile == true)
                {
                    SaveImage.SaveAs(Server.MapPath("~/Images/") + imgFile);
                }
                else
                {
                    imgFile = lblposter.Text;
                }
                Console.WriteLine(lblposter.Text);

                string idName = Request.QueryString["id"];
                int idValue = int.Parse(idName);
                Event ev = new Event(tbEventName.Text, tbEventDescription.Text, eventCost, tbEventLocation.Text, tbEventDate.Text,
                    tbStartTime.Text, tbEndTime.Text, "Images/" + imgFile, latitudes, longitudes, 0, eventCapacity, 1, 0, ddlCategory.SelectedItem.Text, Session["StudNo"].ToString(), int.Parse(Request.QueryString["id"]));
                int result = ev.UpdateEvent();
                if (result == 1)
                {
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
                            message.Body = "Hi Smile User, \n \nAn event that you have joined, " + regs.EventName + ", has recently been edited. " +
                                "Some important event information may have been changed such as venues or timings \n \n" +
                                "We are sorry for any inconveniece caused and we would like to thank you for using Smile! \n \nSincerely,\nThe Smile Team";
                            message.Subject = "An event you have joined has been edited!";
                            try
                            {
                                client.Send(message);
                            }
                            catch
                            {
                                PanelErrorResultU.Visible = true;
                                Lbl_errU.Text = "Emails could not be sent out to affected users ";
                            }
                        }
                    }
                    Response.Redirect("ViewEvent.aspx?SuccessMsgU=true");
                }
                else
                {
                    PanelErrorResultU.Visible = true;
                    Lbl_errU.Text += "Error! Please Contact System Administrator" + "<br/>";
                }
            }
        }

        private bool ValidateInput()
        {
            bool result;
            Lbl_errU.Text = String.Empty;

            DateTime dob;
            result = DateTime.TryParse(tbEventDate.Text.ToString(), out dob);
            if (!result)
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Event Date is invalid!" + "<br/>";
            }
            double cost;
            result = double.TryParse(tbEventCost.Text, out cost);
            if (!result && tbEventCost.Text != "" && tbEventCost.Text.ToLower() != "free")
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Event Cost is invalid!" + "<br/>";
            }
            else
            {
                int id = int.Parse(Request.QueryString["id"]);
                Event eventItem = new Event();
                if (tbEventCost.Text.ToString() != eventItem.GetEventById(id).EventCost)
                {
                    if (eventItem.GetEventById(id).NumberOfJoins != 0 && eventItem.GetEventById(id).EventCost != "free")
                    {
                        if (tbEventCost.Text.ToLower() != "free" && tbEventCost.Text != "")
                        {
                            if (int.Parse(eventItem.GetEventById(id).EventCost.Substring(1)) < int.Parse(tbEventCost.Text))
                            {
                                PanelErrorResultU.Visible = true;
                                Lbl_errU.Text += "You cannot increase the join price of events that users have already joined" + "<br/>";
                            }
                        }
                    }
                    if (eventItem.GetEventById(id).EventCost == "free" && eventItem.GetEventById(id).NumberOfJoins != 0)
                    {
                        if (tbEventCost.Text != "free" && tbEventCost.Text != "" && tbEventCost.Text != "0")
                        {
                            PanelErrorResultU.Visible = true;
                            Lbl_errU.Text += "You cannot increase the join price of events that users have already joined" + "<br/>";
                        }
                    }
                }
            }
            int capacity;
            result = int.TryParse(tbEventCapacity.Text, out capacity);
            if (!result && tbEventCapacity.Text != "" && tbEventCapacity.Text.ToLower() != "none")
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Event Capacity is invalid!" + "<br/>";
            }
            else
            {
                int id = int.Parse(Request.QueryString["id"]);
                Event eventItem = new Event();
                if (tbEventCapacity.Text.ToString() != eventItem.GetEventById(id).Capacity)
                {
                    if (eventItem.GetEventById(id).NumberOfJoins != 0 && eventItem.GetEventById(id).Capacity != "none")
                    {
                        if (tbEventCapacity.Text.ToLower() != "none" && tbEventCapacity.Text != "")
                        {
                            if (int.Parse(eventItem.GetEventById(id).Capacity) > int.Parse(tbEventCapacity.Text))
                            {
                                PanelErrorResultU.Visible = true;
                                Lbl_errU.Text += "You cannot lower the capacity of events that users have already joined" + "<br/>";
                            }
                        }
                    }
                    if (eventItem.GetEventById(id).Capacity == "none" && eventItem.GetEventById(id).NumberOfJoins != 0)
                    {
                        if (tbEventCapacity.Text != "none" && tbEventCapacity.Text != "")
                        {
                            PanelErrorResultU.Visible = true;
                            Lbl_errU.Text += "You cannot lower the capacity of events that users have already joined" + "<br/>";
                        }
                    }
                }
            }
            if (locationService.GetLatLongFromAddress(tbEventLocation.Text.ToString()) == null)
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Event Location is invalid!" + "<br/>";
            }
            if (SaveImage.HasFile)
            {
                if (Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".jpg" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".png" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".gif" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".jpeg")
                {
                    PanelErrorResultU.Visible = true;
                    Lbl_errU.Text += "Invalid Image Selected!" + "<br/>";
                }
            }
            if (ddlCategory.SelectedItem.Text == "-- Select --")
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Please select an Event Category" + "<br/>";
            }
            if (String.IsNullOrEmpty(Lbl_errU.Text))
            {
                return true;
            }
            else
            {
                return false;
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

        public List<Event> getActiveEvents()
        {
            Event ev = new Event();
            List<Event> evList = ev.GetActiveEvents();
            return evList;
        }

        public List<Event> getDeletedEvents()
        {
            Event ev = new Event();
            List<Event> evList = ev.GetDeletedEvents();
            return evList;
        }

        protected void ButtonCancelEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }
    }
}