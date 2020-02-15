using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;

namespace EADPProject
{
    public partial class Smile_Shop_AdminCatalog : System.Web.UI.Page
    {
        public List<Product> prodlist;

        protected void Page_Load(object sender, EventArgs e)
        {
            Product prod = new Product();
            prodlist = prod.GetAllProduct();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            string idName = Request["Lbl_ID"];
            int idValue = int.Parse(idName);

            Product prod = new Product();
            int result = prod.DeleteProduct(1, idValue);
            if (result == 1)
            {
                Lbl_Msg.Text = "Product has been successfully deleted!";
            }
            else
            {
                Lbl_Msg.Text = "Product could not be deleted.";
            }
        }

        protected void BtnAdminEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Smile_Shop_AdminUpdate.aspx");
        }

    }
}