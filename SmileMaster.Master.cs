﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EADPProject
{
    public partial class SmileMaster : System.Web.UI.MasterPage
    {
        public string type;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudNo"] != null)
            {
                type = Session["type"].ToString();
            }
        }
    }
}