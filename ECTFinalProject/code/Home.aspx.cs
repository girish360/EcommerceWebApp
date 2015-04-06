using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECTFinalProject.models;
using System.Web.UI.HtmlControls;

namespace ECTFinalProject.code
{
    public partial class Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                String cartCount = Session["cartCount"].ToString();
                Master.CartText = cartCount;
                String userName = Session["UserName"].ToString();
                Master.UserNameHeader = userName;
                Master.FindControl("signOut").Visible = true;
                
            }
        }

        protected void sandwichBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemPage.aspx");

        }

        protected void cartBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");

        }

        protected void accountBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }
    }
}
