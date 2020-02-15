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
    public partial class Smile_Shop_AdminUpdate : System.Web.UI.Page
    {
        public string[] products;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string prodList = Request.QueryString["prod"].ToString();
                products = prodList.Split('_');
                Product product = new Product();

                Product prodItem = product.GetProductById(products[0]);
                TbName.Text = prodItem.ProductName;
                TbDesc.Text = prodItem.Description;
                TbPrice.Text = (prodItem.UnitPrice).ToString();
                DdlCat.Text = prodItem.CategoryName;
                posterImage.ImageUrl = prodItem.ImagePath;
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Smile_Shop_AdminCatalog.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {
                double unitPrice = Double.Parse(TbPrice.Text);
                int id = int.Parse(Request.QueryString["prod"].Substring(0, 1));
                string imgFile = Path.GetFileName(ImageUpload.PostedFile.FileName);

                if (ImageUpload.HasFile == true)
                {
                    ImageUpload.SaveAs(Server.MapPath("~/ShopImages/") + imgFile);
                }
                else
                {
                    imgFile = "default.jpeg";
                }

                Product prod = new Product(TbName.Text, TbDesc.Text, unitPrice, DdlCat.SelectedItem.Text, "ShopImages/" + imgFile, 0, id);
                int result = prod.UpdateProduct();
                if (result == 1)
                {
                    LblMsg.Text = "Product updated successfully!";
                    LblMsg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    LblMsg.Text = "Error in updating product!";
                    LblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
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
    }
}