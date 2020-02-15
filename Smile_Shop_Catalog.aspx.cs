using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EADPProject.BLL;


namespace EADPProject
{
    public partial class Smile_Shop_Catalog : System.Web.UI.Page
    {
        public List<Product> prodlist;

        protected void Page_Load(object sender, EventArgs e)
        {
            Product prod = new Product();
            prodlist = prod.GetAllProduct();
        }


        protected void BtnAddCart_Click(object sender, EventArgs e)
        {
            //Cart cartItem = new Cart();

            //cartItem = new Cart(0, catName.Text, unitPrice.Text, 0, 0);
            //int result = cartItem.AddCart();
            //if (result == 1)
            //{
            //    Response.Redirect("Smile_Shop_Cart.aspx");
            //}
            //else
            //{
            //    Response.Redirect("Smile_Shop_Catalog.aspx");
            //}
        }

        protected void cartAdd_Click(object sender, EventArgs e)
        {

        }
    }
}