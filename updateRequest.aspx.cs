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
    public partial class updateRequest : System.Web.UI.Page
    {

        public int idnow;
        public string softcopy = "No Softcopy";
        public string hardcopy = "No Hardcopy";
        public int quantity = 0;
        public string price = "Free";
        public DateTime DateofHire;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {

                if (!IsPostBack)
                {
                    Receipts rcp = new Receipts();

                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    Receipts currentrcp = rcp.GetReceiptsById(id);
                    TextBoxLocation1.Text = currentrcp.Location1.Trim();
                    TextBoxLocation2.Text = currentrcp.Location2.Trim();
                    TextBoxLocation3.Text = currentrcp.Location3.Trim();
                    TextBoxLocation4.Text = currentrcp.Location4.Trim();
                    TextBoxLocation5.Text = currentrcp.Location5.Trim();
                    TextBoxLocation6.Text = currentrcp.Location6.Trim();
                    TextBoxLocation7.Text = currentrcp.Location7.Trim();
                    if (currentrcp.HCType != "No Hardcopy                                       ")
                    {
                        CheckBoxHardCopy.Checked = true;
                        TextBoxQuantity.Text = currentrcp.Quantity.ToString();
                        DropDownListHC.Text = currentrcp.HCType;
                        TextBoxQuantity.Enabled = true;
                    }
                    if (currentrcp.SC != "No Softcopy                                       ")
                    {
                        CheckBoxSoftCopy.Checked = true;

                    }
                    TextBoxRemarks.Text = currentrcp.Remarks.Trim();
                    TextBoxDate.Text = currentrcp.DateofHire.ToShortDateString();
                    idnow = rcp.Id;
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

        protected void ButtonEdit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            if (ValidateInput())
            {
                string username = Session["StudNo"].ToString();

                Receipts rcp = new Receipts(id, username, "Not Accepted",  TextBoxLocation1.Text , TextBoxLocation2.Text, TextBoxLocation3.Text,
                    TextBoxLocation4.Text, TextBoxLocation5.Text, TextBoxLocation6.Text, TextBoxLocation7.Text,
                    DateofHire, TextBoxPreferred.Text, TextBoxRemarks.Text, hardcopy, quantity, softcopy, price);
                //Console.WriteLine(rcp.Location1 + "!!!" + rcp.Id);
                //rcp = new Receipts("Username", "q", "q", "q", "q", "q", "q", "q", "q",
                //    DateofHire, "None", "q", "q", 4, "q", "Free");

                int result = rcp.UpdateReceipts();
                if (result == 1)
                {
                    LblMsg.Text = "Record Updated successfully!";
                    LblMsg.ForeColor = Color.Green;
                    Response.Redirect("viewRequestHistory.aspx?updatesuccess=true");

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
                TextBoxPreferred.Visible = true;
            }
            else
            {
                TextBoxPreferred.Visible = false;
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