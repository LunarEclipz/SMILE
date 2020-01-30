using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADPProject.DAL;

namespace EADPProject.BLL
{
    public class Cart
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string ImagePath { get; set; }
        public double UnitPrice { get; set; }
        public int Quantity { get; set; }
        public double TotalPrice { get; set; }
        public double SubtotalPrice { get; set; }

        public Cart()
        {

        }

        public Cart(int productId, string productName, string imagePath, double unitPrice, int quantity)
        {
            ProductID = productId;
            ProductName = productName;
            ImagePath = imagePath;
            UnitPrice = unitPrice;
            Quantity = quantity;
            TotalPrice = ComputeTotalPrice();
            SubtotalPrice = ComputeSubtotalPrice();
        }

        public double ComputeTotalPrice()
        {
            double totalPrice = Quantity * UnitPrice;
            return totalPrice;
        }

        public double ComputeSubtotalPrice()
        {

            CartDAO dao = new CartDAO();
            double subtotal = 0;
            List<Cart> cart = dao.SelectAll();
            foreach (var i in cart)
            {
                subtotal = subtotal + (i.TotalPrice);
            };
            return subtotal;
        }

        public List<Cart> GetAllCartItem()
        {
            CartDAO dao = new CartDAO();
            return dao.SelectAll();
        }

        public int AddCart()
        {
            CartDAO dao = new CartDAO();
            int result = dao.Insert(this);
            return result;
        }

    }
}