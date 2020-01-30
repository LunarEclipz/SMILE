using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADPProject.BLL;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace EADPProject.DAL
{
        public class CartDAO
        {
            public List<Cart> SelectAll()
            {
                string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                SqlConnection myConn = new SqlConnection(DBConnect);

                string sqlStmt = "Select * from Cart";
                SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

                DataSet ds = new DataSet();

                da.Fill(ds);

                List<Cart> cartList = new List<Cart>();
                int rec_cnt = ds.Tables[0].Rows.Count;
                for (int i = 0; i < rec_cnt; i++)
                {
                    DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
                    int productId = int.Parse(row["productId"].ToString());
                    string productName = row["productName"].ToString();
                    string imagePath = row["imagePath"].ToString();
                    double unitPrice = double.Parse(row["unitPrice"].ToString());
                    int quantity = int.Parse(row["quantity"].ToString());
                    Cart obj = new Cart(productId, productName, imagePath, unitPrice, quantity);
                    cartList.Add(obj);
                }
                return cartList;
            }

            //public Cart ComputeSubtotal(double totalPrice)
            //{
            //    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            //    SqlConnection myConn = new SqlConnection(DBConnect);

            //    string sqlStmt = "Select  from Cart";
            //    SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            //    DataSet ds = new DataSet();

            //    da.Fill(ds);

            //    List<Cart> cartList = new List<Cart>();
            //    int rec_cnt = ds.Tables[0].Rows.Count;
            //    for (int i = 0; i < rec_cnt; i++)
            //    {
            //        DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
            //        int productId = int.Parse(row["productId"].ToString());
            //        string productName = row["productName"].ToString();
            //        string imagePath = row["imagePath"].ToString();
            //        double unitPrice = double.Parse(row["unitPrice"].ToString());
            //        int quantity = int.Parse(row["quantity"].ToString());
            //        Cart obj = new Cart(productId, productName, imagePath, unitPrice, quantity);
            //        cartList.Add(obj);
            //    }
            //    return cartList;

            //}

            public int Insert(Cart prod)
            {
                // Execute NonQuery return an integer value
                int result = 0;
                SqlCommand sqlCmd = new SqlCommand();

                string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                SqlConnection myConn = new SqlConnection(DBConnect);

                // Instantiate SqlCommand to add record with INSERT statement
                string sqlStmt = "INSERT INTO Cart (productId, productName, imagePath, unitPrice, totalPrice, subtotalPrice) " +
                    "VALUES (@paraProductID, @paraProductName, @paraImagePath, @paraUnitPrice, @paraTotalPrice, @paraSubtotalPrice)";
                sqlCmd = new SqlCommand(sqlStmt, myConn);

                // Add each parameterised variable with value
                sqlCmd.Parameters.AddWithValue("@paraProductID", prod.ProductID);
                sqlCmd.Parameters.AddWithValue("@paraProductName", prod.ProductName);
                sqlCmd.Parameters.AddWithValue("@paraImagePath", prod.ImagePath);
                sqlCmd.Parameters.AddWithValue("@paraUnitPrice", prod.UnitPrice);
                sqlCmd.Parameters.AddWithValue("@paraTotalPrice", prod.TotalPrice);
                sqlCmd.Parameters.AddWithValue("@paraSubtotalPrice", prod.SubtotalPrice);

                // Open connection the execute NonQuery of sql command   
                myConn.Open();
                result = sqlCmd.ExecuteNonQuery();

                //Close connection
                myConn.Close();

                return result;
            }

        }
    }