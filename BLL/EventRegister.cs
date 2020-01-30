using EADPProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EADPProject.BLL
{
    public class EventRegister
    {
        public int EventRegisterId { get; set; }
        public string EventName { get; set; }
        public int EventId { get; set; }
        public int ActiveStatus { get; set; }
        public string UserId { get; set; }

        public EventRegister()
        {

        }

        public EventRegister(string eventName, int eventId, string userId, int activeStatus, int eventRegisterId = -1)
        {
            EventRegisterId = eventRegisterId;
            EventName = eventName;
            EventId = eventId;
            UserId = userId;
            ActiveStatus = activeStatus;
        }

        public int RegisterEvent()
        {
            EventRegisterDAO dao = new EventRegisterDAO();
            int result = dao.Insert(this);
            return result;
        }

        public List<EventRegister> GetAllRegisters()
        {
            EventRegisterDAO dao = new EventRegisterDAO();
            return dao.SelectAll();
        }

        public List<EventRegister> GetRegistersSpecific(int eventID, string userID)
        {
            EventRegisterDAO dao = new EventRegisterDAO();
            return dao.SelectByEIDUID(eventID, userID);
        }

        public int DeleteReg(int eid, string uid, int status)
        {
            EventRegisterDAO dao = new EventRegisterDAO();
            int result = dao.DeleteRegister(eid, uid, status);
            return result;
        }
    }
}