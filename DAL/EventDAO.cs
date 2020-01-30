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
    public class EventDAO
    {
        public List<Event> SelectAll()
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "Select * from Event";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            DataSet ds = new DataSet();

            da.Fill(ds);

            List<Event> evList = new List<Event>();
            int rec_cnt = ds.Tables[0].Rows.Count;
            for (int i = 0; i < rec_cnt; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];
                int eventID = int.Parse(row["eventID"].ToString());
                string eventName = row["eventName"].ToString();
                string eventDescription = row["eventDescription"].ToString();
                string eventCost = row["eventCost"].ToString();
                string eventLocation = row["eventLocation"].ToString();
                string eventDate = row["eventDate"].ToString();
                string eventStartTime = row["eventStartTime"].ToString();
                string eventEndTime = row["eventEndTime"].ToString();
                string pictureURL = row["pictureURL"].ToString();
                string latitude = row["latitude"].ToString();
                string longitude = row["longitude"].ToString();
                int numberOfJoins = int.Parse(row["numberOfJoins"].ToString());
                int creatorID = int.Parse(row["creatorID"].ToString());
                int activeStatus = int.Parse(row["activeStatus"].ToString());
                int hiddenStatus = int.Parse(row["hiddenStatus"].ToString());
                Event obj = new Event(eventName, eventDescription, eventCost, eventLocation, eventDate,
                    eventStartTime, eventEndTime, pictureURL, latitude, longitude, numberOfJoins, creatorID, activeStatus, hiddenStatus, eventID);
                evList.Add(obj);
            }
            return evList;
        }

        public int Insert(Event ev)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "INSERT INTO Event(eventName, eventDescription, eventCost, eventLocation, eventDate, " +
                "eventStartTime, eventEndTime, pictureURL, latitude, longitude, numberOfJoins, creatorID, activeStatus, hiddenStatus)" +
            "VALUES (@paraEventName, @paraEventDescription, @paraEventCost, @paraEventLocation, @paraEventDate, " +
            "@paraEventStartTime, @paraEventEndTime, @paraPictureURL, @paraLatitude, @paraLongitude, @paraNumberOfJoins, @paraCreatorID, @paraActiveStatus, @paraHiddenStatus)";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventName", ev.EventName);
            sqlCmd.Parameters.AddWithValue("@paraEventDescription", ev.EventDescription);
            sqlCmd.Parameters.AddWithValue("@paraEventCost", ev.EventCost);
            sqlCmd.Parameters.AddWithValue("@paraEventLocation", ev.EventLocation);
            sqlCmd.Parameters.AddWithValue("@paraEventDate", ev.EventDate.ToString());
            sqlCmd.Parameters.AddWithValue("@paraEventStartTime", ev.EventStartTime);
            sqlCmd.Parameters.AddWithValue("@paraEventEndTime", ev.EventEndTime);
            sqlCmd.Parameters.AddWithValue("@paraPictureURL", ev.PictureURL);
            sqlCmd.Parameters.AddWithValue("@paraLatitude", ev.Latitude);
            sqlCmd.Parameters.AddWithValue("@paraLongitude", ev.Longitude);
            sqlCmd.Parameters.AddWithValue("@paraNumberOfJoins", ev.NumberOfJoins);
            sqlCmd.Parameters.AddWithValue("@paraCreatorID", ev.CreatorID);
            sqlCmd.Parameters.AddWithValue("@paraActiveStatus", ev.ActiveStatus);
            sqlCmd.Parameters.AddWithValue("@paraHiddenStatus", ev.HiddenStatus);
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public Event SelectById(int eventID)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "Select * from Event where EventID = @paraEventID";
            SqlDataAdapter da = new SqlDataAdapter(sqlstmt, myConn);

            da.SelectCommand.Parameters.AddWithValue("@paraEventID", eventID);

            DataSet ds = new DataSet();

            da.Fill(ds);

            Event ev = null;
            int rec_cnt = ds.Tables[0].Rows.Count;
            if (rec_cnt == 1)
            {
                DataRow row = ds.Tables[0].Rows[0];
                string eventName = row["eventName"].ToString();
                string eventDescription = row["eventDescription"].ToString();
                string eventCost = row["eventCost"].ToString();
                string eventLocation = row["eventLocation"].ToString();
                string eventDate = row["eventDate"].ToString();
                string eventStartTime = row["eventStartTime"].ToString();
                string eventEndTime = row["eventEndTime"].ToString();
                string pictureURL = row["pictureURL"].ToString();
                string latitude = row["latitude"].ToString();
                string longitude = row["longitude"].ToString();
                int numberOfJoins = int.Parse(row["numberOfJoins"].ToString());
                int creatorID = int.Parse(row["creatorID"].ToString());
                int activeStatus = int.Parse(row["activeStatus"].ToString());
                int hiddenStatus = int.Parse(row["hiddenStatus"].ToString());
                ev = new Event(eventName, eventDescription, eventCost, eventLocation, eventDate, eventStartTime, eventEndTime, pictureURL,
                    latitude, longitude, numberOfJoins, creatorID, activeStatus, hiddenStatus);
            }
            else
            {
                ev = null;
            }
            return ev;
        }

        public int Update(Event ev)
        {

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE Event SET eventName = @paraEventNames, eventDescription = @paraEventDescriptions, eventCost = @paraEventCosts," +
                " eventLocation = @paraEventLocations, eventDate = @paraEventDates, eventStartTime = @paraEventStartTimes, " +
                "eventEndTime = @paraEventEndTimes, pictureURL = @paraPictureURLs, latitude = @paraLatitudes, longitude = @paraLongitudes" +
                ", numberOfJoins = @paraNumberOfJoinss, creatorID = @paraCreatorIDs, activeStatus = @paraActiveStatuss, hiddenStatus = @paraHiddenStatuss where eventID = @paraEventIDs";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventIDs", ev.EventId);
            sqlCmd.Parameters.AddWithValue("@paraEventNames", ev.EventName);
            sqlCmd.Parameters.AddWithValue("@paraEventDescriptions", ev.EventDescription);
            sqlCmd.Parameters.AddWithValue("@paraEventCosts", ev.EventCost);
            sqlCmd.Parameters.AddWithValue("@paraEventLocations", ev.EventLocation);
            sqlCmd.Parameters.AddWithValue("@paraEventDates", ev.EventDate);
            sqlCmd.Parameters.AddWithValue("@paraEventStartTimes", ev.EventStartTime);
            sqlCmd.Parameters.AddWithValue("@paraEventEndTimes", ev.EventEndTime);
            sqlCmd.Parameters.AddWithValue("@paraPictureURLs", ev.PictureURL);
            sqlCmd.Parameters.AddWithValue("@paraLatitudes", ev.Latitude);
            sqlCmd.Parameters.AddWithValue("@paraLongitudes", ev.Longitude);
            sqlCmd.Parameters.AddWithValue("@paraNumberOfJoinss", ev.NumberOfJoins);
            sqlCmd.Parameters.AddWithValue("@paraCreatorIDs", ev.CreatorID);
            sqlCmd.Parameters.AddWithValue("@paraActiveStatuss", ev.ActiveStatus);
            sqlCmd.Parameters.AddWithValue("@paraHiddenStatuss", ev.HiddenStatus);
            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public int Delete(int EventId, int ActiveStatus)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE Event SET activeStatus = @paraActiveStatus where eventID = @paraEventID";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventID", EventId);
            sqlCmd.Parameters.AddWithValue("@paraActiveStatus", ActiveStatus);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }

        public int UpdateGoing(int EventID, int Joins)
        {
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);

            string sqlstmt = "UPDATE Event SET numberOfJoins = @paraJoins where eventID = @paraEventID";

            int result = 0;
            SqlCommand sqlCmd = new SqlCommand(sqlstmt, myConn);

            sqlCmd.Parameters.AddWithValue("@paraEventID", EventID);
            sqlCmd.Parameters.AddWithValue("@paraJoins", Joins);

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();
            myConn.Close();
            return result;
        }
    }
}