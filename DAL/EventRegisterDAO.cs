using EADPProject.BLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EADPProject.DAL
{
    public class EventRegisterDAO
    {
        public int Insert(EventRegister evr)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "INSERT INTO EventRegister(eventName, eventID, userID, activeStatus)" +
                "VALUES (@paraEventName, @paraEventId, @paraUserId, @paraActiveStatus)";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventName", evr.EventName);
            sqlCmd.Parameters.AddWithValue("@paraEventId", evr.EventId);
            sqlCmd.Parameters.AddWithValue("@paraUserId", evr.UserId);
            sqlCmd.Parameters.AddWithValue("@paraActiveStatus", evr.ActiveStatus);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public List<EventRegister> SelectAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "Select * from EventRegister";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            DataSet ds = new DataSet();

            da.Fill(ds);

            List<EventRegister> evrList = new List<EventRegister>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i = 0; i < rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];
                int registerID = int.Parse(row["id"].ToString());
                string eventName = row["eventName"].ToString();
                int eventID = int.Parse(row["eventID"].ToString());
                string userID = row["userID"].ToString();
                int activeStatus = int.Parse(row["activeStatus"].ToString());
                EventRegister obj = new EventRegister(eventName, eventID, userID, activeStatus, registerID);
                evrList.Add(obj);
            }
            return evrList;
        }

        public List<EventRegister> SelectByEIDUID(int EventID, string UserID)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "Select * from EventRegister where eventID = @paraEventID AND userID = @paraUserID AND activeStatus = 1";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraEventID", EventID);
            da.SelectCommand.Parameters.AddWithValue("@paraUserID", UserID);

            DataSet ds = new DataSet();

            da.Fill(ds);

            List<EventRegister> evrList = new List<EventRegister>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string eventName = row["eventName"].ToString();
                int eventID = int.Parse(row["eventID"].ToString());
                string userID = row["userID"].ToString();
                int registerID = int.Parse(row["id"].ToString());
                int activeStatus = int.Parse(row["activeStatus"].ToString());
                EventRegister ev = new EventRegister(eventName, eventID, userID, activeStatus, registerID);
                evrList.Add(ev);
            }
            else
            {
                evrList = null;
            }
            return evrList;
        }

        public int DeleteRegister(int EventID, string UserID, int ActiveStatus)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE EventRegister SET activeStatus = @paraActiveStatus where eventID = @paraEventID AND userID = @paraUserID AND activeStatus = 1";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventID", EventID);
            sqlCmd.Parameters.AddWithValue("@paraUserID", UserID);
            sqlCmd.Parameters.AddWithValue("@paraActiveStatus", ActiveStatus);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }
    }
}