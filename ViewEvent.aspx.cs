using EADPProject.BLL;
using EADPProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class ViewEvent : System.Web.UI.Page
    {
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                name = Session["StudNo"].ToString();
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