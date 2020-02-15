using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class Smile_Shop_Cart : System.Web.UI.Page
    {
             public string[] products;
        public List<Product> productsName = new List<Product>();
        Product product = new Product();
        Cart cart = new Cart();
        public List<Cart> CartList = new List<Cart>();
        double happy;
        double ex;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string prodList = Request.QueryString["prod"].ToString();
                products = prodList.Split('_');
                DisplayProduct();
                Response.Redirect("Smile_Shop_Cart.aspx", false);
            }
            catch
            {

                CartList = cart.GetAllCartItem();
                foreach (Cart bb in CartList)
                {
                    double currentPrice = bb.Quantity * bb.UnitPrice;
                    happy += currentPrice;
                }

                LabelHoneyCakes.Text = "$" + happy.ToString();
                LabelTotal.Text = "Total Price: $" + (happy + ex).ToString();
            }
        }

        protected void DisplayProduct()
        {
            foreach (string p in products)
            {

                if (p != "")
                {
                    productsName.Add(product.GetProductById(p));

                    if (cart.GetItemById(p) == null)
                    {
                        Product cartItem = product.GetProductById(p);
                        string imgFile = Path.GetFileName(cartItem.ImagePath);
                        cart = new Cart(int.Parse(p), cartItem.ProductName, "ShopImages/" + imgFile, cartItem.UnitPrice, 1, 0, 0);
                        int result = cart.AddCart();
                    }
                    else
                    {
                        Cart existingItem = cart.GetItemById(p);
                        int quantity = existingItem.Quantity + 1;
                        string imgFile = Path.GetFileName(existingItem.ImagePath);
                        existingItem = new Cart(int.Parse(p), existingItem.ProductName, "ShopImages/" + imgFile, existingItem.UnitPrice, quantity, 0, 0);
                        int result = existingItem.UpdateCart();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cart.DeleteCart();
            Response.Redirect("Smile_Shop_Cart.aspx", false);

        }

        protected void RBList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
  

            LabelTotal.Text = "Total Price: $" + (happy + ex).ToString();
        }

    }
}