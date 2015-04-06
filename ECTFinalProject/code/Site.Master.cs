using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECTFinalProject.code
{
    public partial class Site : System.Web.UI.MasterPage

        
    {

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void LogOut(object sender, EventArgs e)
        {
           
            Session.Clear();
            Response.Redirect("login.aspx");
        }


        //To provide easy access to cart number in header for content pages
        public String CartText{

            get { return cart.Text; }

            set { cart.Text = "Cart(" + value + ")"; }
    }

        //To provide easy access to user name in the header for content pages
        public String UserNameHeader
        {
            get { return nameLbl.Text; }

            set { nameLbl.Text = "Hello, " + value + "!"; }
        }

        
      protected void cart_Click(object sender, EventArgs e)
        {
            if (Session["LoggedInId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("CheckOut.aspx");
            }
        }
       
    }
}