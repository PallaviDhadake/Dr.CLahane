using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Text;


public partial class _Default : System.Web.UI.Page
{
    iClass c = new iClass();
    public string rootPath, currentYear;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rootPath = c.ReturnHttp();
            if (Request.QueryString["act"] != null)
            {
                if (Request.QueryString["act"] == "logout")
                {
                    Session["adminMaster"] = null;
                    Response.Redirect(rootPath, false);
                }
            }

            currentYear = DateTime.Now.Year.ToString();
        }
    }

    [WebMethod]
    public static string SaveTestimonials(Testimonials custinfo)
    {
        try
        {
            iClass c = new iClass();
            int MaxId = c.NextId("TestimonialsCLahane", "TestId");

            string testimonialsName = custinfo.TestPerson.ToString().Trim().Replace("'", "");
            string testimonialsInfo = custinfo.TestInfo.ToString().Trim().Replace("'", "");

            int starRating = 0;

            if (HttpContext.Current.Session["testRating"] != null)
            {
                starRating = Convert.ToInt32(HttpContext.Current.Session["testRating"].ToString());
            }

            c.ExecuteQuery("Insert Into TestimonialsCLahane(TestId, TestDate, TestInfo, TestPerson, TestMobileNo, TestEmail, TestRating, ApproveFlag, delMark) " +
                " Values(" + MaxId + ", '" + DateTime.Now + "', '" + testimonialsInfo + "', '" + testimonialsName + "', '" + custinfo.TestMobileNo +
                "', '" + custinfo.TestEmail + "', " + starRating + ", 0, 0)");

            HttpContext.Current.Session["testRating"] = null;


            return "1";
        }
        catch (Exception ex)
        {
            return ex.Message.ToString();
        }
    }

    [WebMethod]
    public static string GetRating(string ratingValue)
    {
        HttpContext.Current.Session["testRating"] = ratingValue;
        return HttpContext.Current.Session["testRating"].ToString();
    }

    public string GetTestimonials()
    {
        try
        {
            StringBuilder strMarkup = new StringBuilder();
            using (DataTable dttestimonials = c.GetDataTable("Select TOP 3 TestId, Convert(varchar(20),TestDate,103) as TestDate, LEFT(TestInfo, 120) as TestInfo, TestPerson, TestRating From TestimonialsCLahane Where delMark=0 AND ApproveFlag=1 Order By TestId DESC"))
            {
                if (dttestimonials.Rows.Count > 0)
                {
                    foreach (DataRow row in dttestimonials.Rows)
                    {
                        strMarkup.Append("<div class=\"bubble6\">");
                        strMarkup.Append("<div class=\"bubble6-arrow\"></div>");
                        strMarkup.Append("<div class=\"pad_15\">");
                        if (row["TestRating"] != DBNull.Value && row["TestRating"] != null && row["TestRating"].ToString() != "")
                        {
                            switch (row["TestRating"].ToString())
                            {

                                case "1":
                                    strMarkup.Append("<img src=\"images/icons/1-star.png\"/>");
                                    break;
                                case "2":
                                    strMarkup.Append("<img src=\"images/icons/2-star.png\"/>");
                                    break;
                                case "3":
                                    strMarkup.Append("<img src=\"images/icons/3-star.png\"/>");
                                    break;
                                case "4":
                                    strMarkup.Append("<img src=\"images/icons/4-star.png\"/>");
                                    break;
                                case "5":
                                    strMarkup.Append("<img src=\"images/icons/5-star.png\"/>");
                                    break;

                            }
                        }
                        strMarkup.Append("<span class=\"space5\"></span>");
                        strMarkup.Append("<span class=\"semiMedium bold\">" + row["TestPerson"].ToString() + "</span>");
                        strMarkup.Append("<span class=\"reviewdt themeClrPrime\"> " + row["TestDate"].ToString() + "</span>");
                        strMarkup.Append("<span class=\"space10\"></span>");
                        strMarkup.Append("<p class=\"small line-ht-5 testQuote\">" + row["TestInfo"].ToString() + "</p>");
                        strMarkup.Append("<span class=\"space10\"></span>");
                        strMarkup.Append("</div>");
                        strMarkup.Append("</div>");
                        strMarkup.Append("<span class=\"space30\"></span>");
                        strMarkup.Append("<span class=\"float_clear\"></span>");

                    }
                    return strMarkup.ToString();
                }
                else
                {
                    return "<div class=\"themeBgPrime\"><div class=\"pad_10\"><span class=\"clrWhite semiMedium fontRegular\">No Testimonials to display.</span></div></div>";
                }
            }
        }
        catch (Exception ex)
        {
            return ex.Message.ToString();
        }
    }


}