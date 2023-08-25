using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;

public partial class adminpanel_dashboard : System.Web.UI.Page
{
    iClass c = new iClass();
    public string[] arrCounts = new string[5]; //0
    protected void Page_Load(object sender, EventArgs e)
    {
        GetCount();
    }

    protected void GetCount()
    {
        try
        {
            arrCounts[0] = c.returnAggregate("Select Count(TestId) From TestimonialsCLahane Where delMark=0").ToString();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "GetCount", ex.Message.ToString());
            return;

        }
    }
}