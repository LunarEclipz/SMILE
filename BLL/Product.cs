using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADPProject.DAL;


namespace EADPProject.BLL
{
        public class Product
        {
            // Class Properties
            public int ProductID { get; set; }
            public string ProductName { get; set; }
            public string Description { get; set; }
            //public string ImagePath { get; set; }
            public double UnitPrice { get; set; }
            public int CategoryID { get; set; }
            public string CategoryName { get; set; }

            // Default constructor
            public Product()
            {

            }

            // Define constructor to initialize properties
            public Product(int productId, string productName, string desc, double unitPrice, int categoryId, string categoryName)
            {
                ProductID = productId;
                ProductName = productName;
                Description = desc;
                //ImagePath = imagePath;
                UnitPrice = unitPrice;
                CategoryID = categoryId;
                CategoryName = categoryName;
            }

            public List<Product> GetAllProduct()
            {
                ProductDAO dao = new ProductDAO();
                return dao.SelectAll();
            }

            public int AddProduct()
            {
                ProductDAO dao = new ProductDAO();
                int result = dao.Insert(this);
                return result;
            }

            public Product GetProductById(int productId)
            {
                ProductDAO dao = new ProductDAO();
                return dao.SelectById(productId);
            }
        }
    }