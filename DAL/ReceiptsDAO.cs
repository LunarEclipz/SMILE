using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using EADPProject.BLL;

namespace EADPProject.DAL
{
    public class ReceiptsDAO
    {
        public List<Receipts> SelectAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlStmt = "Select * from Receipts";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            DataSet ds = new DataSet();

            da.Fill(ds);
            List<Receipts> rcpList = new List<Receipts>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i = 0; i < rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
                string IdStr = row["Id"].ToString();
                int Id = Convert.ToInt32(row["Id"]);
                string Name = row["Name"].ToString();
                string Hiree = row["Hiree"].ToString();
                string Location1 = row["Location1"].ToString();
                string Location2 = row["Location2"].ToString();
                string Location3 = row["Location3"].ToString();
                string Location4 = row["Location4"].ToString();
                string Location5 = row["Location5"].ToString();
                string Location6 = row["Location6"].ToString();
                string Location7 = row["Location7"].ToString();
                DateTime DateofHire = Convert.ToDateTime(row["DateofHire"].ToString());
                string PreferredPhotographer = row["PreferredPhotographer"].ToString();
                string Remarks = row["Remarks"].ToString();
                string HCType = row["HCType"].ToString();
                string QuantityStr = row["Quantity"].ToString();
                double Quantity = Convert.ToDouble(QuantityStr);
                string SC = row["SC"].ToString();
                string Price = row["Price"].ToString();


                Receipts obj = new Receipts(Id, Name, Hiree, Location1, Location2, Location3, Location4, Location5, Location6, Location7,
                    DateofHire.Date, PreferredPhotographer, Remarks, HCType, Quantity, SC, Price);
                rcpList.Add(obj);
            }

