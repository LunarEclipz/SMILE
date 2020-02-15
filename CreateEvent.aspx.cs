using EADPProject.BLL;
using GoogleMaps.LocationServices;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class CreateEvent : System.Web.UI.Page
    {
        GoogleLocationService locationService = new GoogleLocationService("AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA");
        public string name;
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
                if (sm.GetSmileById(Session["StudNo"].ToString()).Usertype != "Organisation")
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

        protected void ButtonCreateEvent_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {
                string imgFile = Path.GetFileName(SaveImage.PostedFile.FileName);
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
                    imgFile = "default.jpeg";
                }

                Event newev = new Event(tbEventName.Text, tbEventDescription.Text, eventCost, tbEventLocation.Text, tbEventDate.Text, tbStartTime.Text, tbEndTime.Text,
                    "Images/" + imgFile, latitudes, longitudes, 0, eventCapacity, 1, 1, ddlCategory.SelectedItem.Text, Session["StudNo"].ToString());
                int result = newev.AddEvent();
                if (result == 1)
                {
                    Response.Redirect("ViewEvent.aspx?SuccessMsg=true");
                }
                else
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text += "Error! Please Contact System Administrator" + "<br/>";
                }
            }
        }

        private bool ValidateInput()
        {
            bool result;
            Lbl_err.Text = String.Empty;

            DateTime dob;
            result = DateTime.TryParse(tbEventDate.Text.ToString(), out dob);
            if (!result)
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text += "Event Date is invalid!" + "<br/>";
            }
            double cost;
            result = double.TryParse(tbEventCost.Text, out cost);
            if (!result && tbEventCost.Text != "" && tbEventCost.Text.ToLower() != "free")
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text += "Event Cost is invalid!" + "<br/>";
            }
            int capacity;
            result = int.TryParse(tbEventCapacity.Text, out capacity);
            if (!result && tbEventCapacity.Text != "" && tbEventCapacity.Text.ToLower() != "none")
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text += "Event Capacity is invalid!" + "<br/>";
            }
            if (locationService.GetLatLongFromAddress(tbEventLocation.Text.ToString()) == null)
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text += "Event Location is invalid!" + "<br/>";
            }
            if (SaveImage.HasFile)
            {
                if (Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".jpg" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".png" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".gif" && Path.GetExtension(SaveImage.PostedFile.FileName).ToLower() != ".jpeg")
                {
                    PanelErrorResult.Visible = true;
                    Lbl_err.Text += "Invalid Image Selected!" + "<br/>";
                }
            }
            if (ddlCategory.SelectedItem.Text == "-- Select --")
            {
                PanelErrorResult.Visible = true;
                Lbl_err.Text += "Please select an Event Category" + "<br/>";
            }
            if (String.IsNullOrEmpty(Lbl_err.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void ButtonCancelAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }
    }
}