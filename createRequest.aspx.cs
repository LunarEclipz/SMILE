using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;
using System.Drawing;

namespace EADPProject
{
    public partial class createRequest : System.Web.UI.Page
    {
        public string softcopy = "No Softcopy";
        public string hardcopy = "No Hardcopy";
        public int quantity = 0;
        public string price = "Free";
        public DateTime DateofHire;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                if (Session["EventLocation"] != null)
                {
                    TextBoxLocation1.Text = Session["eventLocation"].ToString();
                    Session["EventLocation"] = null;
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        private bool ValidateInput()
        {
            bool result;
            LblMsg.Text = String.Empty;
            LblMsg.ForeColor = Color.Red;

            if (TextBoxLocation1.Text == "")
            {
                LblMsg.Text += "At least 1 Location is required!" + "<br/>";
            }
            DateTime dateofhire;
            result = DateTime.TryParse(TextBoxDate.Text, out dateofhire);
            if (!result)
            {
                LblMsg.Text += "Date is invalid!" + "<br/>";
            }
            else
            {
                DateofHire = Convert.ToDateTime(TextBoxDate.Text);
            }

            if (CheckBoxHardCopy.Checked == false && CheckBoxSoftCopy.Checked == false)
            {
                LblMsg.Text += "Please select your photo format" + "<br/>";
            }

            if (CheckBoxSoftCopy.Checked == true)
            {
                softcopy = "∞";
            }


            if (CheckBoxHardCopy.Checked == true)
            {
                hardcopy = DropDownListHC.Text;

                if (TextBoxQuantity.Text != "")
                {
                    int qua;
                    result = int.TryParse(TextBoxQuantity.Text, out qua);
                    if (!result)
                    {
                        LblMsg.Text += "Quantity is invalid!" + "<br/>";
                    }
                    else
                    {
                        quantity = Convert.ToInt32(TextBoxQuantity.Text);
                    }
                }
            }
            if (string.IsNullOrEmpty(LblMsg.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void ButtonRequest_Click(object sender, EventArgs e)
        {
            Receipts rcp = new Receipts();

            if (ValidateInput())
            {
                string username = Session["StudNo"].ToString();
                rcp = new Receipts(username, "Not Accepted", TextBoxLocation1.Text, TextBoxLocation2.Text, TextBoxLocation3.Text,
                    TextBoxLocation4.Text, TextBoxLocation5.Text, TextBoxLocation6.Text, TextBoxLocation7.Text,
                    DateofHire, TextBoxPreferred.Text, TextBoxRemarks.Text, hardcopy, quantity , softcopy, price);
                //rcp = new Receipts("Username", "q", "q", "q", "q", "q", "q", "q", "q",
                //    DateofHire, "None", "q", "q", 4, "q", "Free");

                int result = rcp.AddReceipts();
                if (result == 1)
                {
                    LblMsg.Text = "Record added successfully!";
                    LblMsg.ForeColor = Color.Green;
                    Response.Redirect("viewRequestHistory.aspx?createsuccess=true");

                }
                else
                {
                    LblMsg.Text = "Error in adding record! Inform System Administrator!";
                    LblMsg.ForeColor = Color.Red;
                }
            }
        }

        protected void CheckBoxPreferred_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxPreferred.Checked == true)
            {
                TextBoxPreferred.Enabled = true;
            }
            else
            {
                TextBoxPreferred.Enabled = false;
            }
        }

        protected void CheckBoxHardCopy_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxHardCopy.Checked == true)
            {
                TextBoxQuantity.Enabled = true;
            }
            else
            {
                TextBoxQuantity.Text = "";

                TextBoxQuantity.Enabled = false;
            }
        }
    }
}