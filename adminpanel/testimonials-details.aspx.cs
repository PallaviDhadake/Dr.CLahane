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
    public string[] ordTestiData = new string[30];
    public string pgTitle;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            GetreviewData(Convert.ToInt32(Request.QueryString["id"]));
        }
        lblId.Visible = false;
    }
    public void GetreviewData(int ReviewIdx)
    {
        try
        {
            using (DataTable dtreview = c.GetDataTable("select * from TestimonialsCLahane where TestId=" + ReviewIdx))

            {
                if (dtreview.Rows.Count > 0)
                {
                    DataRow row = dtreview.Rows[0];
                    lblId.Text = ReviewIdx.ToString();

                    txtPersonNm.Text = row["TestPerson"].ToString();
                    txtDate.Text = Convert.ToDateTime(row["TestDate"]).ToString("dd/MM/yyyy");
                    txtEmail.Text = row["TestEmail"].ToString();
                    txtTesDesc.Text = row["TestInfo"].ToString();
                    txtRating.Text = row["TestRating"].ToString();
                    txtMobNo.Text = row["TestMobileNo"].ToString();
                     
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "GetreviewData", ex.Message.ToString());
            return;
        }
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            c.ExecuteQuery("Delete from TestimonialsCLahane where TestId=" + Request.QueryString["id"]);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('success', 'Testimonials Deleted ');", true);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "CallMyFunction", "waitAndMove('testimonial-master.aspx', 2000);", true);
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "btnDelete_Click", ex.Message.ToString());
            return;
        }
    }



    protected void btnApprove_Click(object sender, EventArgs e)
    {
        try
        {
            //int ApproveFlag = Approveflag.Checked == true ? 1:0;

            c.ExecuteQuery("Update TestimonialsCLahane set ApproveFlag=1 where TestId=" + Request.QueryString["id"]);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('success', 'Testimonials Approved Sucessfully');", true);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "CallMyFunction", "waitAndMove('testimonial-master.aspx', 2000);", true);
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "btnApprove_Click", ex.Message.ToString());
            return;
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("testimonial-master.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            txtTesDesc.Text = txtTesDesc.Text.Trim().Replace("'" ,"");
            txtPersonNm.Text = txtPersonNm.Text.Trim().Replace("'", "");
            txtEmail.Text = txtEmail.Text.Trim().Replace("'", "");
            txtMobNo.Text = txtMobNo.Text.Trim().Replace("'", "");

            if (c.ValidateMobile(txtMobNo.Text) == false)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('warning', 'Please Enter Valid Mobile Number');", true);
                return;
            }
            if (c.EmailAddressCheck(txtEmail.Text) == false)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('warning', 'Please Enter Valid Email Address');", true);
                return;
            }

            c.ExecuteQuery("Update TestimonialsCLahane Set TestInfo='" + txtTesDesc.Text + "', TestPerson='" + txtPersonNm.Text + "', TestMobileNo='" + txtMobNo.Text + "', TestEmail='" + txtEmail.Text + "' Where TestId=" + Request.QueryString["id"]);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('success', 'Testimonials Updated Sucessfully');", true);

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "CallMyFunction", "waitAndMove('testimonial-master.aspx', 2000);", true);

        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "myScript", "TostTrigger('error', 'Error Occoured While Processing');", true);
            c.ErrorLogHandler(this.ToString(), "btnUpdate_Click", ex.Message.ToString());
            return;
        }
    }
}