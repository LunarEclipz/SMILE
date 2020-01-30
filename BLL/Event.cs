using EADPProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EADPProject.BLL
{
    public class Event
    {
        public string EventName { get; set; }
        public string EventDescription { get; set; }
        public string EventCost { get; set; }
        public string EventLocation { get; set; }
        public string EventDate { get; set; }
        public string EventStartTime { get; set; }
        public string EventEndTime { get; set; }
        public string PictureURL { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public int NumberOfJoins { get; set; }
        public int CreatorID { get; set; }
        public int ActiveStatus { get; set; }
        public int HiddenStatus { get; set; }
        public int EventId { get; set; }

        public Event()
        {

        }

        public Event(string eventName, string eventDescription, string eventCost, string eventLocation,
        string eventDate, string eventStartTime, string eventEndTime, string pictureURL, string latitude, string longitude,
        int numberOfJoins, int creatorID, int activeStatus, int hiddenStatus, int eventId = -1)
        {
            EventName = eventName;
            EventDescription = eventDescription;
            EventCost = eventCost;
            EventLocation = eventLocation;
            EventDate = eventDate;
            EventStartTime = eventStartTime;
            EventEndTime = eventEndTime;
            PictureURL = pictureURL;
            Latitude = latitude;
            Longitude = longitude;
            NumberOfJoins = numberOfJoins;
            CreatorID = creatorID;
            ActiveStatus = activeStatus;
            HiddenStatus = hiddenStatus;
            EventId = eventId;
        }

        public List<Event> GetAllEvents()
        {
            EventDAO dao = new EventDAO();
            return dao.SelectAll();
        }

        public int AddEvent()
        {
            EventDAO dao = new EventDAO();
            int result = dao.Insert(this);
            return result;
        }

        public Event GetEventById(int eventID)
        {
            EventDAO dao = new EventDAO();
            return dao.SelectById(eventID);
        }

        public int UpdateEvent()
        {
            EventDAO dao = new EventDAO();
            int result = dao.Update(this);
            return result;
        }

        public int DeleteEvent(int id, int status)
        {
            EventDAO dao = new EventDAO();
            int result = dao.Delete(id, status);
            return result;
        }

        public int UpdateJoins(int id, int joins)
        {
            EventDAO dao = new EventDAO();
            int result = dao.UpdateGoing(id, joins);
            return result;
        }
    }
}