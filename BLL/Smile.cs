using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADPProject.DAL;

namespace EADPProject.BLL
{
    public class Smile
    {
        // Define class properties
        public string Usertype { get; set; }
        public string Username { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }


        // Default constructor
        public Smile()
        {

        }
        // Define a constructor to initialize all the properties
        public Smile(string usertype, string username, string fname, string lname, string email, string pass)
        {
            Usertype = usertype;
            Username = username;
            FName = fname;
            LName = lname;
            Email = email;
            Pass = pass;
        }

        public int AddSmile()
        {
            SmileDAO dao = new SmileDAO();
            int result = dao.Insert(this);
            return result;
        }
        public int UpdateSmile()
        {
            SmileDAO dao = new SmileDAO();
            int result = dao.Update(this);
            return result;
        }
        public List<Smile> GetAllSmile()
        {
            SmileDAO dao = new SmileDAO();
            return dao.SelectAll();
        }

        public Smile GetSmileById(string email)
        {
            SmileDAO dao = new SmileDAO();
            return dao.SelectById(email);
        }

    }
}