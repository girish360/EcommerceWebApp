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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Session.Clear();
            

        }



        protected void login(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                using (ECTDBContext context = new ECTDBContext())
                {
                    var pwdHash = SecuredPassword.GenerateHash(txtPassword.Text);
                    var user = (from u in context.Customers
                                where u.UserName == txtUserName.Text && u.Password == pwdHash
                                select u).FirstOrDefault();
                    if (user == null)
                    {
                        errorMessage.Visible = true;
                    }
                    else
                    {
                        Session["LoggedInId"] = user.ID.ToString();
                        Session["FirstName"] = user.FirstName;
                        Session["LastName"] = user.LastName;
                        Session["UserName"] = user.UserName;

                        var userOrder = (from order in context.Orders
                                         where order.CustomerID == user.ID && order.IsCart == "true"
                                         select order).FirstOrDefault();
                        //if user has existing cart, restore cart number at top of page and store session variable
                        if (userOrder != null)
                        {
                            var cart = (from od in context.OrderDetails
                                        where od.OrderID == userOrder.ID
                                        select od.Quantity).ToList();
                            int cartCount = cart.Sum();
                            Session["cartCount"] = cartCount.ToString();

                        }
                        else
                        {
                            Session["cartCount"] = "0";
                        }

                        Response.Redirect("Home.aspx");
                    }



                }
            }
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                using (ECTDBContext entities = new ECTDBContext())
                {
                    var member = entities.Customers.Create();
                    var address = entities.Addresses.Create();
                    member.FirstName = firstNameTxt.Text;
                    member.LastName = lastNameTxt.Text;
                    member.Email = emailTxt.Text;
                    member.UserName = userNameTxt2.Text;
                    member.Password = SecuredPassword.GenerateHash(passwordTxt2.Text);
                    member.DateRegistered = DateTime.Now.Date;
                    entities.Customers.Add(member);
                    entities.SaveChanges();

                    var pwdHash = SecuredPassword.GenerateHash(passwordTxt2.Text);
                    var user = (from u in entities.Customers
                                where u.UserName == userNameTxt2.Text && u.Password == pwdHash
                                select u).FirstOrDefault();
                    address.CustomerID = user.ID;
                    address.Address1 = addressTxt.Text;
                    address.City = cityTxt.Text;
                    address.State = stateTxt.Text;
                    address.AddressType = "Billing";
                    entities.Addresses.Add(address);
                    entities.Addresses.Add(address);
                    entities.SaveChanges();
                    clearTextBoxes(registerControl);
                   registerSuccessLbl.Visible = true;
                    
                    
                }
                
               }

        }


        private void clearTextBoxes(Control c)
        {
            foreach (Control control in c.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = "";
                }

            }
        }
    }
}

