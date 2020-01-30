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
    public partial class EditEvent : System.Web.UI.Page
    {
        public string name;
        GoogleLocationService locationService = new GoogleLocationService("AIzaSyCAY6l_kdezwueW1JJgqSt1IX4sqZnbZWA");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                name = Session["StudNo"].ToString();
                if (!IsPostBack)
                {
                    Event evs = new Event();
                    int id = int.Parse(Request.QueryString["id"]);
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
                Response.Redirect("Login.aspx", false);
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

                string latitudes = (point.Latitude).ToString();
                string longitudes = (point.Longitude).ToString();
                string eventCost = tbEventCost.Text.ToString();

                if (eventCost == "" || eventCost.ToUpper() == "FREE")
                {
                    eventCost = "free";
                }
                else
                {
                    eventCost = "$" + eventCost;
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

                Event ev = new Event(tbEventName.Text, tbEventDescription.Text, eventCost, tbEventLocation.Text, tbEventDate.Text,
                    tbStartTime.Text, tbEndTime.Text, "Images/" + imgFile, latitudes, longitudes, 0, 0, 1, 0, int.Parse(Request.QueryString["id"]));
                int result = ev.UpdateEvent();
                if (result == 1)
                {
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
            double wage;
            result = double.TryParse(tbEventCost.Text, out wage);
            if (!result && tbEventCost.Text != "" && tbEventCost.Text.ToLower() != "free")
            {
                PanelErrorResultU.Visible = true;
                Lbl_errU.Text += "Event Cost is invalid!" + "<br/>";
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
            if (String.IsNullOrEmpty(Lbl_errU.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void ButtonCancelEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }
    }
}