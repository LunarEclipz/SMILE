using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;
using System.IO;

namespace EADPProject
{
    public partial class Smile_Shop_AdminAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool ValidateInput()
        {
            bool result;
            LblMsg.Text = String.Empty;

            if (String.IsNullOrEmpty(TbName.Text))
            {
                LblMsg.Text += "Product name is required!" + "<br/>";
            }
            if (String.IsNullOrEmpty(TbDesc.Text))
            {
                LblMsg.Text += "Description is required!" + "<br/>";
            }
            double unitPrice;
            result = double.TryParse(TbPrice.Text, out unitPrice);
            if (!result)
            {
                LblMsg.Text += "Unit Price is invalid!" + "<br/>";
            }
            if (DdlCat.SelectedIndex == 0)
            {
                LblMsg.Text += "Department must be selected!" + "<br/>";
            }
            if (ImageUpload.HasFile)
            {
                if (Path.GetExtension(ImageUpload.PostedFile.FileName).ToLower() != ".jpg" && Path.GetExtension(ImageUpload.PostedFile.FileName).ToLower() != ".png" && Path.GetExtension(ImageUpload.PostedFile.FileName).ToLower() != ".gif" && Path.GetExtension(ImageUpload.PostedFile.FileName).ToLower() != ".jpeg")
                {
                    LblMsg.Text += "Invalid Image Selected!" + "<br/>";
                }
            }

            if (String.IsNullOrEmpty(LblMsg.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            Product prod = new Product();

            if (ValidateInput())
            {
                double unitPrice = Double.Parse(TbPrice.Text);
                string imgFile = Path.GetFileName(ImageUpload.PostedFile.FileName);

                if (ImageUpload.HasFile == true)
                {
                    ImageUpload.SaveAs(Server.MapPath("~/ShopImages/") + imgFile);
                }
                else
                {
                    imgFile = "default.jpeg";
                }

                prod = new Product(TbName.Text, TbDesc.Text, unitPrice, DdlCat.Text, "ShopImages/" + imgFile, 0);
                int result = prod.AddProduct();
                if (result == 1)
                {
                    LblMsg.Text = "New product added successfully!";
                    LblMsg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    LblMsg.Text = "Error in adding new product!";
                    LblMsg.ForeColor = System.Drawing.Color.Red;
                }

            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Smile_Shop_AdminCatalog.aspx");
        }
    }
}