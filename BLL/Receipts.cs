using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADPProject.DAL;

namespace EADPProject.BLL
{
    public class Receipts
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Hiree { get; set; }
        public string Location1 { get; set; }
        public string Location2 { get; set; }
        public string Location3 { get; set; }
        public string Location4 { get; set; }
        public string Location5 { get; set; }
        public string Location6 { get; set; }
        public string Location7 { get; set; }
        public DateTime DateofHire { get; set; }
        public string PreferredPhotographer { get; set; }
        public string Remarks { get; set; }
        public string HCType { get; set; }
        public double Quantity { get; set; }
        public string SC { get; set; }
        public string Price { get; set; }

        public Receipts()
        {

        }

        public Receipts(string Name, string Hiree, string Location1, string Location2, string Location3, string Location4,
            string Location5, string Location6, string Location7, DateTime DateofHire, string PreferredPhotographer,
            string Remarks, string HCType, double Quantity, string SC, string Price)
        {
            this.Name = Name;
            this.Hiree = Hiree;
            this.Location1 = Location1;
            this.Location2 = Location2;
            this.Location3 = Location3;
            this.Location4 = Location4;
            this.Location5 = Location5;
            this.Location6 = Location6;
            this.Location7 = Location7;
            this.DateofHire = DateofHire;
            this.PreferredPhotographer = PreferredPhotographer;
            this.Remarks = Remarks;
            this.HCType = HCType;
            this.Quantity = Quantity;
            this.SC = SC;
            this.Price = Price;

        }

        public Receipts(int Id, string Name, string Hiree, string Location1, string Location2, string Location3, string Location4,
            string Location5, string Location6, string Location7, DateTime DateofHire, string PreferredPhotographer,
            string Remarks, string HCType, double Quantity, string SC, string Price)
        {
            this.Id = Id;
            this.Name = Name;
            this.Hiree = Hiree;
            this.Location1 = Location1;
            this.Location2 = Location2;
            this.Location3 = Location3;
            this.Location4 = Location4;
            this.Location5 = Location5;
            this.Location6 = Location6;
            this.Location7 = Location7;
            this.DateofHire = DateofHire;
            this.PreferredPhotographer = PreferredPhotographer;
            this.Remarks = Remarks;
            this.HCType = HCType;
            this.Quantity = Quantity;
            this.SC = SC;
            this.Price = Price;

        }

        public int AddReceipts()
        {
            ReceiptsDAO dao = new ReceiptsDAO();
            int result = dao.Insert(this);
            return result;
        }

        public List<Receipts> GetAllReceipts()
        {
            ReceiptsDAO dao = new ReceiptsDAO();
            return dao.SelectAll();
        }

        public int UpdateReceipts()
        {
            ReceiptsDAO dao = new ReceiptsDAO();
            int result = dao.Update(this);
            return result;
        }

        public Receipts GetReceiptsById(int id)
        {
            ReceiptsDAO dao = new ReceiptsDAO();
            return dao.SelectById(id);
        }

    }
}