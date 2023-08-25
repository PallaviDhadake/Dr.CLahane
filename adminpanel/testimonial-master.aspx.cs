using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class adminpanel_Default2 : System.Web.UI.Page
{
    iClass c = new iClass();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        FillGrid();
    }

    private void FillGrid()
    {
        try
        {
            using (DataTable dtNws = c.GetDataTable("Select TestId, Convert(varchar(20), TestDate, 103) as TestDate, TestPerson, TestEmail, TestMobileNo, TestRating  From TestimonialsCLahane Where delMark=0"))
            {
                gvTestimonials.DataSource = dtNws;
                gvTestimonials.DataBind();

                if (dtNws.Rows.Count > 0)
                {
                    gvTestimonials.UseAccessibleHeader = true;
                    gvTestimonials.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "FillGrid", ex.Message.ToString());
            return;
        }
    }

    protected void gvTestimonials_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Literal litAnch = (Literal)e.Row.FindControl("litAnch");
                litAnch.Text = "<a href=\"testimonials-details.aspx?id=" + e.Row.Cells[0].Text + "\" class=\"gView\" title=\"View/Edit\"></a>";

                object status = c.GetReqData("TestimonialsCLahane", "ApproveFlag", "TestId=" + e.Row.Cells[0].Text);

                Literal litStatus = (Literal)e.Row.FindControl("litstatus");
                switch (status.ToString())
                {
                    case "0":
                        litStatus.Text = "<div class=\"ordNew\">Pending</div>";
                        break;
                    case "1":
                        litStatus.Text = "<div class=\"ordDelivered\">Approved</div>";
                        break;
                }
            }
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "gvTestimonials_RowDataBound", ex.Message.ToString());
            return;
        }
    }
}