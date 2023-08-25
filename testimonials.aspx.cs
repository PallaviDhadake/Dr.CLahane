using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
public partial class testimonials : System.Web.UI.Page
{
    iClass c = new iClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        GetTestimonials();
    }

    public string GetTestimonials()
    {
        try
        {
            StringBuilder strMarkup = new StringBuilder();
            using (DataTable dttestimonials = c.GetDataTable("Select TestId, Convert(varchar(20),TestDate,103) as TestDate, TestInfo, TestPerson, TestRating From TestimonialsCLahane Where delMark=0 AND ApproveFlag=1 Order By TestId DESC"))
            {
                if (dttestimonials.Rows.Count > 0)
                {
                    foreach (DataRow row in dttestimonials.Rows)
                    {
                        strMarkup.Append("<span class=\"semiMedium bold\">" + row["TestPerson"].ToString() + "</span><span class=\"reviewdt themeClrPrime\"> " + row["TestDate"].ToString() + "</span>");
                        strMarkup.Append("<span class=\"space10\"></span>");

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
                        strMarkup.Append("<p class=\"small line-ht-5\">" + row["TestInfo"].ToString() + "</p>");
                        strMarkup.Append("<span class=\"greyLine\"></span>");
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