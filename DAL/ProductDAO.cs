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
    public class ProductDAO
    {
        public List<Product> SelectAll()
        {
            // Connect to DB
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // DataAdapter to retrieve data from DB
            string sqlStmt = "Select * from Product";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            // DataSet to store data retrieved
            DataSet ds = new DataSet();

            da.Fill(ds);

            // Read data from DataSet to List
            List<Product> prodList = new List<Product>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i = 0; i < rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
                int productId = int.Parse(row["productId"].ToString());
                string productName = row["productName"].ToString();
                string desc = row["desc"].ToString();
                //string imagePath = row["imagePath"].ToString();
                double unitPrice = double.Parse(row["unitPrice"].ToString());
                int categoryId = int.Parse(row["categoryId"].ToString());
                string categoryName = row["categoryName"].ToString();

                Product obj = new Product(productId, productName, desc, unitPrice, categoryId, categoryName);
                prodList.Add(obj);
            }


            return prodList;
        }

        public int Insert(Product prod)
        {
            // Execute NonQuery return an integer value
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Instantiate SqlCommand to add record with INSERT statement
            string sqlStmt = "INSERT INTO Product (productId, productName, desc, imagePath, unitPrice, categoryId, categoryName) " +
                "VALUES (@paraProductID, @paraProductName, @paraDescription, @paraImagePath, @paraImagePath, @paraUnitPrice, @paraCategoryID, @paraCategoryName)";
            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraProductID", prod.ProductID);
            sqlCmd.Parameters.AddWithValue("@paraProductName", prod.ProductName);
            sqlCmd.Parameters.AddWithValue("@paraDescription", prod.Description);
            //sqlCmd.Parameters.AddWithValue("@paraImagePath", prod.ImagePath);
            sqlCmd.Parameters.AddWithValue("@paraUnitPrice", prod.UnitPrice);
            sqlCmd.Parameters.AddWithValue("@paraCategoryID", prod.CategoryID);
            sqlCmd.Parameters.AddWithValue("@paraCategoryName", prod.CategoryName);

            // Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            //Close connection
            myConn.Close();

            return result;
        }

        public Product SelectById(int productId)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "Select * from Product where productId = @paraProductID";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraProductID", productId);

            DataSet ds = new DataSet();

            da.Fill(ds);

            Product prod = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string productName = row["productName"].ToString();
                string desc = row["desc"].ToString();
                //string imagePath = row["imagePath"].ToString();
                double unitPrice = double.Parse(row["unitPrice"].ToString());
                int categoryId = int.Parse(row["categoryId"].ToString());
                string categoryName = row["categoryName"].ToString();

                prod = new Product(productId, productName, desc, unitPrice, categoryId, categoryName);
            }
            else
            {
                prod = null;
            }

            return prod;
        }

    }
}