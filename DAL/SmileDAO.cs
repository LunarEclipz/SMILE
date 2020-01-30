using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace EADPProject.DAL
{
    public class SmileDAO
    {
        byte[] Key;
        byte[] IV;
        static string finalHash;
        static string salt;
        string usertype, username, fname, lname, email, pass;


        public List<Smile> SelectAll()
        {
            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            //Step 2 -  Create a DataAdapter to retrieve data from the database table
            string sqlStmt = "Select * from SmileUser";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            //Step 3 -  Create a DataSet to store the data to be retrieved
            DataSet ds = new DataSet();

            //Step 4 -  Use the DataAdapter to fill the DataSet with data retrieved
            da.Fill(ds);

            //Step 5 -  Read data from DataSet to List
            List<Smile> smileList = new List<Smile>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i = 0; i < rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];  // Sql command returns only one record
                usertype = row["usertype"].ToString();
                username = row["username"].ToString();
                fname = row["fname"].ToString();
                lname = row["lname"].ToString();
                email = row["email"].ToString();
                pass = row["pass"].ToString();
                Smile obj = new Smile(usertype, username, fname, lname, email, pass);
                smileList.Add(obj);
            }

            return smileList;
        }
        public Smile SelectById(string email)
        {
            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            //Step 2 -  Create a DataAdapter to retrieve data from the database table
            string sqlStmt = "Select * from SmileUser where email = @paraEmail";
            SqlDataAdapter da = new SqlDataAdapter(sqlStmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraEmail", email);

            //Step 3 -  Create a DataSet to store the data to be retrieved
            DataSet ds = new DataSet();

            //Step 4 -  Use the DataAdapter to fill the DataSet with data retrieved
            da.Fill(ds);

            //Step 5 -  Read data from DataSet.
            Smile u = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];  // Sql command returns only one record
                usertype = row["usertype"].ToString();
                username = row["username"].ToString();
                fname = row["fname"].ToString();
                lname = row["lname"].ToString();
                pass = row["pass"].ToString();
                u = new Smile(usertype, username, fname, lname, email, pass);
            }
            else
            {
                u = null;
            }

            return u;
        }

        public int Insert(Smile u)
        {

            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];

            //Fills array of bytes with a crypthografically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);


            SHA512Managed hashing = new SHA512Managed();
            string pwdWithSalt = salt + u.Pass + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(u.Pass));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));

            finalHash = Convert.ToBase64String(hashWithSalt);

            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;

            // Execute NonQuery return an integer value
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            //Step 1 -  Define a connection to the database by getting
            //          the connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "INSERT INTO SmileUser (usertype, username, fname, lname, email, PasswordHash, salt, IV, TheKey) " +
                "VALUES (@paraUsertype, @paraUsername, @paraFName, @paraLName, @paraEmail, @paraPass, @Salt, @IV, @Key)";
            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraUsertype", u.Usertype);
            sqlCmd.Parameters.AddWithValue("@paraUsername", u.Username);
            sqlCmd.Parameters.AddWithValue("@paraFName", u.FName);
            sqlCmd.Parameters.AddWithValue("@paraLName", u.LName);
            sqlCmd.Parameters.AddWithValue("@paraEmail", u.Email);
            sqlCmd.Parameters.AddWithValue("@paraPass", finalHash);
            sqlCmd.Parameters.AddWithValue("@Salt", salt);
            sqlCmd.Parameters.AddWithValue("@IV", Convert.ToBase64String(IV));
            sqlCmd.Parameters.AddWithValue("@Key", Convert.ToBase64String(Key));


            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }
        public int Update(Smile u)
        {
            int result = 0;
            SqlCommand sqlCmd = new SqlCommand();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            // Step 2 - Instantiate SqlCommand instance to add record 
            //          with INSERT statement
            string sqlStmt = "UPDATE SmileUser SET usertype = @paraUsertype, username = @paraUsername, " +
                "fname = @paraFName, lname = @paraLName where email = @paraEmail ";

            sqlCmd = new SqlCommand(sqlStmt, myConn);

            // Step 3 : Add each parameterised variable with value
            sqlCmd.Parameters.AddWithValue("@paraUsertype", u.Usertype);
            sqlCmd.Parameters.AddWithValue("@paraUsername", u.Username);
            sqlCmd.Parameters.AddWithValue("@paraFName", u.FName);
            sqlCmd.Parameters.AddWithValue("@paraLName", u.LName);
            sqlCmd.Parameters.AddWithValue("@paraEmail", u.Email);
            sqlCmd.Parameters.AddWithValue("@paraPass", u.Pass);

            // Step 4 Open connection the execute NonQuery of sql command   
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }
    }
}