            return rcpList;
        }

        public Receipts SelectById(int id)
        {
            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            //Step 2 -  Create a DataAdapter to retrieve data from the database table
            string sqlStmt = "Select * from Receipts where Id = @paraNric";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraNric", id);

            //Step 3 -  Create a DataSet to store the data to be retrieved
            DataSet ds = new DataSet();

            //Step 4 -  Use the DataAdapter to fill the DataSet with data retrieved
            da.Fill(ds);

            //Step 5 -  Read data from DataSet.
            Receipts rcp = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];  // Sql command returns only one record
                string IdStr = row["Id"].ToString();
                int Id = Convert.ToInt32(row["Id"]);
                string Name = row["Name"].ToString();
                string Hiree = row["Hiree"].ToString();
                string Location1 = row["Location1"].ToString();
                string Location2 = row["Location2"].ToString();
                string Location3 = row["Location3"].ToString();
                string Location4 = row["Location4"].ToString();
                string Location5 = row["Location5"].ToString();
                string Location6 = row["Location6"].ToString();
                string Location7 = row["Location7"].ToString();
                DateTime DateofHire = Convert.ToDateTime(row["DateofHire"].ToString());
                string PreferredPhotographer = row["PreferredPhotographer"].ToString();
                string Remarks = row["Remarks"].ToString();
                string HCType = row["HCType"].ToString();
                string QuantityStr = row["Quantity"].ToString();
                double Quantity = Convert.ToDouble(QuantityStr);
                string SC = row["SC"].ToString();
                string Price = row["Price"].ToString();
                rcp = new Receipts(Id, Name, Hiree, Location1, Location2, Location3, Location4, Location5, Location6, Location7,
                    DateofHire.Date, PreferredPhotographer, Remarks, HCType, Quantity, SC, Price);
            }
            else
            {
                rcp = null;
            }

            return rcp;
        }

        public int Update(Receipts rcp)
        {
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "UPDATE Receipts SET Name = @paraName, Hiree = @paraHiree, " +
                "Location1 = @paraLocation1, Location2 = @paraLocation2, Location3 = @paraLocation3, Location4 = @paraLocation4, Location5 = @paraLocation5, Location6 = @paraLocation6, Location7 = @paraLocation7, " +
                "DateofHire = @paraDateofHire, PreferredPhotographer = @paraPreferredPhotographer, Remarks = @paraRemarks, HCType = @paraHCType, Quantity = @paraQuantity, SC = @paraSC, Price = @paraPrice " +
                "where Id = @paraNric ";

            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraNric", rcp.Id);
            sqlCmd.Parameters.AddWithValue("@paraName", rcp.Name);
            sqlCmd.Parameters.AddWithValue("@paraHiree", rcp.Hiree);
            sqlCmd.Parameters.AddWithValue("@paraLocation1", rcp.Location1);
            sqlCmd.Parameters.AddWithValue("@paraLocation2", rcp.Location2);
            sqlCmd.Parameters.AddWithValue("@paraLocation3", rcp.Location3);
            sqlCmd.Parameters.AddWithValue("@paraLocation4", rcp.Location4);
            sqlCmd.Parameters.AddWithValue("@paraLocation5", rcp.Location5);
            sqlCmd.Parameters.AddWithValue("@paraLocation6", rcp.Location6);
            sqlCmd.Parameters.AddWithValue("@paraLocation7", rcp.Location7);
            sqlCmd.Parameters.AddWithValue("@paraDateofHire", rcp.DateofHire.ToShortDateString());
            sqlCmd.Parameters.AddWithValue("@paraPreferredPhotographer", rcp.PreferredPhotographer);
            sqlCmd.Parameters.AddWithValue("@paraRemarks", rcp.Remarks);
            sqlCmd.Parameters.AddWithValue("@paraHCType", rcp.HCType);
            sqlCmd.Parameters.AddWithValue("@paraQuantity", rcp.Quantity);
            sqlCmd.Parameters.AddWithValue("@paraSC", rcp.SC);
            sqlCmd.Parameters.AddWithValue("@paraPrice", rcp.Price);

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }

        public int Delete(Receipts rcp)
        {
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "UPDATE Receipts SET Hiree = @paraHiree " +
                "where Id = @paraNric ";

            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraNric", rcp.Id);
            sqlCmd.Parameters.AddWithValue("@paraHiree", "Deleted");

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }

        public int Accept(Receipts rcp)
        {
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "UPDATE Receipts SET Hiree = @paraHiree " +
                "where Id = @paraNric ";

            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraNric", rcp.Id);
            sqlCmd.Parameters.AddWithValue("@paraHiree", rcp.Hiree);

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }

        public int Insert(Receipts rcp)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            string sqlStmt = "INSERT INTO Receipts (Name,  Hiree,  Location1,  Location2,  Location3,  Location4, Location5,  Location6,  Location7, DateofHire," +
                "PreferredPhotographer, Remarks,  HCType, Quantity,  SC,  Price) " +
                "VALUES (@paraName,  @paraHiree,  @paraLocation1,  @paraLocation2,  @paraLocation3,  @paraLocation4, @paraLocation5,  @paraLocation6,  @paraLocation7, @paraDateofHire," +
                "@paraPreferredPhotographer, @paraRemarks,  @paraHCType, @paraQuantity, @paraSC, @paraPrice)";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraName", rcp.Name);
            sqlCmd.Parameters.AddWithValue("@paraHiree", rcp.Hiree);
            sqlCmd.Parameters.AddWithValue("@paraLocation1", rcp.Location1);
            sqlCmd.Parameters.AddWithValue("@paraLocation2", rcp.Location2);
            sqlCmd.Parameters.AddWithValue("@paraLocation3", rcp.Location3);
            sqlCmd.Parameters.AddWithValue("@paraLocation4", rcp.Location4);
            sqlCmd.Parameters.AddWithValue("@paraLocation5", rcp.Location5);
            sqlCmd.Parameters.AddWithValue("@paraLocation6", rcp.Location6);
            sqlCmd.Parameters.AddWithValue("@paraLocation7", rcp.Location7);
            sqlCmd.Parameters.AddWithValue("@paraDateofHire", rcp.DateofHire.ToShortDateString());
            sqlCmd.Parameters.AddWithValue("@paraPreferredPhotographer", rcp.PreferredPhotographer);
            sqlCmd.Parameters.AddWithValue("@paraRemarks", rcp.Remarks);
            sqlCmd.Parameters.AddWithValue("@paraHCType", rcp.HCType);
            sqlCmd.Parameters.AddWithValue("@paraQuantity", rcp.Quantity);
            sqlCmd.Parameters.AddWithValue("@paraSC", rcp.SC);
            sqlCmd.Parameters.AddWithValue("@paraPrice", rcp.Price);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            myConn.Close();

            return result;
        }
    }
}